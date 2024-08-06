package com.poly.sneaker.controller.ThuocTinhSanPham;


import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.sevice.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
