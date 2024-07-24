package com.poly.sneaker.controller.GioHang;

import com.poly.sneaker.entity.KhachHang;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GioHangController {

    @GetMapping("/cart")
    public String hienThiHoaDon(HttpSession session) {

        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang != null) {

            return "client/GioHangClient";
        }
        return "redirect:/login";
    }
}
