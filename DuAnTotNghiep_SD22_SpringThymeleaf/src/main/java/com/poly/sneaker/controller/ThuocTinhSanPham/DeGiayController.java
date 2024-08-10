package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.sevice.DeGiayService;
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
public class DeGiayController {

    @Autowired
    DeGiayService deGiayService;

    @GetMapping("/de-giay")
    public String hienThiDeGiay(Model model){
        List<DeGiay> deGiays = deGiayService.getAll();
        model.addAttribute("deGiays", deGiays);
        return "/admin/ThuocTinhSanPham/deGiayPage";
    }

    @GetMapping("/de-giay/add")
    public String hienthiFormThemMoi(Model model) {
        model.addAttribute("deGiay", new DeGiay());
        return "/admin/ThuocTinhSanPham/addDeGiayPage";
    }

    @PostMapping("/de-giay/add")
    public String themMoi(DeGiay deGiay){
        deGiayService.add(deGiay);
        return "redirect:/admin/de-giay";
    }

    @GetMapping("/de-giay/update/{id}")
    public String hienThiFormUpdate(@PathVariable("id") Long id, Model model) {
        DeGiay deGiay = deGiayService.finById(id);
        if (deGiay == null) {
            return "redirect:/admin/de-giay";
        }
        model.addAttribute("deGiay", deGiay);
        return "/admin/ThuocTinhSanPham/updateDeGiayPage";
    }

    @PostMapping("/de-giay/update")
    public String update(@ModelAttribute DeGiay deGiay) {
        deGiay.setNgayCapNhat(new Date());
        deGiayService.update(deGiay.getId(), deGiay);
        return "redirect:/admin/de-giay";
    }
}
