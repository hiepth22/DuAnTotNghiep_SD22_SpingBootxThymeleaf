package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.sevice.NhaSanXuatService;
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
public class NhaSanXuatController {

    @Autowired
    NhaSanXuatService nsxService;

    @GetMapping("/nsx")
    public String hienThiNSX(Model model){
        List<NhaSanXuat> nsx = nsxService.getAll();
        model.addAttribute("nsx", nsx);
        return "/admin/ThuocTinhSanPham/nhaSanXuatPage";
    }

    @GetMapping("/nsx/add")
    public String hienthiFormThemMoi(Model model) {
        model.addAttribute("nsx", new NhaSanXuat());
        return "/admin/ThuocTinhSanPham/addNSXPage";
    }

    @PostMapping("/nsx/add")
    public String themMoi(NhaSanXuat nsx){
        nsx.setTrangThai(1);
        nsxService.add(nsx);
        return "redirect:/admin/nsx";
    }

    @GetMapping("/nsx/update/{id}")
    public String hienThiFormUpdate(@PathVariable("id") Long id, Model model) {
        NhaSanXuat nsx = nsxService.finById(id);
        if (nsx == null) {
            return "redirect:/admin/nsx";
        }
        model.addAttribute("nsx", nsx);
        return "/admin/ThuocTinhSanPham/updateNSXPage";
    }

    @PostMapping("/nsx/update")
    public String update(@ModelAttribute NhaSanXuat nsx) {
        nsx.setNgayCapNhat(new Date());
        nsxService.update(nsx.getId(), nsx);
        return "redirect:/admin/nsx";
    }
}
