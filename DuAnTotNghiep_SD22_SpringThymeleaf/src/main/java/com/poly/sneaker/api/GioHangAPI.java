package com.poly.sneaker.api;

import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.GioHangChiTiet;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.repository.GioHangRepository;
import com.poly.sneaker.sevice.GioHangChiTietService;
import com.poly.sneaker.sevice.GiohangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/gio-hang")
public class GioHangAPI {

    @Autowired
    GiohangService giohangService;

    @Autowired
    GioHangChiTietService  gioHangChiTietService;


    @GetMapping("/detail/{id}")
    public ResponseEntity<Map<String, Object>> detail(@PathVariable("id") Long id) {
        GioHang gh = giohangService.detail(id);
        List<GioHangChiTiet> gdct = giohangService.detailGHCT(gh.getId());

        Map<String, Object> response = new HashMap<>();
        response.put("gh", gh);
        response.put("gdct", gdct);

        return ResponseEntity.ok(response);
    }

}
