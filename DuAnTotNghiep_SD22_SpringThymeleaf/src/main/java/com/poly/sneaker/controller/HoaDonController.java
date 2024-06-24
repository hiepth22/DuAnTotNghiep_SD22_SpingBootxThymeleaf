package com.poly.sneaker.controller;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.sevice.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class HoaDonController {

    @Autowired
    HoaDonService hoaDonService;

//    @GetMapping("/hoa-don")
//    public ResponseEntity<List<HoaDon>> getAllHoaDon() {
//        List<HoaDon> hoaDons = hoaDonService.getAll();
//        return ResponseEntity.ok(hoaDons);
//    }

        @GetMapping("/hoa-don")
    public String hienThiHoaDon(@RequestParam(name = "tab", required = false, defaultValue = "0") int tab, Model model) {
        List<HoaDon> hoaDons = hoaDonService.getAllbyTrangThai(tab);
        model.addAttribute("hoaDons", hoaDons);
        model.addAttribute("currentTab", tab);
            System.out.println();
        return "admin/HoaDon";
    }


}
