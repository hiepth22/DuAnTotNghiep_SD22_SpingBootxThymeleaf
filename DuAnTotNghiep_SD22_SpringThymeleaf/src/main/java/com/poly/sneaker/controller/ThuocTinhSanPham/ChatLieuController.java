package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.sevice.ChatLieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class ChatLieuController {

    @Autowired
    ChatLieuService chatLieuService;

    @GetMapping("/chat-lieu")
    public String hienThiChatLieu(Model model){
        List<ChatLieu> chatLieus = chatLieuService.getAll();
        model.addAttribute("chatLieus", chatLieus);
        return "/admin/ThuocTinhSanPham/chatLieuPage";
    }
}
