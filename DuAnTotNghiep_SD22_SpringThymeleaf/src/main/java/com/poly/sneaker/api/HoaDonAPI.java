package com.poly.sneaker.api;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import com.poly.sneaker.repository.PhieuGiamGiaRepository;
import com.poly.sneaker.sevice.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/api/hoa-don")
public class HoaDonAPI {

    private static final Logger log = LoggerFactory.getLogger(HoaDonAPI.class);
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
    @Autowired
    private PhieuGiamGiaService phieuGiamGiaService;
    @Autowired
    private ChatLieuService chatLieuService;
    @Autowired
    private PhieuGiamGiaRepository phieuGiamGiaRepository;

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

        BigDecimal tongTienSauKhiGiam = BigDecimal.ZERO;

        HoaDon hd = hoaDonService.detail(id);

        if (hd.getPhieuGiamGia() != null && hd.getPhieuGiamGia().getId() != null) {
            BigDecimal giamToiDa = hd.getPhieuGiamGia().getGiamToiDa();

            tongTienSauKhiGiam = tongTien.subtract(giamToiDa.min(tongTien));

            hd.setTongTienSauGiam(tongTienSauKhiGiam);
            hd.setTongTien(tongTien);
        } else {
            hd.setTongTien(tongTien);
            hd.setTongTienSauGiam(tongTien);
        }


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

