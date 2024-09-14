package com.poly.sneaker.api;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.sevice.HoaDonChiTietService;
import com.poly.sneaker.sevice.HoaDonService;
import com.poly.sneaker.sevice.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/khach-hang")
public class ThongTinKhachHangAPI {

    @Autowired
    HoaDonService hoaDonService;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("/thong-tin-hoa-don/{id}")
    public ResponseEntity<?> thongTinHoaDon(@PathVariable("id") Long id) {
        return ResponseEntity.ok(hoaDonService.findByIDKHAndTrangThai(id));
    }
    @GetMapping("/thong-tin-hoa-don-chi-tiet/{idHoaDon}")
    public ResponseEntity<List<HoaDonChiTiet>> getHoaDonChiTiet(
            @PathVariable Long idHoaDon,
            @RequestParam(name = "tab", required = false, defaultValue = "0") int tab) {

                if(tab == 0){
                    return ResponseEntity.ok(hoaDonChiTietService.findByHDId(idHoaDon));
                }else{
                    return ResponseEntity.ok(hoaDonChiTietService.findByHDCTIdHD(idHoaDon, tab));
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


    @PostMapping("/add-khach-hang-nhanh")
    public ResponseEntity<?> themKH(@RequestBody KhachHang khachHang) {
        return ResponseEntity.ok(khachHangService.Add(khachHang));
    }





}
