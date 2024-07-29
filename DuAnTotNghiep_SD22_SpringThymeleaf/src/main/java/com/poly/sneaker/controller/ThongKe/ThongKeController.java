package com.poly.sneaker.controller.ThongKe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThongKeController {

    @GetMapping("/admin/thong-ke")
    public String hienThiHoaDon() {
        return "admin/ThongKe/ThongKe";
    }


}
