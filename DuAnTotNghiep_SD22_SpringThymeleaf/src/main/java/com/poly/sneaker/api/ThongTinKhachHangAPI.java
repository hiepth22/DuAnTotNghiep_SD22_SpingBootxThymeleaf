package com.poly.sneaker.api;

import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.GioHangChiTiet;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.sevice.HoaDonChiTietService;
import com.poly.sneaker.sevice.HoaDonService;
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
public class ThongTinKhachHangAPI {

    @Autowired
    HoaDonService hoaDonService;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("/thong-tin-hoa-don/{id}")
    public ResponseEntity<?> thongTinHoaDon(@PathVariable("id") Long id) {
        return ResponseEntity.ok(hoaDonService.findByIDKHAndTrangThai(id));
    }

    @GetMapping("/thong-tin-hoa-don-chi-tiet/{idHoaDon}")
    public ResponseEntity<List<HoaDonChiTiet>> getHoaDonChiTiet(@PathVariable Long idHoaDon) {
        try {
            List<HoaDonChiTiet> chiTiet = hoaDonChiTietService.findByHDId(idHoaDon);
            return ResponseEntity.ok(chiTiet);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") Long id) {
        try {
            List<HoaDonChiTiet> chiTiet = hoaDonChiTietService.findByHDId(id);
            return ResponseEntity.ok(chiTiet);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }





}
