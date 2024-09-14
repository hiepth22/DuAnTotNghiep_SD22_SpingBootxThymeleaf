package com.poly.sneaker.api;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.sevice.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
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
    @Autowired
    private PhieuGiamGiaService phieuGiamGiaService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private ChatLieuService chatLieuService;
    @Autowired
    private DeGiayService deGiayService;

    @GetMapping("")
    public List<HoaDon> hienThiHoaDonApi() {
        return banHangService.getHoaDonCho();
    }

//    @GetMapping("/{id}")
//    public List<HoaDonChiTiet> hienThiHoaDonApi(@PathVariable("id") Long id) {

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
        hoaDon.setNguoiNhan("Khách Vãng Lai");
        KhachHang kh = new KhachHang();
        kh.setId(1L);
        hoaDon.setKhachHang(kh);
        hoaDon.setTongTien(new BigDecimal(0));
        hoaDon.setTienShip(new BigDecimal(0));
        PhieuGiamGia pg = new PhieuGiamGia();
        pg.setGiaTriGiam(new BigDecimal(0));

        HoaDon savedHoaDon = hoaDonService.add(hoaDon);

        String maHoaDon = "HD0" + savedHoaDon.getId();
        savedHoaDon.setMa(maHoaDon);
        hoaDonService.taoMaHoaDon(savedHoaDon.getId(), savedHoaDon);
        return ResponseEntity.ok(savedHoaDon);
    }

    @GetMapping("/khach-hang")
    public ResponseEntity<?> getKhachHangNoID1(
            @RequestParam(name = "sdt", required = false) String sdt,
            @RequestParam(name = "page", required = false, defaultValue = "0") int page,
            @RequestParam(name = "size", required = false, defaultValue = "10") int size)
             {

        Pageable pageable = PageRequest.of(page, size);
        return ResponseEntity.ok(khachHangService.getKhachHangNoID1(sdt, pageable));
    }

    @PutMapping("/update-khach-hang/{id}")
    public ResponseEntity<?> updateTrangThaiThanhToan(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        KhachHang khachHang = khachHangService.findById(hoaDon.getKhachHang().getId());
        KhachHang kh = new KhachHang();
        kh.setId(hoaDon.getKhachHang().getId());
        hoaDon.setNguoiNhan(khachHang.getTen());
        hoaDon.setSdtNguoiNhan(khachHang.getSdt());
        hoaDon.setNguoiNhan(hoaDon.getNguoiNhan());
        hoaDon.setKhachHang(kh);
        HoaDon updateKhachHangtrongHoaDon = banHangService.updateKhachHang(id, hoaDon);
        if (updateKhachHangtrongHoaDon != null) {
            return ResponseEntity.ok(updateKhachHangtrongHoaDon);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("updateKhachHangtrongHoaDon not found");
        }

    }


    @PutMapping("/update-thong-tin-nguoi-nhan/{id}")
    public ResponseEntity<?> updateThongTinNguoiNhan(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        hoaDon.setNguoiNhan(hoaDon.getNguoiNhan());
        hoaDon.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
        HoaDon updateThongTinNguoiNhan = banHangService.updateThongTinNguoiNhan(id, hoaDon);
        if (updateThongTinNguoiNhan != null) {
            return ResponseEntity.ok(updateThongTinNguoiNhan);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("updateThongTinNguoiNhan not found");
        }

    }


}
