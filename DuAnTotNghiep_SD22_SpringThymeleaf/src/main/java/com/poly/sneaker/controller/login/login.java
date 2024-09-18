package com.poly.sneaker.controller.login;

import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import com.poly.sneaker.sevice.GiohangService;
import com.poly.sneaker.sevice.KhachHangService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Controller
@RequestMapping("")
public class login {

    @Autowired
    private KhachHangRepository khachHangRepository;
    @Autowired
    private GiohangService ghsevice;
    @Autowired
    private KhachHangService service;


    private final JavaMailSender emailSender;
    @Autowired
    private HttpSession httpSession;

    @Autowired
    public login(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "Login/login";
    }
    @GetMapping("/loginadmin")
    public String showLoginFormadmin(Model model) {

        return "admin/loginAdmin";
    }
    @GetMapping("/")
    public String show(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "redirect:Client";
    }

    @GetMapping("/check-email")
    public ResponseEntity<Boolean> checkEmailExists(@RequestParam String email) {
        boolean exists = khachHangRepository.findByEmail(email).isPresent();
        return ResponseEntity.ok(exists);
    }
    @PostMapping("/logincheck")
    public String loginSubmit(@RequestParam(name = "email") String email,
                              @RequestParam(name = "matKhau") String matKhau,
                              Model model, HttpSession session) {
        Optional<KhachHang> lst = khachHangRepository.findByEmail(email);
        if (!lst.isEmpty()) {
            KhachHang kh = lst.get();
            if (matKhau.equals(kh.getMatKhau())) {
                model.addAttribute("khachHang", kh);
                model.addAttribute("id", kh.toString());
                session.setAttribute("khachHang", kh);
                return "redirect:Client";
            }
        }
        model.addAttribute("error", true);
        return "Login/login";
    }

//    @PostMapping("/logincheck")
//    public String loginSubmit(@RequestParam(name = "email") String email,
//                              @RequestParam(name = "matKhau") String matKhau,
//                              Model model) {
//        Optional<KhachHang> lst = khachHangRepository.findByEmail(email);
//        if (lst.isPresent()) {
//            KhachHang kh = lst.get();
//            if (matKhau.equals(kh.getMatKhau())) {
//                model.addAttribute("khachHang", kh);
//                return "client/viewClient";
//            }
//        }
//        model.addAttribute("error", true);
//        return "Login/login";
//    }


    @PostMapping("/loginadd")
    public String loginadd(@RequestParam(name = "ten") String ten,
                           @RequestParam(name = "email") String email,
                           @RequestParam(name = "matKhau") String matKhau,
                           @RequestParam(name = "matKhaulai") String matKhaulai,
                           Model model) {
        if (matKhau.equals(matKhaulai)) {
            KhachHang kh = new KhachHang();
            kh.setTen(ten);
            kh.setEmail(email);
            kh.setMatKhau(matKhau);
            kh.setTrangThai(1);
            kh.setNgaytao(java.time.LocalDateTime.now());
            kh.setNgaycapnhap(java.time.LocalDateTime.now());
//            service.Add(kh);
            KhachHang success = service.Add(kh);
            if (success != null) {

//                System.out.println(success.getId());
//                GioHang gh = new GioHang();
//                gh.setNgayTao(java.time.LocalDateTime.now());
//                gh.setKhachHang(success);
//                ghsevice.add(gh);
            } else {

            }
            return "Login/login";

        }
        else {
            return "Login/login";
        }
//        model.addAttribute("error", true);
//        return "Login/login";
    }
    @PostMapping("/laylaimk")
    public String laylaimk(@RequestParam(name = "email") String email,
                           Model model) {
        Optional<KhachHang> lst = khachHangRepository.findByEmail(email);
        if (!lst.isEmpty()) {
            String mkmoi =  generateRandomPassword();
            sendPasswordEmail(email ,mkmoi);
            service.resetPassword(email,mkmoi);
            return "redirect:login";
        }
        else {

        }
        return "Login/login";
    }
    public void sendPasswordEmail(String to, String password) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(" Mật Khẩu mới của bạn là:");
        message.setText( "\nMật Khẩu: " + password);

        emailSender.send(message);
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

}
