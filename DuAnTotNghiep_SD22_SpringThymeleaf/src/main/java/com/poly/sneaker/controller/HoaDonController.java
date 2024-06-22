package com.poly.sneaker.controller;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.sevice.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    HoaDonService hoaDonService;

    @GetMapping("")
    public ResponseEntity<List<HoaDon>> getAllHoaDon() {
        List<HoaDon> hoaDons = hoaDonService.getAll();
        return ResponseEntity.ok(hoaDons);
    }
}
