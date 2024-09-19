package com.poly.sneaker.controller.ThuocTinhSanPham;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.sevice.ChatLieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ChatLieuController {

    @Autowired
    ChatLieuService chatLieuService;

    @GetMapping("/chat-lieu")
    public String hienThiChatLieu(
            @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
            @Param(value = "keyword") String keyword,
            Model model) {

        Page<ChatLieu> chatLieus = chatLieuService.pagination(pageNo);

        if (keyword != null){
            chatLieus = this.chatLieuService.searchChatLieu(keyword, pageNo);
            model.addAttribute("keyword", keyword);
        }

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPage", chatLieus.getTotalPages());
        model.addAttribute("chatLieus", chatLieus);

        model.addAttribute("hasResultsCL", chatLieus.getTotalElements() > 0);

        return "/admin/ThuocTinhSanPham/chatLieuPage";
    }


    @GetMapping("/chat-lieu/add")
    public String hienThiFormThemChatLieu(Model model) {
        model.addAttribute("chatLieu", new ChatLieu());
        return "/admin/ThuocTinhSanPham/addChatLieuPage";
    }

    @PostMapping("/chat-lieu/add")
    public String themChatLieu(ChatLieu chatLieu, RedirectAttributes redirectAttributes) {
        if (chatLieuService.existingByTen(chatLieu.getTen())) {
            redirectAttributes.addFlashAttribute("errorMessage", "Tên chất liệu đã tồn tại.");
            return "redirect:/admin/chat-lieu/add"; // Hoặc đường dẫn tới trang thêm mới
        }
        chatLieu.setTrangThai(1);
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
        chatLieu.setNguoiCapNhat("Nguyễn Bá Đăng");
        chatLieu.setNgayCapNhat(new Date());
        chatLieuService.update(chatLieu.getId(), chatLieu);
        return "redirect:/admin/chat-lieu";
    }
}
