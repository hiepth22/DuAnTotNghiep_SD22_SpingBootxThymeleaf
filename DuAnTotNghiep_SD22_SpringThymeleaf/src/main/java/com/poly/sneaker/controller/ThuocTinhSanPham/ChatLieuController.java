package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.sevice.ChatLieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.Date;
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

    @GetMapping("/chat-lieu/add")
    public String hienThiFormThemChatLieu(Model model) {
        model.addAttribute("chatLieu", new ChatLieu());
        return "/admin/ThuocTinhSanPham/addChatLieuPage";
    }

    @PostMapping("/chat-lieu/add")
    public String themChatLieu(ChatLieu chatLieu){
        chatLieuService.add(chatLieu);
        return "redirect:/admin/chat-lieu";
    }

    @GetMapping("/chat-lieu/update/{id}")
    public String hienThiCapNhatChatLieu(@PathVariable("id") Long id, Model model) {
        ChatLieu chatLieu = chatLieuService.finById(id);
        if (chatLieu == null) {
            return "redirect:/admin/chat-lieu";
        }
        model.addAttribute("chatLieu", chatLieu);
        return "/admin/ThuocTinhSanPham/updateChatLieuPage";
    }

    @PostMapping("/chat-lieu/update")
    public String capNhatChatLieu(@ModelAttribute ChatLieu chatLieu) {
        chatLieu.setNgayCapNhat(new Date());
        chatLieuService.update(chatLieu.getId(), chatLieu);
        return "redirect:/admin/chat-lieu";
    }
}
