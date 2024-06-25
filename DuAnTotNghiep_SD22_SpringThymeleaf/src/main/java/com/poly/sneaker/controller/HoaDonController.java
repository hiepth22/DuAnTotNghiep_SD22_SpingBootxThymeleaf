package com.poly.sneaker.controller;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.sevice.HoaDonChiTietService;
import com.poly.sneaker.sevice.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Controller
public class HoaDonController {

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("/hoa-don")
    public String hienThiHoaDon(@RequestParam(name = "tab", required = false, defaultValue = "0") int tab,
                                @RequestParam(name = "ma", required = false) String ma,
                                @RequestParam(name = "startDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                                @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
                                Model model) {
        List<HoaDon> hoaDons;

        if (ma != null && startDate != null && endDate != null) {
            hoaDons = hoaDonService.findHoaDonByMaAndNgayTao(ma, startDate, endDate);
        } else {
            hoaDons = hoaDonService.getAllbyTrangThai(tab);
        }

        model.addAttribute("hoaDons", hoaDons);
        model.addAttribute("currentTab", tab);
        return "admin/HoaDon/HoaDon";
    }

//    @GetMapping("/hoa-don/detail/{id}") //
//    public String detail(@PathVariable("id") Long id, Model model) {
//        HoaDon hd = hoaDonService.detail(id);
//        HoaDonChiTiet hdct = hoaDonChiTietService.detail(id);
//        BigDecimal tongTien = hoaDonChiTietService.tongTien(id);
//
//        System.out.println(hdct);
//        model.addAttribute("hd", hd);
//        model.addAttribute("hdct", hdct);
//        model.addAttribute("tongTien", tongTien);
//        return "admin/HoaDon/HoaDonDetail";
//    }

    @GetMapping("/hoa-don/detail/{id}")
    public String showHoaDonDetail(@PathVariable("id") Long id, Model model) {
        HoaDon hd = hoaDonService.detail(id);
        List<HoaDonChiTiet> hdctList = hoaDonChiTietService.findByHDId(id);


        model.addAttribute("hd", hd);
        model.addAttribute("hdctList", hdctList);
        return "admin/HoaDon/HoaDonDetail";
    }


}
