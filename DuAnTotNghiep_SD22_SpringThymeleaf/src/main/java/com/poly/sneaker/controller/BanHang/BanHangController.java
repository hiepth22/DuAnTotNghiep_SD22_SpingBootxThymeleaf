package com.poly.sneaker.controller.BanHang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BanHangController {

    @GetMapping("/admin/ban-hang-tai-quay")
    public String hienThiHoaDon() {
        return "admin/BanHangTaiQuay/BanHang";
    }

}
