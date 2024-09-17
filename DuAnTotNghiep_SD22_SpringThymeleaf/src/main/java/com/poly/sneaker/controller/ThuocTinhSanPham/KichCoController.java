package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.sevice.KichCoService;
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
public class KichCoController {

    @Autowired
    KichCoService kichCoService;

    @GetMapping("/kich-co")
    public String hienThiKichCo(Model model){
        List<KichCo> kichCos = kichCoService.getAll();
        model.addAttribute("kichCos", kichCos);
        return "/admin/ThuocTinhSanPham/kichCoPage";
    }

    @GetMapping("/kich-co/add")
    public String hienthiFormThemMoi(Model model) {
        model.addAttribute("kichCo", new KichCo());
        return "/admin/ThuocTinhSanPham/addKichCoPage";
    }

    @PostMapping("/kich-co/add")
    public String themMoi(KichCo kichCo){
        kichCo.setTrangThai(1);
        kichCoService.add(kichCo);
        return "redirect:/admin/kich-co";
    }

    @GetMapping("/kich-co/update/{id}")
    public String hienThiFormUpdate(@PathVariable("id") Long id, Model model) {
        KichCo kichCo = kichCoService.finById(id);
        if (kichCo == null) {
            return "redirect:/admin/kich-co";
        }
        model.addAttribute("kichCo", kichCo);
        return "/admin/ThuocTinhSanPham/updateKichCoPage";
    }

    @PostMapping("/kich-co/update")
    public String update(@ModelAttribute KichCo kichCo) {
        kichCo.setNgayCapNhat(new Date());
        kichCoService.update(kichCo.getId(), kichCo);
        return "redirect:/admin/kich-co";
    }
}
