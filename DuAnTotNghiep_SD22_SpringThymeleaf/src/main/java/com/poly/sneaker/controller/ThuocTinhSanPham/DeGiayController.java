package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.sevice.DeGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class DeGiayController {

    @Autowired
    DeGiayService deGiayService;

    @GetMapping("/de-giay")
    public String hienThiDeGiay(Model model){
        List<DeGiay> deGiays = deGiayService.getAll();
        model.addAttribute("deGiays", deGiays);
        return "/admin/ThuocTinhSanPham/deGiayPage";
    }
}
