package com.poly.sneaker.controller.TaiKhoan.NhanVien;

import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.sevice.NhanVienSevice;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class NhanVienControler {
     @Autowired
    private NhanVienSevice sevice;


     @GetMapping("/nhan-vien")
    public String HienThi(Model model){

     model.addAttribute("lstNv",sevice.getallNhanVien());
     return "admin/NhanVien/NhanVien";
    }

    @GetMapping("/addNhanVien")
    public String NhanVienadd(Model model){
        NhanVien nv = new NhanVien();
        model.addAttribute("nv",nv);
        return "admin/NhanVien/NhanVienAdd";
    }

    @PostMapping("/SaveNhanVien")
    public String addNhanVien(@Valid @ModelAttribute("nhanVien") NhanVien nv, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/NhanVien/NhanVienAdd";
        }

        nv.setNgaytao(java.time.LocalDateTime.now());
        nv.setNgaycapnhap(java.time.LocalDateTime.now());
        sevice.Add(nv);
        return "redirect:/nhan-vien";
    }
    @GetMapping("/UpdateNhanVien/{id}") //
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        NhanVien employee = sevice.findById(id);
        model.addAttribute("nv", employee);
        return "admin/NhanVien/NhanVienUpdate";
    }
//    @PutMapping("/UpdateNhanVien")
//    public String Update(@Valid @ModelAttribute("nhanVien") NhanVien nv, BindingResult result, Model model){
//         sevice.update()
//    }

}
