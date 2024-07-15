package com.poly.sneaker.controller.PhieuGiamGia;

import com.poly.sneaker.Request.PhieuGiamGiaRequest;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.entity.PhieuGiamGia;
import com.poly.sneaker.repository.PhieuGiamGiaRepository;
import com.poly.sneaker.sevice.PhieuGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/admin")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;
    PhieuGiamGiaRepository phieuGiamGiaRepository;

//    @GetMapping("/search-phieu-giam-gia")
//    public String search(@RequestParam(name = "keyword", required = false) String keyword,
//                         Model model) {
//        List<PhieuGiamGia> resultList;
//        if (keyword != null && !keyword.trim().isEmpty()) {
//            resultList = phieuGiamGiaService.search(keyword);
//        } else {
//            resultList = phieuGiamGiaService.getAll();
//        }
//        model.addAttribute("pgg", resultList);
//        model.addAttribute("keyword", keyword);
//        return "admin/PhieuGiamGia/PhieuGiamGia";
//    }
//
//    @GetMapping("/phieu-giam-gia")
//    public String hienThi(@RequestParam(name = "page", defaultValue = "0") int page,
//                          @RequestParam(name = "size", defaultValue = "5") int size,
//                          Model model) {
//
//        Page<PhieuGiamGia> phieuGiamGiaPage = phieuGiamGiaService.getAllPage(page, size);
//        model.addAttribute("phieuGiamGiaPage", phieuGiamGiaPage);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", phieuGiamGiaPage.getTotalPages());
//        model.addAttribute("size", size); // Thêm thuộc tính size để truyền vào phân trang
//
//        return "admin/PhieuGiamGia/PhieuGiamGiaIndext";
//    }

    @GetMapping("/phieu-giam-gia")
    public String HienThi(Model model) {
        model.addAttribute("lstPgg", phieuGiamGiaService.getall());
        return "admin/PhieuGiamGia/PhieuGiamGiaIndext";

    }

    @GetMapping("/addPhieuGiamGia")
    public String PhieuGiamGiaAdd(Model model) {
        model.addAttribute("phieuGiamGia", new PhieuGiamGia());
        return "admin/PhieuGiamGia/PhieuGiamGiaAdd";
    }

    @PostMapping("/SavePhieuGiamGia")
    public String addPhieuGiamGia(@Valid @ModelAttribute("phieuGiamGia") PhieuGiamGia pgg, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
//            PhieuGiamGia pggnew = new PhieuGiamGia();

//            pgg.setMa("VC"+  phieuGiamGiaService.getall().size() );
            pgg.setMa(generateMaPhieuGiamGia());
            pgg.setSoLuong(pgg.getSoLuong());
            pgg.setHinhThucGiam(pgg.getHinhThucGiam());
            pgg.setDonToiThieu(pgg.getDonToiThieu());
            pgg.setGiaTriGiam(pgg.getGiaTriGiam());
            pgg.setGiamToiDa(pgg.getGiamToiDa());
            pgg.setNgayBatDau(LocalDate.now());
            pgg.setNgayKetThuc(LocalDate.now());
            pgg.setTrangThai(1);
            phieuGiamGiaService.Add(pgg);

            return "redirect:/admin/phieu-giam-gia";

        }
        return "redirect:/admin/phieu-giam-gia";
    }

    private String generateMaPhieuGiamGia() {
        String ma = String.valueOf(phieuGiamGiaRepository.count() + 1);
        return "PGG" + ma;
    }

    @GetMapping("/UpdatePhieuGiamGia/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        PhieuGiamGia pgg = phieuGiamGiaService.findById(id);
        model.addAttribute("pgg", pgg);
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }

    @PostMapping("/updatePhieuGiamGia/{id}")
    public String updatePhieuGiamGia(@PathVariable("id") Long id, @Valid @ModelAttribute("pgg") PhieuGiamGia pgg, BindingResult result) {
        if (result.hasErrors()) {
            PhieuGiamGia updatedPgg = phieuGiamGiaService.update(id, pgg);
            if (updatedPgg != null) {
                return "redirect:/admin/phieu-giam-gia";
            }

        }
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }
    @PostMapping("/phieu-giam-gia/{id}/delete")
    public ResponseEntity<String> delteTrangThai(@PathVariable("id") Long id, @RequestBody Map<String, Integer> requestBody) {
        Integer trangThai = requestBody.get("trangThai");

        try {
            phieuGiamGiaService.updateTrangThai(id, trangThai);
            return ResponseEntity.ok("Cập nhật trạng thái phiếu giảm giá thành công");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái phiếu giảm ");
        }
    }
//    @GetMapping("/searchTrangThai")
//    public String searchTrangThai(@RequestParam(value = "status", required = false, defaultValue = "all") String status,
//                                  @RequestParam(defaultValue = "1") int page, Model model) {
//        Page<PhieuGiamGia> phieuGiamGias;
//        Pageable pageable = PageRequest.of(page - 1, 5);
//
//        if ("all".equals(status)) {
//            phieuGiamGias = phieuGiamGiaService.getAllPhieu(pageable);
//        } else {
//            phieuGiamGias = phieuGiamGiaService.searchTrangThai(status, pageable);
//        }
//
//        model.addAttribute("listPhieu", phieuGiamGias.getContent());
//        model.addAttribute("page", phieuGiamGias);
//        model.addAttribute("status", status);
//
//        return "/admin/phieu-giam-gia";
//    }

}