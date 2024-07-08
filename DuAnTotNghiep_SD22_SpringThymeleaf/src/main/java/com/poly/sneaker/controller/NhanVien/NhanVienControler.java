package com.poly.sneaker.controller.NhanVien;

import com.poly.sneaker.Security.FileUploadUtil;
import com.poly.sneaker.dto.NhanVienPhanTrang;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.NhanVienRepository;
import com.poly.sneaker.sevice.NhanVienSevice;
import jakarta.persistence.Id;
import jakarta.validation.Valid;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class NhanVienControler {
    @Autowired
    private NhanVienSevice sevice;
    @Autowired
    private NhanVienRepository repository;

    private final JavaMailSender emailSender;

    @Autowired
    public NhanVienControler(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }

    @GetMapping("/nhan-vien")
    public String HienThi(Model model) {
        model.addAttribute("lstNv", sevice.getallNhanVien());
        return "admin/NhanVien/NhanVienIndext";
    }

    @GetMapping("/search")
    public String searchNhanVien(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "trangThai") Optional<Integer> trangThai,
            @RequestParam(name = "vai_tro") Optional<Integer> vaiTro,
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
            page_size = 5;
        }

        List<NhanVienPhanTrang> results = sevice.loc(keyword, trangThai, vaiTro,
                (page_index - 1) * page_size, page_size,startDate,endDate);

        List<NhanVien> lstNv = new ArrayList<>();
        for (NhanVienPhanTrang nv1 : results) {
            lstNv.add(new NhanVien(nv1.getId(),
                    nv1.getTen(),
                    nv1.getMa(),
                    nv1.getSdt(),
                    nv1.getNgaySinh(),
                    nv1.getEmail(),
                    nv1.getGioiTinh(),
                    nv1.getDiachi(),
                    nv1.getCccd(),
                    nv1.getAnh(),
                    nv1.getMatKhau(),
                    nv1.getVaiTro(),
                    nv1.getTrangThai(),
                    nv1.getNgaytao(),
                    nv1.getNgaycapnhap()
            ));
        }

        model.addAttribute("lstNv", lstNv);

        int totalRows = 0;
        if (results != null && !results.isEmpty()) {
            totalRows = results.get(0).getTotalRow();
        }
        int totalPages = (int) Math.ceil((double) totalRows / page_size);

        model.addAttribute("totalPage1", totalPages);
        model.addAttribute("TotalPage", totalRows);
        model.addAttribute("CurrentPage", page_index);

        return "admin/NhanVien/NhanVien";
    }



    @GetMapping("/addNhanVien")
    public String NhanVienadd() {
        return "admin/NhanVien/NhanVienAdd";
    }

    private String generateMaNhanVien() {
        String ma = String.valueOf(repository.count() + 1);
        return "NV0" + ma;
    }

    @PostMapping("/SaveNhanVien")
    public String addNhanVien(@Valid @ModelAttribute("nv") NhanVien nv,
                              @RequestParam(name = "img", required = false) MultipartFile img,
                              BindingResult result,
                              Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/NhanVien/NhanVienAdd";
        }

        if (img.getOriginalFilename().equals("")) {

        } else {
            String extension = FilenameUtils.getExtension(img.getOriginalFilename());
            String name = UUID.randomUUID().toString() + "." + extension;
            saveImage(img, name);
            nv.setAnh("assets/image/" + name);
        }

        nv.setNgaytao(java.time.LocalDateTime.now());
        nv.setNgaycapnhap(java.time.LocalDateTime.now());
        nv.setTrangThai(0);
        String newPassword = generateRandomPassword();
        nv.setMatKhau(newPassword);
        sendPasswordEmail(nv.getEmail(), nv.getMatKhau());
        nv.setMa(generateMaNhanVien());


        sevice.Add(nv);
        model.addAttribute("successMessage", "Thêm nhân viên thành công!");
        return "redirect:/admin/nhan-vien";
    }

    @GetMapping("/UpdateNhanVien/{id}") //
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        NhanVien nv = sevice.findById(id);
        model.addAttribute("nv", nv);
        return "admin/NhanVien/NhanVienUpdate";
    }

    @PostMapping("/updateNhanVien/{id}")
    public String updateNhanVien(@PathVariable("id") Long id, @Valid @ModelAttribute("nv") NhanVien nv, BindingResult result
    ,@RequestParam(name = "img", required = false) MultipartFile img) {
        if (result.hasErrors()) {
            return "admin/NhanVien/NhanVienUpdate";
        }
        if (img.getOriginalFilename().equals("")) {

        } else {
            String extension = FilenameUtils.getExtension(img.getOriginalFilename());
            String name = UUID.randomUUID().toString() + "." + extension;
            saveImage(img, name);
            nv.setAnh("assets/image/" + name);

        }

        NhanVien updatedNv = sevice.update(id, nv);
        if (updatedNv != null) {
            return "redirect:/admin/nhan-vien";
        } else {
            return "redirect:/admin/nhan-vien";
        }
    }
    @PostMapping("/nhan-vien/{id}/update")
    public ResponseEntity<String> updateTrangThaiNhanVien(@PathVariable("id") Long id, @RequestBody Map<String, Integer> requestBody) {
        Integer trangThai = requestBody.get("trangThai");

        try {
            sevice.updateTrangThai(id, trangThai);
            return ResponseEntity.ok("Cập nhật trạng thái nhân viên thành công");
        } catch (Exception e) {
            e.printStackTrace(); // Hoặc log lỗi vào hệ thống
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái nhân viên");
        }
    }



    //-----------------------------xử lí ảnh mật khẩu và mail->
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

    public void saveImage(MultipartFile file, String Name) {
        String uploadDir = "image";
        String fileName = Name;
        System.out.println(fileName);
        try {
            FileUploadUtil.saveFile(uploadDir, fileName, file);
        } catch (IOException ioException) {

            ioException.printStackTrace();
        }
    }


}

