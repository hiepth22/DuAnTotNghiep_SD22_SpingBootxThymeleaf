package com.poly.sneaker.api;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.sevice.ChatLieuService;
import com.poly.sneaker.sevice.NhaSanXuatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/nsx")
public class NSXAPI {
    @Autowired
    private NhaSanXuatService nsxService;

    @GetMapping("/all")
    public ResponseEntity<List<NhaSanXuat>> getAllNSX() {
        List<NhaSanXuat> nsx = nsxService.getAll();
        return ResponseEntity.ok(nsx);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<NhaSanXuat>> getAllNSXByStatus() {
        List<NhaSanXuat> nsx = nsxService.getNSX();
        return ResponseEntity.ok(nsx);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addChatLieu(@RequestParam("ten") String ten) {
        Map<String, Object> response = new HashMap<>();

        if (nsxService.existingByTen(ten)) {
            response.put("success", false);
            response.put("message", "Nhà sản xuất đã tồn tại");
            return ResponseEntity.ok(response);
        }

        NhaSanXuat nhaSanXuat = new NhaSanXuat();
        nhaSanXuat.setNgayTao(new Date());
        nhaSanXuat.setNguoiTao("admin");
        nhaSanXuat.setTen(ten);
        nhaSanXuat.setTrangThai(1);
        nsxService.add(nhaSanXuat);

        response.put("success", true);
        response.put("message", "Đã thêm mới nhà sản xuất");
        return ResponseEntity.ok(response);
    }
}
