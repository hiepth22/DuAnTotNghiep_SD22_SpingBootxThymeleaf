package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.sevice.CoGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CoGiayController {

    @Autowired
    CoGiayService coGiayService;

    @GetMapping("/co-giay")
    public String hienThiCoGiay(Model model){
        List<CoGiay> coGiays = coGiayService.getAll();
        model.addAttribute("coGiays", coGiays);
        return "/admin/ThuocTinhSanPham/coGiayPage";
    }
}
