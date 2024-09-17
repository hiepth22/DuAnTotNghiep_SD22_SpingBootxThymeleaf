package com.poly.sneaker.controller.NhanVien;

import com.poly.sneaker.Security.FileUploadUtil;
import com.poly.sneaker.dto.NhanVienPhanTrang;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.NhanVienRepository;
import com.poly.sneaker.sevice.NhanVienService;
import jakarta.validation.Valid;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class NhanVienControler {
    @Autowired
    private NhanVienService sevice;
    @Autowired
    private NhanVienRepository repository;

    private final JavaMailSender emailSender;

    //    @Autowired
//    private PasswordEncoder passwordEncoder;
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
                (page_index - 1) * page_size, page_size, startDate, endDate);

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
                    nv1.getNgayTao(),
                    nv1.getNgayCapNhat()
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
    public String addNhanVien(@ModelAttribute("nv") NhanVien nv,
                              @RequestParam(name = "dc", required = false) String dc,
                              @RequestParam(name = "anh", required = false) String anh,
                              Model model) throws IOException {

        nv.setNgayTao(java.time.LocalDateTime.now());
        nv.setNgayCapNhat(java.time.LocalDateTime.now());
        nv.setTrangThai(1);

        String newPassword = generateRandomPassword();
//         String encodedPassword = passwordEncoder.encode(newPassword);
         nv.setMatKhau(newPassword);
        String getma = generateMaNhanVien();
        sendPasswordEmail(nv.getEmail(), newPassword);
        nv.setMa(getma);

        if (dc != null) {
            nv.setDiachi(nv.getDiachi() + "," + dc);
        }
//        String extension = FilenameUtils.getExtension(img.getOriginalFilename());
//        String name = UUID.randomUUID().toString() + "." + extension;

//        String fileName = StringUtils.cleanPath(img.getOriginalFilename());
        String uploadDir = "./src/main/resources/static/assets/imageNV";
        nv.setAnh(anh);

//        FileUploadUtil.saveFile(uploadDir, name, img);
        model.addAttribute("successMessage", "Thêm nhân viên thành công!");
        sevice.Add(nv);
        return "redirect:/admin/nhan-vien";
    }
    @GetMapping("/check-emailnv")
    public ResponseEntity<Boolean> checkEmailExists(@RequestParam String email) {
        boolean exists = repository.findByEmail(email).isPresent();
        return ResponseEntity.ok(exists);
    }

    @GetMapping("/check-sdtnv")
    public ResponseEntity<Boolean> checkSdtExists(@RequestParam String sdt) {
        boolean exists = repository.findBySdt(sdt).isPresent();
        return ResponseEntity.ok(exists);
    }
    public void saveImage(MultipartFile file, String name) {
        // Đường dẫn tuyệt đối đến thư mục lưu trữ ảnh
        // Sử dụng đường dẫn tương đối từ thư mục gốc của dự án
        String uploadDir = Paths.get("src", "main", "resources", "static", "assets", "imageNV").toAbsolutePath().toString();

        try {
            // Gọi phương thức lưu tệp tin
            FileUploadUtil.saveFile(uploadDir, name, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @GetMapping("/UpdateNhanVien/{id}") //
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        NhanVien nv = sevice.findById(id);
        if (nv.getDiachi() == null) {

        } else {


            String[] fruits = nv.getDiachi().split(",");


            if (fruits.length >= 3) {

//                String lastThreeElements = fruits[fruits.length - 3] + ","
//                        + fruits[fruits.length - 2] + ","
//                        + fruits[fruits.length - 1];

                StringBuilder remainingElements = new StringBuilder();
                for (int i = 0; i < fruits.length - 3; i++) {
                    remainingElements.append(fruits[i]);
                    if (i < fruits.length - 4) {
                        remainingElements.append(",");
                    }
                }

                // In kết quả ra console
                System.out.println("Thành phố : " + fruits[fruits.length - 1]);
                System.out.println("quận : " + fruits[fruits.length - 2]);
                System.out.println("phường : " + fruits[fruits.length - 3]);
                System.out.println("dcct " + remainingElements.toString());
                model.addAttribute("thanhpho", fruits[fruits.length - 1]);
                model.addAttribute("quan", fruits[fruits.length - 2]);
                model.addAttribute("phuong", fruits[fruits.length - 3]);
                model.addAttribute("dcct", remainingElements.toString());

            } else {
                // Xử lý khi mảng không đủ 3 phần tử
                System.out.println("Mảng không có đủ 3 phần tử");
            }
        }


        model.addAttribute("nv", nv);
        return "admin/NhanVien/NhanVienUpdate";
    }

    @PostMapping("/updateNhanVien/{id}")
    public String updateNhanVien(@PathVariable("id") Long id, @Valid @ModelAttribute("nv") NhanVien nv, BindingResult result
            ,  @RequestParam(name = "anh", required = false) String anh, @RequestParam(name = "dc", required = false) String dc) {
        if (result.hasErrors()) {
            return "admin/NhanVien/NhanVienUpdate";
        }

        nv.setAnh(anh);

        NhanVien nvid = sevice.findById(id);
        if (nv.getDiachi().equals("")) {

        } else {
            nv.setDiachi(nv.getDiachi() + "," + dc);
        }
        if (nvid.getDiachi() == null) {

        } else {
            String[] fruits = nvid.getDiachi().split(",");


            if (fruits.length >= 3) {
                StringBuilder remainingElements = new StringBuilder();
                for (int i = 0; i < fruits.length - 3; i++) {
                    remainingElements.append(fruits[i]);
                    if (i < fruits.length - 4) {
                        remainingElements.append(",");
                    }
                }
                String lastThreeElements = fruits[fruits.length - 3] + ","
                        + fruits[fruits.length - 2] + ","
                        + fruits[fruits.length - 1];
                if (dc.equals("")) {
                    nv.setDiachi(nv.getDiachi() + "," + lastThreeElements);
                } else {
                    nv.setDiachi(nv.getDiachi() + "," + dc);
                }

            } else {
                System.out.println("Mảng không có đủ 3 phần tử");
            }
        }


        NhanVien updatedNv = sevice.update(id, nv);
        if (updatedNv != null) {
            return "redirect:/admin/nhan-vien";
        } else {
            return "redirect:/admin/nhan-vien";
        }
    }

    @PostMapping("/nhan-vien/{id}/update")
    public ResponseEntity<String> updateTrangThaiNhanVien(@PathVariable("id") Long id, @RequestParam Integer trangThai) {
        try {
            // Gọi service để cập nhật trạng thái nhân viên
            sevice.updateTrangThai(id, trangThai);
            return ResponseEntity.ok("Cập nhật trạng thái nhân viên thành công");
        } catch (Exception e) {
            e.printStackTrace(); // Hoặc log lỗi vào hệ thống
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái nhân viên");
        }
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


