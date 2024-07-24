package com.poly.sneaker.api;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.GioHangRepository;
import com.poly.sneaker.sevice.DiaChiService;
import com.poly.sneaker.sevice.GioHangChiTietService;
import com.poly.sneaker.sevice.GiohangService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/them-san-pham-vao-hoa-don")
    public String loginSubmit(@RequestParam(name = "id") Long id,
                              @RequestParam(name = "soLuong") int soLuong,
                              Model model, HttpSession session) {
//        Optional<KhachHang> lst = khachHangRepository.findByEmail(email);
//        if (!lst.isEmpty()) {
//            KhachHang kh = lst.get();
//            if (matKhau.equals(kh.getMatKhau())) {
//                model.addAttribute("khachHang", kh);
//                model.addAttribute("id", kh.toString());
//                session.setAttribute("khachHang", kh);
//                return "client/viewClient";
//            }
//        }
        model.addAttribute("error", true);
        return "Login/login";
    }

}
