package com.poly.sneaker.controller.SanPham;

import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.sevice.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class SanPhamController {

    @Autowired
    private SanPhamService service;

    @GetMapping("/san-pham")
    public String hienThiSanPham(Model model,
                                 @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo) {
        Page<SanPham> sanPhams = service.pagination(pageNo);
        model.addAttribute("totalPage",sanPhams.getTotalPages());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("sanPhams", sanPhams);

        return "/admin/SanPham/sanPhamPage";
    }


}
