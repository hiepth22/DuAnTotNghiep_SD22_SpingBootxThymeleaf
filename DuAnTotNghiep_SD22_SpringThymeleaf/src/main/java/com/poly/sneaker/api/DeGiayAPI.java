package com.poly.sneaker.api;

import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.sevice.DeGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/de-giay")
public class DeGiayAPI {

    @Autowired
    private DeGiayService deGiayService;

    @GetMapping("/all")
    public ResponseEntity<List<DeGiay>> getAllDeGiay(){
        List<DeGiay> deGiays = deGiayService.getAll();
        return ResponseEntity.ok(deGiays);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<DeGiay>> getAllDeGiayByStatus(){
        List<DeGiay> deGiays = deGiayService.getDeGiay();
        return ResponseEntity.ok(deGiays);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addDeGiay(@RequestParam("ten") String ten){
        Map<String, Object> response = new HashMap<>();

        if (deGiayService.existingByTen(ten)){
            response.put("success", false);
            response.put("message", "Đế giày đã tồn tại !");
            return ResponseEntity.ok(response);
        }

        DeGiay deGiay = new DeGiay();
        deGiay.setNgayTao(new Date());
        deGiay.setNguoiTao("admin");
        deGiay.setTen(ten);
        deGiay.setTrangThai(1);
        deGiayService.add(deGiay);

        response.put("success", true);
        response.put("message", "Đế giày đã được lưu mới");
        return ResponseEntity.ok(response);
    }
}
