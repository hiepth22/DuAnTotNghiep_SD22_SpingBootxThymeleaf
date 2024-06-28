package com.poly.sneaker.api;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.LichSuHoaDon;
import com.poly.sneaker.sevice.HoaDonChiTietService;
import com.poly.sneaker.sevice.HoaDonService;
import com.poly.sneaker.sevice.LichSuHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/hoa-don")
public class HoaDonAPI {

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private LichSuHoaDonService lichSuHoaDonService;


    @GetMapping("")
    public List<HoaDon> hienThiHoaDonApi(@RequestParam(name = "tab", required = false, defaultValue = "0") int tab,
                                         @RequestParam(name = "ma", required = false) String ma,
                                         @RequestParam(name = "startDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                                         @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {

        if(tab == 0){
            return hoaDonService.findHoaDonByMaAndNgayTao(ma, startDate, endDate);
        }

        if (ma != null && startDate != null && endDate != null) {
            return hoaDonService.findHoaDonByMaAndNgayTaoAndTrangThai(ma, startDate, endDate, tab);
        } else if (ma == null && startDate != null && endDate != null) {
            return hoaDonService.findHoaDonByMaAndNgayTaoAndTrangThai(null, startDate, endDate, tab);
        } else if (ma != null && startDate == null && endDate == null) {
            return hoaDonService.findHoaDonByMaAndNgayTaoAndTrangThai(ma, null, null, tab);
        } else {
            return hoaDonService.getAllbyTrangThai(tab);
        }

    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<Map<String, Object>> detail(@PathVariable("id") Long id) {
        HoaDon hd = hoaDonService.detail(id);
        List<HoaDonChiTiet> hdctList = hoaDonChiTietService.findByHDId(id);

        Map<String, Object> response = new HashMap<>();
        response.put("hd", hd);
        response.put("hdctList", hdctList);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/delete-hd/{id}")
    public ResponseEntity<Map<String, Object>> updateHoaDon(@PathVariable("id") Long id, @RequestParam("idHoaDonCT") Long idHoaDonCT) {
        hoaDonChiTietService.deleteById(idHoaDonCT);

        List<HoaDonChiTiet> hdctList = hoaDonChiTietService.findByHDId(id);

        BigDecimal tongTien = hdctList.stream()
                .map(hdct -> hdct.getSanPhamChiTiet().getGiaBan()
                        .multiply(BigDecimal.valueOf(hdct.getSoLuong())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        HoaDon hd = hoaDonService.detail(id);
        hd.setTongTien(tongTien);
        hoaDonService.updateTongTien(id, hd);

        Map<String, Object> response = new HashMap<>();
        response.put("hoaDon", hd);
        response.put("hoaDonChiTietList", hdctList);

        return ResponseEntity.ok(response);
    }

    @PutMapping("/update-trang-thai/{id}")
    public ResponseEntity<?> updateTrangThai(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        HoaDon updatedHoaDon = hoaDonService.updateTrangThai(id, hoaDon);
        if (updatedHoaDon != null) {
            return ResponseEntity.ok(updatedHoaDon);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
        }
    }
    @PostMapping("/lich-su-hoa-don/add")
    public ResponseEntity<?> addLichSuHoaDon (@PathVariable("id") Long id, LichSuHoaDon lichSuHoaDon){
        return ResponseEntity.ok(lichSuHoaDonService.add(id, lichSuHoaDon));
    }

}