    @PutMapping("/update-ngay-nhan/{id}")
    public ResponseEntity<?> updateNgayNhan(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        LocalDateTime now = LocalDateTime.now();
        hoaDon.setNgayGiaoHang(now);
        LocalDateTime ngayDuKien = now.plusDays(4);
        hoaDon.setNgayNhan(ngayDuKien);
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

    @GetMapping("/lich-su-hoa-don-co-thong-tin/{id}")
    public ResponseEntity<?> lichSuHoaDon (@PathVariable(name = "id") Long id){
        return ResponseEntity.ok(lichSuHoaDonService.getAllByIdhoaDon(id));
    }

    @GetMapping("/lich-su-hoa-don/{id}")
    public ResponseEntity<?> lichSuHoaDon2 (@PathVariable(name = "id") Long id){
        return ResponseEntity.ok(lichSuHoaDonService.getAllByIdhoaDon2(id));
    }

//    @PutMapping("/update-so-luong/{id}")
//    public ResponseEntity<?> updateSoLuong(@PathVariable("id") Long id, @RequestBody HoaDonChiTiet hoaDonChiTiet) {
//        HoaDonChiTiet updateSoLuong = hoaDonService.updateSoLuong(id, hoaDonChiTiet);
//        if (updateSoLuong != null) {
//            return ResponseEntity.ok(updateSoLuong);
//        } else {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
//        }
//    }


    @PutMapping("/update-so-luong/{id}")
    public ResponseEntity<?> updateSoLuong(@PathVariable("id") Long id, @RequestBody HoaDonChiTiet hoaDonChiTiet) {
        HoaDonChiTiet updatedHoaDonChiTiet = hoaDonService.updateSoLuong(id, hoaDonChiTiet);

        if (updatedHoaDonChiTiet != null) {
            Long hoaDonId = updatedHoaDonChiTiet.getHoaDon().getId();
            List<HoaDonChiTiet> hdctList = hoaDonChiTietService.findByHDId(hoaDonId);

            BigDecimal tongTienMoi = hdctList.stream()
                    .map(hdct -> hdct.getSanPhamChiTiet().getGiaBan()
                            .multiply(BigDecimal.valueOf(hdct.getSoLuong())))
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            BigDecimal tongTienSauKhiGiam = BigDecimal.ZERO;

            HoaDon hd = hoaDonService.detail(hoaDonId);

            if (hd != null) {
                if (hd.getPhieuGiamGia() != null && hd.getPhieuGiamGia().getId() != null) {
                    BigDecimal giamToiDa = hd.getPhieuGiamGia().getGiamToiDa();

                    tongTienSauKhiGiam = tongTienMoi.subtract(giamToiDa.min(tongTienMoi));

                    hd.setTongTienSauGiam(tongTienSauKhiGiam);
                    hd.setTongTien(tongTienMoi);
                } else {
                    hd.setTongTien(tongTienMoi);
                    hd.setTongTienSauGiam(tongTienMoi);
                }
                hoaDonService.updateTongTien(hoaDonId, hd);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
            }

            return ResponseEntity.ok(updatedHoaDonChiTiet);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDonChiTiet not found");
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
    public ResponseEntity<?> themSanPham(@RequestBody HoaDonChiTiet hoaDonChiTiet) {

        Long idHD = hoaDonChiTiet.getHoaDon().getId();

        List<HoaDonChiTiet> hdctList = hoaDonChiTietService.findByHDId(idHD);

        BigDecimal tongTienHienTai = hdctList.stream()
                .map(hdct -> hdct.getSanPhamChiTiet().getGiaBan()
                        .multiply(BigDecimal.valueOf(hdct.getSoLuong())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        BigDecimal giaBanSanPhamMoi = hoaDonChiTiet.getSanPhamChiTiet().getGiaBan();
        BigDecimal soLuongSanPhamMoi = BigDecimal.valueOf(hoaDonChiTiet.getSoLuong());

        BigDecimal tongTienMoi = tongTienHienTai.add(giaBanSanPhamMoi.multiply(soLuongSanPhamMoi));

        BigDecimal tongTienSauKhiGiam = BigDecimal.ZERO;

        HoaDon hd = hoaDonService.detail(idHD);

        if (hd.getPhieuGiamGia() != null && hd.getPhieuGiamGia().getId() != null) {
            BigDecimal giamToiDa = hd.getPhieuGiamGia().getGiamToiDa();
            System.out.println("Giảm giá tối đa: " + giamToiDa);

            tongTienSauKhiGiam = tongTienMoi.subtract(giamToiDa.min(tongTienMoi));

            hd.setTongTienSauGiam(tongTienSauKhiGiam);
            hd.setTongTien(tongTienMoi);
        } else {
            hd.setTongTien(tongTienMoi);
            hd.setTongTienSauGiam(tongTienMoi);
        }
        hoaDonService.updateTongTien(idHD, hd);
        hoaDonChiTiet.setHoaDon(hoaDonChiTiet.getHoaDon());
        hoaDonChiTiet.setSanPhamChiTiet(hoaDonChiTiet.getSanPhamChiTiet());

        System.out.println("Tổng tiền hiện tại: " + tongTienHienTai);
        System.out.println("Giá bán sản phẩm mới: " + giaBanSanPhamMoi);
        System.out.println("Số lượng sản phẩm mới: " + soLuongSanPhamMoi);
        System.out.println("Tổng tiền mới: " + tongTienMoi);
        System.out.println("Tổng tiền sau khi giảm: " + tongTienSauKhiGiam);

        return ResponseEntity.ok(banHangService.add(hoaDonChiTiet));
    }


    @GetMapping("/phuong-thuc-thanh-toan/{id}")
    public ResponseEntity<List<PhuongThucThanhToan>> phuongThucThanhToan (@PathVariable("id") Long id){
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

    @PutMapping("/update-thong-tin-nguoi-nhan-hoa-don/{id}")
    public ResponseEntity<?> update2(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        HoaDon updatedHoaDon = hoaDonService.updateHoaDon(id, hoaDon);
        if (updatedHoaDon != null) {
            return ResponseEntity.ok(updatedHoaDon);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("HoaDon not found");
        }
    }

    @PutMapping("/update-hoa-don/{id}")
    public ResponseEntity<?> updateHoaDon(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
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

    @GetMapping("/san-pham-ct/{barcode}")
    public SanPhamChiTiet getSPCTByBarcode(@PathVariable("barcode") String barcode){
        return sanPhamChiTietService.getSPByBarcode(barcode);
    }

    @GetMapping("/phieu-giam-gia-phu-hop/{max}")
    public List<PhieuGiamGia> getPhieuGiamGiaPhuHop(@PathVariable("max") Long max){
        return phieuGiamGiaService.PhieuGiamGiaPhuHop(max);
    }

    @GetMapping("/searchBlaBla")
    public Page<SanPhamChiTiet> searchProducts(
            @RequestParam(required = false) Long idChatLieu,
            @RequestParam(required = false) Long idCoGiay,
            @RequestParam(required = false) Long idDeGiay,
            @RequestParam(required = false) Long idKichCo,
            @RequestParam(required = false) Long idMauSac,
            @RequestParam(required = false) Long idThuongHieu,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Double giaBanMin,
            @RequestParam(required = false) Double giaBanMax,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {

        Pageable pageable = PageRequest.of(page, size);
        return sanPhamChiTietService.searchBlaBla(idChatLieu, idCoGiay, idDeGiay, idKichCo,
                idMauSac, idThuongHieu, keyword, giaBanMin, giaBanMax, pageable);
    }
    @GetMapping("/searchBlaBla1")
    public Page<SanPhamChiTiet> searchProducts1(
            @RequestParam(required = false) Long idChatLieu,
            @RequestParam(required = false) Long idCoGiay,
            @RequestParam(required = false) Long idDeGiay,
            @RequestParam(required = false) Long idKichCo,
            @RequestParam(required = false) Long idMauSac,
            @RequestParam(required = false) Long idThuongHieu,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Double giaBanMin,
            @RequestParam(required = false) Double giaBanMax,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {

        Pageable pageable = PageRequest.of(page, size);
        return sanPhamChiTietService.findByBlaBlaWithDeduplication(idChatLieu, idCoGiay, idDeGiay, idKichCo,
                idMauSac, idThuongHieu, keyword, giaBanMin, giaBanMax, pageable);
    }

    @PostMapping("/xoa-phuong-thuc-thanh-toan/{id}")
    public ResponseEntity<PhuongThucThanhToan> xoaPTTT(@PathVariable("id") Long id) {
        return ResponseEntity.ok(phuongThucThanhToanService.deleteById(id));
    }


    @PutMapping("/update-phieu-giam-gia/{id}")
    public ResponseEntity<?> updatePhieuGiamGia(@PathVariable("id") Long id, @RequestBody HoaDon hoaDon) {
        HoaDon hd = hoaDonService.detail(id);

        if (hoaDon.getPhieuGiamGia() != null) {
            PhieuGiamGia pgg = phieuGiamGiaRepository.findById(hoaDon.getPhieuGiamGia().getId())
                    .orElseThrow(() -> new RuntimeException("PhieuGiamGia not found"));
            hd.setPhieuGiamGia(pgg);
        } else {
            hd.setPhieuGiamGia(null);
        }

        return ResponseEntity.ok(hoaDonService.updatePGG(id, hd));
    }


    @GetMapping("/doanh-thu-hom-nay")
    public List<HoaDon> getDoanhThuHomNay() {
        return hoaDonService.getDoanhThuHomNay();
    }

    @GetMapping("/doanh-thu-thang-hien-tai")
    public List<HoaDon> getDoanhThuThangHienTai() {
        return hoaDonService.getDoanhThuThangHienTai();
    }

    @GetMapping("/doanh-thu-nam-hien-tai")
    public List<HoaDon> getDoanhThuNamHienTai() {
        return hoaDonService.getDoanhThuNamHienTai();
    }






}
