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
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class NhanVienControler {
     @Autowired
    private NhanVienSevice sevice;

    @GetMapping("/nhanvien")
    public String HienThinv(){
        return "admin/NhanVien/NhanVienIndext";
    }

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
        return "redirect:/admin/nhan-vien";
    }
    @GetMapping("/UpdateNhanVien/{id}") //
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        NhanVien employee = sevice.findById(id);
        model.addAttribute("nv", employee);
        return "admin/NhanVien/NhanVienUpdate";
    }
    @PostMapping("/updateNhanVien/{id}")
    public String updateNhanVien(@PathVariable("id") Long id, @Valid @ModelAttribute("nv") NhanVien nv, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/NhanVien/NhanVienUpdate";
        }

        NhanVien updatedNv = sevice.update(id, nv);
        if (updatedNv != null) {
            return "redirect:/admin/nhan-vien";
        } else {
            return "redirect:/admin/nhan-vien";
        }
    }
    @GetMapping("/DetailNhanVien/{id}")
    public String chiTietNhanVien(@PathVariable("id") Long id, Model model) {
        Optional<NhanVien> optionalNhanVien = Optional.ofNullable(sevice.findById(id));
        if (optionalNhanVien.isPresent()) {
            model.addAttribute("nv", optionalNhanVien.get());
            return "admin/NhanVien/NhanVienDetail";
        } else {
            return "redirect:/admin/nhan-vien";
        }
    }

}
