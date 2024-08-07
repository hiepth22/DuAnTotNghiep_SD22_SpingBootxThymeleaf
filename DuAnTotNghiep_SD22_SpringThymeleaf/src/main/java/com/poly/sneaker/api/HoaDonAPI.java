package com.poly.sneaker.api;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
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
@RequestMapping("/api/hoa-don")
public class HoaDonAPI {

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private LichSuHoaDonService lichSuHoaDonService;
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;
    @Autowired
    private BanHangService banHangService;
    @Autowired
    private PhuongThucThanhToanService phuongThucThanhToanService;
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    private HoaDonRepository hoaDonRepository;

    @GetMapping("")
    public Page<HoaDon> hienThiHoaDonApi(@RequestParam(name = "tab", required = false, defaultValue = "0") int tab,
                                         @RequestParam(name = "keyword", required = false) String keyword,
                                         @RequestParam(name = "startDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                                         @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
                                         @RequestParam(name = "loai", required = false, defaultValue = "0") int loai,
                                         @RequestParam(name = "page", required = false, defaultValue = "0") int page,
                                         @RequestParam(name = "size", required = false, defaultValue = "10") int size) {

        Pageable pageable = PageRequest.of(page, size);

        if ((keyword != null && !keyword.isEmpty()) || (startDate != null && endDate != null)) {
            if (tab == 0) {
                return hoaDonService.findHoaDonByMaAndNgayTao(keyword, loai, startDate, endDate, pageable);
            } else {
                return hoaDonService.findHoaDonByMaAndNgayTaoAndTrangThai(keyword, loai, startDate, endDate, tab, pageable);
            }
        } else {
            if (tab == 0) {
                return hoaDonService.getAll(pageable);
            } else {
                return hoaDonService.getAllByTrangThai(tab, pageable);
            }
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
        LocalDateTime now = LocalDateTime.now();
        hoaDon.setNgayThanhToan(now);
        hoaDon.setTrangThai(hoaDon.getTrangThai());
        HoaDon updatedHoaDon = hoaDonService.updateTrangThai(id, hoaDon);
        if (updatedHoaDon != null) {
            return ResponseEntity.ok(updatedHoaDon);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
        }
    }

    @PostMapping("/lich-su-hoa-don/add/{id}")
    public ResponseEntity<?> addLichSuHoaDon (@PathVariable("id") Long id,@RequestBody LichSuHoaDon lichSuHoaDon){
        return ResponseEntity.ok(lichSuHoaDonService.add(id, lichSuHoaDon));
    }

    @GetMapping("/lich-su-hoa-don/{id}")
    public ResponseEntity<?> lichSuHoaDon (@PathVariable(name = "id") Long id){
        return ResponseEntity.ok(lichSuHoaDonService.getAllByIdhoaDon(id));
    }

    @PutMapping("/update-so-luong/{id}")
    public ResponseEntity<?> updateSoLuong(@PathVariable("id") Long id, @RequestBody HoaDonChiTiet hoaDonChiTiet) {
        HoaDonChiTiet updateSoLuong = hoaDonService.updateSoLuong(id, hoaDonChiTiet);
        if (updateSoLuong != null) {
            return ResponseEntity.ok(updateSoLuong);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
        }
    }

    @PutMapping("/update-tong-tien/{id}")
    public ResponseEntity<?> updateTongTien(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        HoaDon updateTongTien = hoaDonService.updateTongTien(id, hoaDon);
        if (updateTongTien != null) {
            return ResponseEntity.ok(updateTongTien);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
        }
    }

    @GetMapping("/danh-sach-san-pham")
    public ResponseEntity<?> danhSachSanPham (@RequestParam(name = "page", required = false, defaultValue = "0") int page,
                                              @RequestParam(name = "size", required = false, defaultValue = "10") int size){
        Pageable pageable = PageRequest.of(page, size);
        return ResponseEntity.ok(banHangService.getAllSanPham(pageable));
    }

    @PostMapping("/danh-sach-san-pham/add")
    public ResponseEntity<?> themSanPham(@RequestBody HoaDonChiTiet hoaDonChiTiet){
        hoaDonChiTiet.setHoaDon(hoaDonChiTiet.getHoaDon());
        hoaDonChiTiet.setSanPhamChiTiet(hoaDonChiTiet.getSanPhamChiTiet());
        return ResponseEntity.ok(banHangService.add(hoaDonChiTiet));
    }

    @GetMapping("/phuong-thuc-thanh-toan/{id}")
    public ResponseEntity<?> phuongThucThanhToan (@PathVariable("id") Long id){
        return ResponseEntity.ok(phuongThucThanhToanService.detail(id));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> detailHoaDon(@PathVariable("id") Long id) {
        return ResponseEntity.ok(hoaDonService.getHoaDonByID(id));
    }


    @GetMapping("/search")
    public ResponseEntity<?> search(
            @RequestParam(name = "startDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") LocalDateTime startDate,
            @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") LocalDateTime endDate,
            @RequestParam(name = "tab", required = false, defaultValue = "0") int tab,
            @RequestParam(name = "search", required = false) String search
    ) {
        return ResponseEntity.ok(hoaDonRepository.findAllByNgayTaoBetweenAndTrangThaiAndMaContainingIgnoreCaseOrSdtNguoiNhanContainingIgnoreCase(
                startDate, endDate, tab, search, search));
    }


    @PutMapping("/update-thong-tin-nguoi-nhan/{id}")
    public ResponseEntity<?> updateThongTinNguoiNhan(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        HoaDon updatedHoaDon = hoaDonService.updateThongTinNguoiNhan(id, hoaDon);
        if (updatedHoaDon != null) {
            return ResponseEntity.ok(updatedHoaDon);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
        }
    }

    @PutMapping("/update-trang-thai-thanh-toan/{id}")
    public ResponseEntity<?> updateTrangThaiThanhToan(
            @PathVariable("id") Long id,
            @RequestBody PhuongThucThanhToan phuongThucThanhToan) {

        PhuongThucThanhToan updated = phuongThucThanhToanService.updateTrangThaiThanhToan(id, phuongThucThanhToan);
        if (updated != null) {
            return ResponseEntity.ok(updated);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("PhuongThucThanhToan not found");
        }
    }


    @PutMapping("/update-so-luong-sp")
    public ResponseEntity<?> updateHoaDonChiTiet(@RequestBody HoaDonChiTiet hoaDonChiTiet) {
        hoaDonService.updateHoaDonChiTiet(
                hoaDonChiTiet.getSanPhamChiTiet().getId(),
                hoaDonChiTiet.getHoaDon().getId(),
                hoaDonChiTiet.getSoLuong(),
                hoaDonChiTiet.getGia(),
                hoaDonChiTiet.getTrangThai()
        );
        return ResponseEntity.ok("Cập nhật thành công");
    }


    @GetMapping("/bar-chart-data")
    public ResponseEntity<List<HoaDonChiTiet>> getHoaDonChiTietByDateRange(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {
        endDate = endDate.withHour(23).withMinute(59).withSecond(59).withNano(0);
        List<HoaDonChiTiet> result = hoaDonChiTietService.getHoaDonChiTietByDateRange(startDate, endDate);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/doughnut-chart-data")
    public ResponseEntity<List<HoaDon>> getAllDataHoaDon() {
        return ResponseEntity.ok(hoaDonService.findAll());
    }

    @GetMapping("/san-pham-ban-chay-nhat")
    public List<SanPhamBanChayDTO> getSanPhamBanChayNhat() {
        return hoaDonService.getTop10Products();
    }

    @GetMapping("/san-pham-sap-het-hang")
    public List<SanPhamChiTiet> getSanPhamSapHetHang() {
        return hoaDonService.getSanPhamSapHetHang();
    }


}
