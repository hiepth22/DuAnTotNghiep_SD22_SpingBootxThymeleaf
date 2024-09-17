package com.poly.sneaker.api;


import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.sevice.DiaChiService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/khach-hang")
public class DiaChiAPI {
    @Autowired
    DiaChiService diaChiService;



    @PutMapping("/update-trang-thai/{idKh}")
    public ResponseEntity<?> updateDiaChiStatus(@PathVariable("idKh") Long idKhachHang) {
            System.out.println("idKh" +idKhachHang);
            return ResponseEntity.ok(diaChiService.setDiaChi(idKhachHang));
    }
    @PutMapping("/update-dia-chi-mac-dinh/{id}")
    public ResponseEntity<?> updateDiaChiMacDinh(@PathVariable("id") Long id) {
        try {
            diaChiService.setDiaChi2(id);
            return ResponseEntity.ok("Đã cập nhật trạng thái địa chỉ thành công.");
        } catch (Exception e) {
            String errorMessage = "Error updating address status for customer with ID: " ;
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
        }
    }

    @PostMapping("/add-dia-chi-nhanh")
    public ResponseEntity<?> themDiaChiNhanh(@RequestBody DiaChi diaChi) {
        return ResponseEntity.ok(diaChiService.themNhanh(diaChi));
    }
    @PutMapping("update-dia-chi/{id}")
    public ResponseEntity<DiaChi> updateDiaChi(@PathVariable Long id, @RequestBody DiaChi diaChi) {
        try {
            DiaChi updatedDiaChi = diaChiService.updateDiaChi(id, diaChi);
            return ResponseEntity.ok(updatedDiaChi);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/tim-dia-chi/{id}")
    public ResponseEntity<?> timDiaCHi(@PathVariable("id") Long id) {
        return ResponseEntity.ok(diaChiService.findById(id));
    }


}
