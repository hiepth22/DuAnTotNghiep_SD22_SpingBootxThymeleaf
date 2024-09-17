package com.poly.sneaker.api;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.GioHangRepository;
import com.poly.sneaker.sevice.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/gio-hang")
public class GioHangAPI {

    @Autowired
    GiohangService giohangService;
    @Autowired
    GioHangChiTietService  gioHangChiTietService;
    @Autowired
    private DiaChiService diaChiService;
    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private PhuongThucThanhToanService phuongThucThanhToanService;
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;

    @GetMapping("/detail/{id}")
    public ResponseEntity<Map<String, Object>> detail(@PathVariable("id") Long id) {
        GioHang gh = giohangService.detail(id);
        List<GioHangChiTiet> ghct = giohangService.detailGHCT(gh.getId());

        Map<String, Object> response = new HashMap<>();
        response.put("gh", gh);
        response.put("ghct", ghct);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/cho-thanh-toan/{id}")
    public ResponseEntity<Map<String, Object>> thanhToan(@PathVariable("id") Long id) {
        GioHang gh = giohangService.detail(id);
        List<GioHangChiTiet> ghct = giohangService.detailGHCT(gh.getId());

        List<DiaChi> diaChiKH = diaChiService.getByID(id);

        Map<String, Object> response = new HashMap<>();
        response.put("gh", gh);
        response.put("ghct", ghct);
        response.put("diaChiKH", diaChiKH);
        System.out.println(diaChiKH);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/tao-hoa-don-dat-hang")
    public ResponseEntity<?> taoHoaDonDatHang (@RequestBody HoaDon hoaDon){

        hoaDon.setDiaChiNguoiNhan(hoaDon.getDiaChiNguoiNhan());
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setLoai(1);
        hoaDon.setTrangThai(1);
        hoaDon.setMa(hoaDon.getMa());
        hoaDon.setNguoiNhan(hoaDon.getNguoiNhan());
        hoaDon.setKhachHang(hoaDon.getKhachHang());
        hoaDon.setTongTien(hoaDon.getTongTien());
        hoaDon.setTienShip(hoaDon.getTienShip());
        hoaDon.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
        if(hoaDon.getPhieuGiamGia().getId() == null){
            hoaDon.setPhieuGiamGia(null);
        }
        PhieuGiamGia pg = new PhieuGiamGia();
        pg.setGiaTriGiam(new BigDecimal(0));

        HoaDon savedHoaDon = hoaDonService.add(hoaDon);

        String maHoaDon = "HD0" + savedHoaDon.getId();
        savedHoaDon.setMa(maHoaDon);
        hoaDonService.taoMaHoaDon(savedHoaDon.getId(), savedHoaDon);



        return ResponseEntity.ok(savedHoaDon);
    }

    @PostMapping("/tao-hoa-don-dat-hang-khong-dang-nhap")
    public ResponseEntity<?> taoHoaDonDatHang2 (@RequestBody HoaDon hoaDon){

        hoaDon.setDiaChiNguoiNhan(hoaDon.getDiaChiNguoiNhan());
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setNguoiTao(hoaDon.getNguoiNhan());
        hoaDon.setLoai(1);
        hoaDon.setTrangThai(1);
        hoaDon.setMa(hoaDon.getMa());
        hoaDon.setNguoiNhan(hoaDon.getNguoiNhan());
        hoaDon.setKhachHang(hoaDon.getKhachHang());
        hoaDon.setTongTien(hoaDon.getTongTien());
        hoaDon.setTienShip(hoaDon.getTienShip());
        hoaDon.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
//        if(hoaDon.getPhieuGiamGia().getId() == null){
//            hoaDon.setPhieuGiamGia(null);
//        }
        PhieuGiamGia pg = new PhieuGiamGia();
        pg.setGiaTriGiam(new BigDecimal(0));

        HoaDon savedHoaDon = hoaDonService.add(hoaDon);

        String maHoaDon = "HD0" + savedHoaDon.getId();
        savedHoaDon.setMa(maHoaDon);
        hoaDonService.taoMaHoaDon(savedHoaDon.getId(), savedHoaDon);



        return ResponseEntity.ok(savedHoaDon);
    }

    @PostMapping("/them-san-pham-vao-hoa-don/{id}")
    public ResponseEntity<?> themSanPhamVaoHoaDon (@PathVariable("id") Long id ,@RequestBody HoaDonChiTiet hoaDonChiTiet){
        hoaDonChiTiet.setSanPhamChiTiet(hoaDonChiTiet.getSanPhamChiTiet());
        HoaDon hoaDon = new HoaDon();
        hoaDon.setId(id);
        hoaDonChiTiet.setHoaDon(hoaDon);
        hoaDonChiTiet.setSoLuong(hoaDonChiTiet.getSoLuong());
        hoaDonChiTiet.setGia(hoaDonChiTiet.getGia());
        hoaDonChiTiet.setTrangThai(1);
        HoaDonChiTiet saveHDCT = hoaDonChiTietService.add(hoaDonChiTiet);

        return ResponseEntity.ok(saveHDCT);
    }


    @PostMapping("/them-phuong-thuc-thanh-toan/{id}")
    public ResponseEntity<?> themPhuongThucThanhToan (@PathVariable("id") Long id ,@RequestBody PhuongThucThanhToan phuongThucThanhToan){
        phuongThucThanhToan.setTenThanhToan(phuongThucThanhToan.getTenThanhToan());
        HoaDon hd = new HoaDon();
        hd.setId(id);
        phuongThucThanhToan.setHoaDon(hd);
        phuongThucThanhToan.setLoaiThanhToan(phuongThucThanhToan.getLoaiThanhToan());
        phuongThucThanhToan.setTrangThai(phuongThucThanhToan.getTrangThai());
        phuongThucThanhToan.setNgayTao(LocalDateTime.now());
        return ResponseEntity.ok(phuongThucThanhToanService.add(phuongThucThanhToan));
    }

    @PostMapping("/them-san-pham/{id}")
    public ResponseEntity<?> themPhuongThucThanhToan (@PathVariable("id") Long id ,@RequestBody GioHangChiTiet gioHangChiTiet){
        GioHang gh = new GioHang();
        gh.setId(gioHangChiTiet.getGioHang().getId());

        SanPhamChiTiet sp = new SanPhamChiTiet();
        sp.setId(gioHangChiTiet.getSanPhamChiTiet().getId());

        gioHangChiTiet.setGioHang(gh);
        gioHangChiTiet.setSanPhamChiTiet(sp);
        gioHangChiTiet.setSoLuong(1);
        gioHangChiTiet.setNgayTao(LocalDateTime.now());

        return ResponseEntity.ok(gioHangChiTietService.add(gioHangChiTiet));
    }


    @GetMapping("/id-gio-hang/{id}")
    public ResponseEntity<?> idGioHang(@PathVariable("id") Long id) {

        return ResponseEntity.ok(giohangService.IdGioHang(id));
    }

    @PutMapping("/update-so-luong-sp/{id}")
    public ResponseEntity<?> updateSoLuongSPTrongGioHangChiTiet(@PathVariable("id") Long id,
                                                                @RequestBody GioHangChiTiet gioHangChiTiet) {
        return ResponseEntity.ok(giohangService.updateSoLuong(id, gioHangChiTiet));
    }

    @PostMapping("/delete-sp/{id}")
    public ResponseEntity<?> deleteSP(@PathVariable("id") Long id) {
        return ResponseEntity.ok(gioHangChiTietService.deleteById(id));
    }

    @PostMapping("/delete-all-sp/{id}")
    public ResponseEntity<Void> deleteAllSP(@PathVariable("id") Long id) {
        gioHangChiTietService.deleteGioHangChiTietByIdGioHang(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/phieu-giam-gia")
    public List<PhieuGiamGia> phieuGiamGia() {
        return giohangService.getPhieuGiamGia();
    }

    @GetMapping("/dia-chi-khach-hang/{id}")
    public List<DiaChi> phieuGiamGia(@PathVariable("id") Long id) {
        return diaChiService.getKHDESCByID(id);
    }

    @GetMapping("/dia-chi-mac-dinh-khach-hang/{id}")
    public DiaChi getDiaCHiMacDinh(@PathVariable("id") Long id) {
        return diaChiService.getDiaChiMacDinh(id);
    }


    @PutMapping("/update-so-luong-sp-sau-khi-thanh-toan/{id}")
    public ResponseEntity<?> updateSoLuongSauKhiThanhToan(@PathVariable("id") Long id,
                                                                @RequestBody GioHangChiTiet gioHangChiTiet) {
        SanPhamChiTiet sp = sanPhamChiTietService.findById(id);
        int soLuongHienTai = sp.getSoLuong();
        int soLuongMoi = soLuongHienTai - gioHangChiTiet.getSoLuong();

        return ResponseEntity.ok(sanPhamChiTietService.updateSL(id, soLuongMoi));
    }


    @GetMapping("/dem-so-luong-san-pham/{id}")
    public ResponseEntity<?> demSoSanPham(@PathVariable("id") Long id) {
        List<GioHangChiTiet> gioHangChiTiets = giohangService.detailGHCT(id);
        return ResponseEntity.ok(gioHangChiTiets);
    }


}
