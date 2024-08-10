package com.poly.sneaker.controller.ThuocTinhSanPham;


import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.ThuongHieuService;
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
public class ThuongHieuController {

    @Autowired
    ThuongHieuService thuongHieuService;

    @GetMapping("/thuong-hieu")
    public String hienThiThuongHieu(Model model){
        List<ThuongHieu> thuongHieus = thuongHieuService.getAll();
        model.addAttribute("thuongHieus", thuongHieus);
        return "/admin/ThuocTinhSanPham/thuongHieuPage";
    }

    @GetMapping("/thuong-hieu/add")
    public String hienthiFormThemMoi(Model model) {
        model.addAttribute("thuongHieu", new ThuongHieu());
        return "/admin/ThuocTinhSanPham/addThuongHieuPage";
    }

    @PostMapping("/thuong-hieu/add")
    public String themMoi(ThuongHieu thuongHieu){
        thuongHieuService.add(thuongHieu);
        return "redirect:/admin/thuong-hieu";
    }

    @GetMapping("/thuong-hieu/update/{id}")
    public String hienThiFormUpdate(@PathVariable("id") Long id, Model model) {
        ThuongHieu thuongHieu = thuongHieuService.finById(id);
        if (thuongHieu == null) {
            return "redirect:/admin/thuong-hieu";
        }
        model.addAttribute("thuongHieu", thuongHieu);
        return "/admin/ThuocTinhSanPham/updateThuongHieuPage";
    }

    @PostMapping("/thuong-hieu/update")
    public String update(@ModelAttribute ThuongHieu thuongHieu) {
        thuongHieu.setNgayCapNhat(new Date());
        thuongHieuService.update(thuongHieu.getId(), thuongHieu);
        return "redirect:/admin/thuong-hieu";
    }
}
