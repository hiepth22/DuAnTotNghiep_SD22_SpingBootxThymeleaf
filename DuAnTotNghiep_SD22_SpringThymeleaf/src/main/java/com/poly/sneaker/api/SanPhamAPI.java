package com.poly.sneaker.api;

import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.SanPhamService;
import com.poly.sneaker.sevice.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/admin/san-pham")
public class SanPhamAPI {
    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private ThuongHieuService thuongHieuService;

    @GetMapping("/all")
    public ResponseEntity<List<SanPham>> getAllSanPhams() {
        List<SanPham> sanPhams = sanPhamService.getAll();
        return ResponseEntity.ok(sanPhams);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<SanPham>> getAllSanPhamsByStatus() {
        List<SanPham> sanPhams = sanPhamService.getSanPham();
        return ResponseEntity.ok(sanPhams);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addSanPham(@RequestBody Map<String, Object> request) {
        String ten = (String) request.get("ten");
        Long thuongHieuId = Long.valueOf((String) request.get("thuongHieuId"));

        Map<String, Object> response = new HashMap<>();

        ThuongHieu thuongHieu = thuongHieuService.finById(thuongHieuId);
        if (thuongHieu == null) {
            response.put("success", false);
            response.put("message", "Thương hiệu không tồn tại.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        if (sanPhamService.existsByTenAndThuongHieu(ten, thuongHieu)) {
            response.put("success", false);
            response.put("message", "Sản phẩm đã tồn tại với tên và thương hiệu này.");
            return ResponseEntity.ok(response);
        }

        SanPham sanPham = new SanPham();
        sanPham.setTen(ten);
        sanPham.setThuongHieu(thuongHieu);
        sanPham.setTrangThai(1);
        sanPham.setNgayTao(new Date());
        sanPham.setNgayCapNhat(null);
        sanPham.setNguoiTao("admin");

        sanPhamService.add(sanPham);

        response.put("success", true);
        response.put("message", "Sản phẩm đã được lưu thành công.");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/trang-thai/{id}")
    public ResponseEntity<String> updateTrangThai(@PathVariable Long id, @RequestBody Map<String, Integer> payload) {
        Integer newStatus = payload.get("trangThai");
        SanPham updatedSanPham = sanPhamService.updateTrangThai(id, newStatus);
        if (updatedSanPham != null) {
            return ResponseEntity.ok("Cập nhật thành công");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Sản phẩm không tồn tại");
        }
    }

}
