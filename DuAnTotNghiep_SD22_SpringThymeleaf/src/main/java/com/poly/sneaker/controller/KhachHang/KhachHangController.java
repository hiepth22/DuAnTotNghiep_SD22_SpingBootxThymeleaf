package com.poly.sneaker.controller.KhachHang;

import com.poly.sneaker.dto.KhachHangDTO;
import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import com.poly.sneaker.sevice.DiaChiService;
import com.poly.sneaker.sevice.KhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.*;

@Controller
@RequestMapping("/admin")
public class KhachHangController {
    @Autowired

    private KhachHangService sevice;
    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    KhachHangRepository khachHangRepository;

    private final JavaMailSender mailSender;

    public KhachHangController(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

//    @GetMapping("/search-khach-hang")
//    public String search(@RequestParam(name = "keyword", required = false) String keyword,
//                         Model model) {
//        List<KhachHang> resultList;
//        if (keyword != null && !keyword.trim().isEmpty()) {
//            resultList = sevice.search(keyword);
//        } else {
//            resultList = sevice.getAll();
//        }
//        model.addAttribute("kh", resultList);
//        model.addAttribute("keyword", keyword);
//        return "admin/KhachHang/KhachHang";
//    }
    @GetMapping("/khach-hang")
    public String HienThi(Model model) {
        model.addAttribute("kh", sevice.getAll());
        return "admin/KhachHang/KhachHangIndext";
    }
    @GetMapping("/search-khach-hang")
    public String search(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "trangThai") Optional<Integer> trangThai,
            @RequestParam(name = "page_index", required = false) Integer page_index,
            @RequestParam(name = "page_size", required = false) Integer page_size,
            @RequestParam(name = "startDate", required = false) Date startDate,
            @RequestParam(name = "endDate", required = false) Date endDate,
            Model model
    ) {

        if (page_index == null || page_index < 1) {
            page_index = 1;
        }
        if (page_size == null || page_size < 1) {
            page_size = 7;
        }

        List<KhachHangDTO> results = sevice.loc(keyword, trangThai,
                (page_index - 1) * page_size, page_size,startDate,endDate);

        List<KhachHang> lstNv = new ArrayList<>();
        for (KhachHangDTO kh : results) {
            lstNv.add(new KhachHang(kh.getId(),
                    kh.getTen(),
                    kh.getMa(),
                    kh.getSdt(),
                    kh.getNgaySinh(),
                    kh.getEmail(),
                    kh.getGioiTinh(),
                    kh.getCccd(),
                    kh.getAnh(),
                    kh.getMatKhau(),
                    kh.getTrangThai(),
                    kh.getNgayTao(),
                    kh.getNgayCapNhat()
            ));
        }

        model.addAttribute("kh", lstNv);

        int totalRows = 0;
        if (results != null && !results.isEmpty()) {
            totalRows = results.get(0).getTotalRow();
        }
        int totalPages = (int) Math.ceil((double) totalRows / page_size);

        model.addAttribute("totalPage1", totalPages);
        model.addAttribute("TotalPage", totalRows);
        model.addAttribute("CurrentPage", page_index);

        return "admin/KhachHang/KhachHang";
    }

//    @GetMapping("/khach-hang")
//    public String hienThi(@RequestParam(name = "page", defaultValue = "0") int page,
//                          @RequestParam(name = "size", defaultValue = "5") int size,
//                          Model model) {
//
//        Page<KhachHang> khachHangPage = sevice.getAllPage(page, size);
//        model.addAttribute("khachHangPage", khachHangPage);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", khachHangPage.getTotalPages());
//        model.addAttribute("size", size); // Thêm thuộc tính size để truyền vào phân trang
//
//        return "admin/KhachHang/KhachHangIndext";
//    }


    @GetMapping("/view-add")
    public String viewAddKH(Model model) {
        KhachHang kh = new KhachHang();
        model.addAttribute("kh", kh);
        return "admin/KhachHang/KhachHangAdd";
    }

    private String genPassword() {
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
        kh.setMa(generateMaKH());
        sendPasswordEmail(kh.getEmail(), kh.getMatKhau());

        // Add customer to the database
        sevice.Add(kh);

        // Add success message to redirect attributes
        redirectAttributes.addFlashAttribute("successMessage", "Thêm khách hàng thành công!");

        // Redirect to the customer list page
        return "redirect:/admin/khach-hang";
    }
    private String generateMaKH() {
        String ma = String.valueOf(khachHangRepository.count() + 1);
        return "KH0" + ma;
    }
    @GetMapping("/check-email")
    public ResponseEntity<Boolean> checkEmailExists(@RequestParam String email) {
        boolean exists = khachHangRepository.findByEmail(email).isPresent();
        return ResponseEntity.ok(exists);
    }

    @GetMapping("/check-sdt")
    public ResponseEntity<Boolean> checkSdtExists(@RequestParam String sdt) {
        boolean exists = khachHangRepository.findBySdt(sdt).isPresent();
        return ResponseEntity.ok(exists);
    }

    @GetMapping("/view-update/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        KhachHang kh = sevice.findById(id);
        model.addAttribute("kh", kh);
        return "admin/KhachHang/KhachHangUpdate";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("kh") KhachHang kh
            , BindingResult result) {
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

//    @GetMapping("/khach-hang/dia-chi/{idKH}")
//    @ResponseBody
//    public List<DiaChi> getDiaChi(@PathVariable("idKH") Long idKH) {
//        return diaChiService.getByID(idKH);
//    }


}
