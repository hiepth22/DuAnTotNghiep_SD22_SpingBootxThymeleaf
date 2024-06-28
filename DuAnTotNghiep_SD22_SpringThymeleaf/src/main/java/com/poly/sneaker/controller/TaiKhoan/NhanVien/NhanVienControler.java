package com.poly.sneaker.controller.TaiKhoan.NhanVien;

import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.sevice.NhanVienSevice;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/admin")
public class NhanVienControler {
    @Autowired
    private NhanVienSevice sevice;

    private final JavaMailSender emailSender;

    @Autowired
    public NhanVienControler(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }

    @GetMapping("/nhanvien")
    public String searchNhanVien(@RequestParam(name = "keyword", required = false) String keyword,
                                 Model model) {
        List<NhanVien> resultList ;
        if (keyword != null && !keyword.trim().isEmpty()) {
            resultList =sevice.searchNhanViens(keyword);
        } else {
            resultList = sevice.getallNhanVien();
        }
        model.addAttribute("lstNv", resultList);
        model.addAttribute("keyword", keyword);
        return "admin/NhanVien/NhanVien";
    }

    @GetMapping("/nhan-vien")
    public String HienThi(Model model){
        model.addAttribute("lstNv",sevice.getallNhanVien());
        return "admin/NhanVien/NhanVienIndext";
    }
    @GetMapping("/addNhanVien")
    public String NhanVienadd(Model model){
        NhanVien nv = new NhanVien();
        model.addAttribute("nv",nv);
        return "admin/NhanVien/NhanVienAdd";
    }

    @PostMapping("/SaveNhanVien")
    public String addNhanVien(@Valid @ModelAttribute("nhanVien") NhanVien nv, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/NhanVien/NhanVienAdd";
        }
        nv.setNgaytao(java.time.LocalDateTime.now());
        nv.setNgaycapnhap(java.time.LocalDateTime.now());
        nv.setTrangThai(1);
        String newPassword = generateRandomPassword();
        nv.setMatKhau(newPassword);
        sendPasswordEmail(nv.getEmail(), nv.getMatKhau());

        sevice.Add(nv);
        return "redirect:/admin/nhan-vien";
    }
    @GetMapping("/UpdateNhanVien/{id}") //
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        NhanVien employee = sevice.findById(id);
        model.addAttribute("nv", employee);
        return "admin/NhanVien/NhanVienUpdate";
    }
    @PostMapping("/updateNhanVien/{id}")
    public String updateNhanVien(@PathVariable("id") Long id, @Valid @ModelAttribute("nv") NhanVien nv, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/NhanVien/NhanVienUpdate";
        }

        NhanVien updatedNv = sevice.update(id, nv);
        if (updatedNv != null) {
            return "redirect:/admin/nhan-vien";
        } else {
            return "redirect:/admin/nhan-vien";
        }
    }
    @GetMapping("/phantrang")
    public String searchNhanViens(@RequestParam(name = "keyword", required = false) String keyword,
                                  Model model) {
        List<NhanVien> resultList ;
        if (keyword != null && !keyword.trim().isEmpty()) {
            resultList =sevice.searchNhanViens(keyword);
        } else {
            resultList = sevice.getallNhanVien();
        }
        model.addAttribute("lstNv", resultList);
        model.addAttribute("keyword", keyword);
        return "admin/NhanVien/NhanVienIndext";
    }


    private String generateRandomPassword() {
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

        emailSender.send(message);
    }


}
