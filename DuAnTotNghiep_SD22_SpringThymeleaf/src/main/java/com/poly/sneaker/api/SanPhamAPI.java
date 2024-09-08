package com.poly.sneaker.api;

import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.SanPhamService;
import com.poly.sneaker.sevice.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin/san-pham")
public class SanPhamAPI {
    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private ThuongHieuService thuongHieuService;

    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addSanPham(@RequestBody Map<String, Object> request) {
        String ten = (String) request.get("ten");
        Long thuongHieuId = Long.parseLong((String) request.get("thuongHieuId"));

        Map<String, Object> response = new HashMap<>();

        if (sanPhamService.existingByTen(ten)) {
            response.put("success", false);
            response.put("message", "Sản phẩm đã tồn tại, bạn có muốn tiếp tục lưu?");
            return ResponseEntity.ok(response);
        } else {
            SanPham sanPham = new SanPham();
            sanPham.setTen(ten);
            sanPham.setThuongHieu(thuongHieuService.finById(thuongHieuId));
            sanPham.setNgayTao(new Date());
            sanPham.setNgayCapNhat(null);
            sanPham.setNguoiTao("admin");

            sanPhamService.add(sanPham);

            response.put("success", true);
            response.put("message", "Sản phẩm đã được lưu thành công.");
            return ResponseEntity.ok(response);
        }
    }


}
