package com.poly.sneaker.api;

import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.sevice.SanPhamChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/san-pham-chi-tiet")
public class SanPhamChiTietAPI {
    @Autowired
    private SanPhamChiTietService spctService;

    @PostMapping("/save")
    public ResponseEntity<?> saveSanPhamChiTiet(@RequestBody List<SanPhamChiTiet> sanPhamChiTiets){
        System.out.println(sanPhamChiTiets);
        System.out.println(sanPhamChiTiets.size());
        System.out.println(sanPhamChiTiets);
        return ResponseEntity.ok(spctService.saveToDatabase(sanPhamChiTiets));
    }
}
