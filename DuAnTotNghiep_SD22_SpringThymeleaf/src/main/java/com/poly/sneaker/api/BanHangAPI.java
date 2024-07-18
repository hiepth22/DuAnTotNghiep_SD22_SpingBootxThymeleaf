package com.poly.sneaker.api;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.LichSuHoaDon;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.sevice.BanHangService;
import com.poly.sneaker.sevice.HoaDonChiTietService;
import com.poly.sneaker.sevice.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/ban-hang")
public class BanHangAPI {

    @Autowired
    private BanHangService banHangService;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("")
    public List<HoaDon> hienThiHoaDonApi() {
        return banHangService.getHoaDonCho();
    }

//    @GetMapping("/{id}")
//    public List<HoaDonChiTiet> hienThiHoaDonApi(@PathVariable("id") Long id) {
//        return hoaDonChiTietService.getHDCT(id);
//    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> detail(@PathVariable("id") Long id) {
        HoaDon hd = hoaDonService.detail(id);
        List<HoaDonChiTiet> hdctList = hoaDonChiTietService.findByHDId(id);

        Map<String, Object> response = new HashMap<>();
        response.put("hd", hd);
        response.put("hdctList", hdctList);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/tao-hoa-don")
    public ResponseEntity<?> taoHoaDon (@RequestBody HoaDon hoaDon){
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setLoai(2);
        hoaDon.setNguoiTao("admin");
        hoaDon.setTrangThai(8);
        return ResponseEntity.ok(hoaDonService.add(hoaDon));
    }




}
