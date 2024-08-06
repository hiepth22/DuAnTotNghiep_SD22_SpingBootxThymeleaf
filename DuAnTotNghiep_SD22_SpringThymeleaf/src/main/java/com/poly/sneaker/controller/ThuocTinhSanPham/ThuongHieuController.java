package com.poly.sneaker.controller.ThuocTinhSanPham;


import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
