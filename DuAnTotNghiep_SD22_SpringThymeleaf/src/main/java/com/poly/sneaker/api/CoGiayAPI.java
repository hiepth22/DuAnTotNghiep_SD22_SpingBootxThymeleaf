package com.poly.sneaker.api;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.sevice.CoGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/co-giay")
public class CoGiayAPI {

    @Autowired
    private CoGiayService coGiayService;

    @GetMapping("/all")
    public ResponseEntity<List<CoGiay>> getAllCoGiays() {
        List<CoGiay> coGiays = coGiayService.getAll();
        return ResponseEntity.ok(coGiays);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<CoGiay>> getAllCoGiaysByStatus() {
        List<CoGiay> coGiays = coGiayService.getCoGiay();
        return ResponseEntity.ok(coGiays);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addCoGiay(@RequestParam("ten") String ten) {
        Map<String, Object> response = new HashMap<>();

        if (coGiayService.existingByTen(ten)) {
            response.put("success", false);
            response.put("message", "Cổ giày đã tồn tại");
            return ResponseEntity.ok(response);
        }

        CoGiay coGiay = new CoGiay();
        coGiay.setNgayTao(new Date());
        coGiay.setNguoiTao("admin");
        coGiay.setTen(ten);
        coGiay.setTrangThai(1);
        coGiayService.add(coGiay);

        response.put("success", true);
        response.put("message", "Cổ giày đã được thêm mới");
        return ResponseEntity.ok(response);
    }

}

