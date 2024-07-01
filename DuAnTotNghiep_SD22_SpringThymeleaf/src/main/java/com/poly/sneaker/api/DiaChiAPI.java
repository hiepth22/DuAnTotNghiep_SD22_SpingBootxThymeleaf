package com.poly.sneaker.api;


import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.sevice.DiaChiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/khach-hang")
public class DiaChiAPI {
    @Autowired
    DiaChiService diaChiService;
    @GetMapping("/dia-chi/{idKH}")
    public ResponseEntity<List<DiaChi>> getByID(@PathVariable("idKH") String idKH) {
        List<DiaChi> list = diaChiService.getByID(idKH);
        return ResponseEntity.ok(list);
    }

}
