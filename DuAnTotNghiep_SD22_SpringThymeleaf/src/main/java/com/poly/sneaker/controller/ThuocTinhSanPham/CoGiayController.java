package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.sevice.CoGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
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

    @GetMapping("/co-giay/add")
    public String hienthiFormThemCoGiay(Model model) {
        model.addAttribute("coGiay", new CoGiay());
        return "/admin/ThuocTinhSanPham/addCoGiayPage";
    }

    @PostMapping("/co-giay/add")
    public String themCoGiay(CoGiay coGiay){
        coGiayService.add(coGiay);
        return "redirect:/admin/co-giay";
    }

    @GetMapping("/co-giay/update/{id}")
    public String hienThiFormUpdate(@PathVariable("id") Long id, Model model) {
        CoGiay coGiay = coGiayService.finById(id);
        if (coGiay == null) {
            return "redirect:/admin/co-giay";
        }
        model.addAttribute("coGiay", coGiay);
        return "/admin/ThuocTinhSanPham/updateCoGiayPage";
    }

    @PostMapping("/co-giay/update")
    public String update(@ModelAttribute CoGiay coGiay) {
        coGiay.setNgayCapNhat(new Date());
        coGiayService.update(coGiay.getId(), coGiay);
        return "redirect:/admin/co-giay";
    }
}
