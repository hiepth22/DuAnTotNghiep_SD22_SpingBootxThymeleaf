package com.poly.sneaker.controller.login;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("")
public class login {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "Login/login";
    }

    @PostMapping("/logincheck")
    public String loginSubmit(@RequestParam(name = "email") String email,
                              @RequestParam(name = "matKhau") String matKhau,
                              Model model) {
        List<KhachHang> lst = khachHangRepository.findByEmail(email);
        if (!lst.isEmpty()) {
            KhachHang foundKhachHang = lst.get(0);
            if (matKhau.equals(foundKhachHang.getMatKhau())) {
                model.addAttribute("khachHang", foundKhachHang);
                return "client/viewClient";
            }
        }
        model.addAttribute("error", true);
        return "Login/login";
    }
}
