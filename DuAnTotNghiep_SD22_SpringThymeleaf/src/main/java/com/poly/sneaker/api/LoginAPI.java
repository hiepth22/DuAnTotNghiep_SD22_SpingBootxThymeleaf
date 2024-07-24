package com.poly.sneaker.api;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/")
public class LoginAPI {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @PostMapping("/logincheck")
    public ResponseEntity<Map<String, Object>> loginSubmit(@RequestParam(name = "email") String email,
                                                           @RequestParam(name = "matKhau") String matKhau) {
        Optional<KhachHang> lst = khachHangRepository.findByEmail(email);
        Map<String, Object> response = new HashMap<>();

        if (lst.isPresent()) {
            KhachHang kh = lst.get();
            if (matKhau.equals(kh.getMatKhau())) {
                response.put("id", kh.getId());
                return ResponseEntity.ok(response);
            }
        }
        response.put("error", true);
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
    }
}
