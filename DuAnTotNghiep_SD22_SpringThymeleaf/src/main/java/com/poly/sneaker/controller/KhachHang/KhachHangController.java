package com.poly.sneaker.controller.KhachHang;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.sevice.DiaChiService;
import com.poly.sneaker.sevice.KhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/admin")
public class KhachHangController {
    @Autowired

    private KhachHangService sevice;
    private DiaChiService diaChiService;

    private final JavaMailSender mailSender;

    public KhachHangController(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @GetMapping("/search-khach-hang")
    public String search(@RequestParam(name = "keyword", required = false) String keyword,
                                 Model model) {
        List<KhachHang> resultList ;
        if (keyword != null && !keyword.trim().isEmpty()) {
            resultList =sevice.search(keyword);
        } else {
            resultList = sevice.getAll();
        }
        model.addAttribute("kh", resultList);
        model.addAttribute("keyword", keyword);
        return "admin/KhachHang/KhachHang";
    }
    @GetMapping("/khach-hang")
    public String hienThi(@RequestParam(name = "page", defaultValue = "0") int page,
                          @RequestParam(name = "size", defaultValue = "5") int size,
                          Model model) {

        Page<KhachHang> khachHangPage = sevice.getAllPage(page, size);
        model.addAttribute("khachHangPage", khachHangPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", khachHangPage.getTotalPages());

        return "admin/KhachHang/KhachHangIndext";
    }


    @GetMapping("/view-add")
    public String viewAddKH(Model model) {
        KhachHang kh = new KhachHang();
        model.addAttribute("kh", kh);
        return "admin/KhachHang/KhachHangAdd";
    }

    private String genPassword(){
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";

        String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomChar = alphaNumeric.charAt(index);
            sb.append(randomChar);
        }
        return sb.toString();
    }
    public void sendPasswordEmail(String to, String password) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Tài Khoản Và Mật Khẩu");
        message.setText("Tài Khoản: " + to + "\nMật Khẩu: " + password);

        mailSender.send(message);
    }
    @PostMapping("/add")
    public String add(@Valid @ModelAttribute("kh") KhachHang kh,
                      BindingResult result, Model model, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/KhachHang/KhachHangAdd";
        }

        // Generate password and set other fields
        String password = genPassword();
        kh.setNgaycapnhap(LocalDateTime.now());
        kh.setNgaytao(LocalDateTime.now());
        kh.setTrangThai(1);
        kh.setMatKhau(password);
        sendPasswordEmail(kh.getEmail(), kh.getMatKhau());

        // Add customer to the database
        sevice.Add(kh);

        // Add success message to redirect attributes
        redirectAttributes.addFlashAttribute("successMessage", "Thêm khách hàng thành công!");

        // Redirect to the customer list page
        return "redirect:/admin/khach-hang";
    }


    @GetMapping("/view-update/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        KhachHang kh = sevice.findById(id);
        model.addAttribute("kh", kh);
        return "admin/KhachHang/KhachHangUpdate";
    }
    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("kh") KhachHang kh, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/KhachHang/KhachHangUpdate";
        }
//        kh.setTrangThai(1);
        KhachHang updatedNv = sevice.update(id, kh);
        if (updatedNv != null) {
            return "redirect:/admin/khach-hang";
        } else {
            return "redirect:/admin/khach-hang";
        }
    }

    @PostMapping("/khach-hang/{id}/delete")
    public ResponseEntity<String> delteTrangThai(@PathVariable("id") Long id, @RequestBody Map<String, Integer> requestBody) {
        Integer trangThai = requestBody.get("trangThai");

        try {
            sevice.updateTrangThai(id, trangThai);
            return ResponseEntity.ok("Cập nhật trạng thái khách hàng thành công");
        } catch (Exception e) {
            e.printStackTrace(); // Hoặc log lỗi vào hệ thống
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái nhân viên");
        }
    }
    @GetMapping("/dia-chi/{idKH}")
    public String getByID(){
        return "admin/KhachHang/KhachHang";
    }

}
