package com.poly.sneaker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class HomeController {

    @GetMapping("/home")
    public String index() {
        return "admin/index"; // Tên view (template)
    }
}
