package com.poly.sneaker.api;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.sevice.ChatLieuService;
import com.poly.sneaker.sevice.KichCoService;
import com.poly.sneaker.sevice.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/kich-co")
public class KichCoAPI {

    @Autowired
    private KichCoService kichCoService;


    @GetMapping("/all")
    public ResponseEntity<List<KichCo>> getAllKichCo() {
        List<KichCo> kichCos = kichCoService.getAll();
        return ResponseEntity.ok(kichCos);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<KichCo>> getAllKichCoByStatus() {
        List<KichCo> kichCos = kichCoService.getKichCo();
        return ResponseEntity.ok(kichCos);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addKichCo(@RequestParam("ten") String ten) {
        Map<String, Object> response = new HashMap<>();

        if (kichCoService.existingByTen(ten)) {
            response.put("success", false);
            response.put("message", "Kích cỡ đã tồn tại");
            return ResponseEntity.ok(response);
        }

        KichCo kichCo = new KichCo();
        kichCo.setNgayTao(new Date());
        kichCo.setNguoiTao("admin");
        kichCo.setTen(ten);
        kichCo.setTrangThai(1);
        kichCoService.add(kichCo);

        response.put("success", true);
        response.put("message", "Đã thêm mới kích cỡ");
        return ResponseEntity.ok(response);
    }


}
