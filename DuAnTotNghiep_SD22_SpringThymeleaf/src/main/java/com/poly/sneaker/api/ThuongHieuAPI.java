package com.poly.sneaker.api;

import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.MauSacService;
import com.poly.sneaker.sevice.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api/thuong-hieu")
public class ThuongHieuAPI {

    @Autowired
    private ThuongHieuService thuongHieuService;

    @GetMapping("/all")
    public ResponseEntity<List<ThuongHieu>> getAllThuongHieu() {
        List<ThuongHieu> thuongHieus = thuongHieuService.getAll();
        return ResponseEntity.ok(thuongHieus);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<ThuongHieu>> getAllThuongHieuByStatus() {
        List<ThuongHieu> thuongHieus = thuongHieuService.getThuongHieu();
        return ResponseEntity.ok(thuongHieus);
    }
}
