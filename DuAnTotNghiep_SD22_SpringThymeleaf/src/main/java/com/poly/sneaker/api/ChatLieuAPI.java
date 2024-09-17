package com.poly.sneaker.api;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.sevice.ChatLieuService;
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
@RequestMapping("/api/chat-lieu")
public class ChatLieuAPI {
    @Autowired
    private ChatLieuService chatLieuService;

    @GetMapping("/all")
    public ResponseEntity<List<ChatLieu>> getAllChatLieu() {
        List<ChatLieu> chatLieus = chatLieuService.getAll();
        return ResponseEntity.ok(chatLieus);
    }

    @GetMapping("/all-status")
    public ResponseEntity<List<ChatLieu>> getAllChatLieuByStatus() {
        List<ChatLieu> chatLieus = chatLieuService.getChatLieu();
        return ResponseEntity.ok(chatLieus);
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addChatLieu(@RequestParam("ten") String ten) {
        Map<String, Object> response = new HashMap<>();

        if (chatLieuService.existingByTen(ten)) {
            response.put("success", false);
            response.put("message", "Chất liệu đã tồn tại");
            return ResponseEntity.badRequest().body(response);
        }

        ChatLieu chatLieu = new ChatLieu();
        chatLieu.setNgayTao(new Date());
        chatLieu.setNguoiTao("admin");
        chatLieu.setTen(ten);
        chatLieu.setTrangThai(1);
        chatLieuService.add(chatLieu);

        response.put("success", true);
        response.put("message", "Chất liệu đã được thêm mới");
        return ResponseEntity.ok(response);
    }
}
