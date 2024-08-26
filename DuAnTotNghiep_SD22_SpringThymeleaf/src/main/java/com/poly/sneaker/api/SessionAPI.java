package com.poly.sneaker.api;

import com.poly.sneaker.entity.KhachHang;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/session")
public class SessionAPI {

    @GetMapping("/user")
    public ResponseEntity<KhachHang> getUser(HttpSession session) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            return ResponseEntity.ok(khachHang);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpSession session) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            session.removeAttribute("khachHang");
            return ResponseEntity.ok("Đã đăng xuất thành công.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy người dùng để đăng xuất.");
        }
    }
}
