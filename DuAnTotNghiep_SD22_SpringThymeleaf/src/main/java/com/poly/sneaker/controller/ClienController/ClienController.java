package com.poly.sneaker.controller.ClienController;

import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.sevice.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClienController {

    @Autowired
    private SanPhamService service;

    @Autowired
    private SanPhamChiTietService SPCTservice;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private DeGiayService deGiayService;

    @Autowired
    private NhaSanXuatService nhaSanXuatService;

    @Autowired
    private ChatLieuService chatLieuService;

    @Autowired
    private CoGiayService coGiayService;

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private KichCoService kichCoService;

    @GetMapping("/Clien")
    public String hienThiSanPham(Model model) {
        List<SanPhamChiTiet> sanPhams = SPCTservice.getAll();
        model.addAttribute("sanPhams", sanPhams);


        return "client/viewClient";
    }
    @GetMapping("/sanphamchitietclien/{sanPhamId}")
    public String hienThiChiTietSanPham(@PathVariable Long sanPhamId, Model model) {
        SanPhamChiTiet sanPhamChiTiet = SPCTservice.findById1(sanPhamId);
        model.addAttribute("sanPhamChiTiet", sanPhamChiTiet);
        return "client/SanPhamChiTietClien";
    }
}
