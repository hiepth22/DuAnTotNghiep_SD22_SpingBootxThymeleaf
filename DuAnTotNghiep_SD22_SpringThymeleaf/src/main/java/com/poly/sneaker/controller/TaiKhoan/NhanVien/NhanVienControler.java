package com.poly.sneaker.controller.TaiKhoan.NhanVien;

import com.poly.sneaker.sevice.NhanVienSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NhanVienControler {
     @Autowired
    private NhanVienSevice sevice;

     @GetMapping("/nhan-vien")
    public String HienThi(Model model){
     model.addAttribute("lstNv",sevice.getallNhanVien());
     return "admin/NhanVien";
    }
}
