package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.sevice.MauSacService;
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
public class MauSacController {

    @Autowired
    MauSacService mauSacService;

    @GetMapping("/mau-sac")
    public String hienThiMauSac(Model model){
        List<MauSac> mauSacs = mauSacService.getAll();
        model.addAttribute("mauSacs", mauSacs);
        return "/admin/ThuocTinhSanPham/mauSacPage";
    }

    @GetMapping("/mau-sac/add")
    public String hienthiFormThemMoi(Model model) {
        model.addAttribute("mauSac", new MauSac());
        return "/admin/ThuocTinhSanPham/addMauSacPage";
    }

    @PostMapping("/mau-sac/add")
    public String themMoi(MauSac mauSac){
        mauSacService.add(mauSac);
        return "redirect:/admin/mau-sac";
    }

    @GetMapping("/mau-sac/update/{id}")
    public String hienThiFormUpdate(@PathVariable("id") Long id, Model model) {
        MauSac mauSac = mauSacService.finById(id);
        if (mauSac == null) {
            return "redirect:/admin/mau-sac";
        }
        model.addAttribute("mauSac", mauSac);
        return "/admin/ThuocTinhSanPham/updateMauSacPage";
    }

    @PostMapping("/mau-sac/update")
    public String update(@ModelAttribute MauSac mauSac) {
        mauSac.setNgayCapNhat(new Date());
        mauSacService.update(mauSac.getId(), mauSac);
        return "redirect:/admin/mau-sac";
    }
}
