package com.poly.sneaker.api;


import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.sevice.DiaChiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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


    @GetMapping("/dia-chi/{id}")
    public ResponseEntity<?> getByID(@PathVariable Long id) {
        try {
            List<DiaChi> diaChiList = diaChiService.getByID(id);
            if (diaChiList.isEmpty()) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok(diaChiList);
        } catch (Exception e) {
            String errorMessage = "Error retrieving addresses for customer with ID: " + id;
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
        }
    }

}
