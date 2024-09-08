package com.poly.sneaker.api;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.sevice.CoGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/api/co-giay")
public class CoGiayAPI {

    @Autowired
    private CoGiayService coGiayService;

    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<String> addCoGiay(@RequestParam("ten") String ten) {
        if (coGiayService.existingByTen(ten)) {
            return ResponseEntity.badRequest().body("Cổ giày đã tồn tại");
        }

        CoGiay coGiay = new CoGiay();
        coGiay.setNgayTao(new Date());
        coGiay.setNguoiTao("admin");
        coGiay.setTen(ten);
        coGiayService.add(coGiay);

        return ResponseEntity.ok("Cổ giày đã được thêm mới");
    }
}

