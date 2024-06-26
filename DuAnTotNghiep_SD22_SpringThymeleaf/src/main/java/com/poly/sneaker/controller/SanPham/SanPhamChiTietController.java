//package com.poly.sneaker.controller.SanPham;
//
//import com.poly.sneaker.entity.SanPhamChiTiet;
//import com.poly.sneaker.sevice.SanPhamChiTietService;
//import com.poly.sneaker.sevice.SanPhamService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import java.util.List;
//
//@Controller
//@RequestMapping("/admin/san-pham-chi-tiet")
//public class SanPhamChiTietController {
//
//    @Autowired
//    private SanPhamChiTietService service;
//
//    @GetMapping("")
//    public String hienThiChiTietSanPham(Model model,
//                                 @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo) {
//        Page<SanPhamChiTiet> SPCT = service.pagination(pageNo);
//        model.addAttribute("totalPage",SPCT.getTotalPages());
//        model.addAttribute("currentPage", pageNo);
//        model.addAttribute("SPCT", SPCT);
//
//        return "/admin/SanPham/sanPhamChiTietPage";
//    }
//
//    @GetMapping("/detail/{sanPhamId}")
//    public String hienThiSanPhamChiTiet(@PathVariable("sanPhamId") Long sanPhamId, Model model) {
//        List<SanPhamChiTiet> sanPhamChiTiets = service.getAllSanPham(sanPhamId);
//        model.addAttribute("sanPhamChiTiets", sanPhamChiTiets);
//        return "/admin/SanPham/sanPhamChiTietPage";
//    }
//
//
//}
