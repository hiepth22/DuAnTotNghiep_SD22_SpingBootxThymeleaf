package com.poly.sneaker.controller.ThuocTinhSanPham;


import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ThuongHieuController {

    @Autowired
    ThuongHieuService thuongHieuService;

    @GetMapping("/thuong-hieu")
    public String hienThiThuongHieu(Model model,
                                    @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                    @Param(value = "keyword") String keyword){
        Page<ThuongHieu> thuongHieus = thuongHieuService.pagination(pageNo);

        if (keyword != null){
            thuongHieus = this.thuongHieuService.searchThuongHieu(keyword, pageNo);
            model.addAttribute("keyword", keyword);
        }

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPage", thuongHieus.getTotalPages());
        model.addAttribute("nsx", thuongHieus);

        model.addAttribute("hasResultsCL", thuongHieus.getTotalElements() > 0);
        return "/admin/ThuocTinhSanPham/thuongHieuPage";
    }

    @GetMapping("/thuong-hieu/add")
    public String hienthiFormThemMoi(Model model) {
        model.addAttribute("thuongHieu", new ThuongHieu());
        return "/admin/ThuocTinhSanPham/addThuongHieuPage";
    }

    @PostMapping("/thuong-hieu/add")
    public String themMoi(ThuongHieu thuongHieu){
        thuongHieu.setTrangThai(1);
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
