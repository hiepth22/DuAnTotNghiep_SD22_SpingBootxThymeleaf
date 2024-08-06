package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.sevice.KichCoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
