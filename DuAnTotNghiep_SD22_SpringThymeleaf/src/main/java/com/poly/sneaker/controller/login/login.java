package com.poly.sneaker.controller.login;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import com.poly.sneaker.sevice.KhachHangService;
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
    @Autowired
    private KhachHangService service;

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

    @PostMapping("/loginadd")
    public String loginadd(@RequestParam(name = "ten") String ten,
                           @RequestParam(name = "email") String email,
                           @RequestParam(name = "matKhau") String matKhau,
                           @RequestParam(name = "matKhaulai") String matKhaulai,
                           Model model) {
        if (matKhau.equals(matKhaulai)) {
            KhachHang kh = new KhachHang();
            kh.setTen(ten);
            kh.setEmail(email);
            kh.setMatKhau(matKhau);
            kh.setTrangThai(1);
            kh.setNgaytao(java.time.LocalDateTime.now());
            kh.setNgaycapnhap(java.time.LocalDateTime.now());
            service.Add(kh);
            return "Login/login";
        }
        else {
            return "Login/login";
        }
//        model.addAttribute("error", true);
//        return "Login/login";
    }
    @PostMapping("/laylaimk")
    public String laylaimk(@RequestParam(name = "email") String email,
                           @RequestParam(name = "ma") String ma,
                           Model model) {
        return "Login/login";
    }
    @PostMapping("/laylaima")
    public String laylaima(@RequestParam(name = "email") String email,
                           @RequestParam(name = "ma") String ma,
                           Model model) {
        return "Login/login";
    }
}
