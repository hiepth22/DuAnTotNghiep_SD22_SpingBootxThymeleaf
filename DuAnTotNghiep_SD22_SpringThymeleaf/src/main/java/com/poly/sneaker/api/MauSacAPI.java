package com.poly.sneaker.api;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.sevice.ChatLieuService;
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
@RequestMapping("/api/mau-sac")
public class MauSacAPI {

    @Autowired
    private MauSacService mauSacService;

    @GetMapping("/all")
    public ResponseEntity<List<MauSac>> getAllMauSac() {
        List<MauSac> mauSacs = mauSacService.getAll();
        return ResponseEntity.ok(mauSacs);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<MauSac>> getAllMauSacByStatus() {
        List<MauSac> mauSacs = mauSacService.getMauSac();
        return ResponseEntity.ok(mauSacs);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addMauSac(@RequestParam("ten") String ten,
                                                         @RequestParam("moTa") String moTa) {
        Map<String, Object> response = new HashMap<>();

        if (mauSacService.existingByTen(ten)) {
            response.put("success", false);
            response.put("message", "Màu sắc đã tồn tại!");
            return ResponseEntity.ok(response);
        }

        MauSac mauSac = new MauSac();
        mauSac.setNgayTao(new Date());
        mauSac.setNguoiTao("admin");
        mauSac.setTen(ten);
        mauSac.setMoTa(moTa);
        mauSac.setTrangThai(1);
        mauSacService.add(mauSac);

        response.put("success", true);
        response.put("message", "Màu sắc đã được lưu mới");
        return ResponseEntity.ok(response);
    }

}
