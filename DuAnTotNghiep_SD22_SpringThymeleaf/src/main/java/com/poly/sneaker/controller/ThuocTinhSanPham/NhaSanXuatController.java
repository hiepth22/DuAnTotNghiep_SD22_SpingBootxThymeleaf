package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.sevice.NhaSanXuatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
