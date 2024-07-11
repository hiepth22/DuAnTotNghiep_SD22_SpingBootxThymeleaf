package com.poly.sneaker.controller.PhieuGiamGia;

import com.poly.sneaker.Request.PhieuGiamGiaRequest;
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

import java.util.Date;
import java.util.Map;


@Controller
@RequestMapping("/admin")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;
    PhieuGiamGiaRepository phieuGiamGiaRepository;

//    @GetMapping("/phieu-giam-gia")
//    public String getAll(Model model, @RequestParam(defaultValue = "1") int page) {
//        if (page < 1) page = 1;
//        Pageable pageable = PageRequest.of(page - 1, 10);
//        Page<PhieuGiamGia> phieuGiamGias = phieuGiamGiaService.getAll(pageable);
//        model.addAttribute("page", phieuGiamGias);
//        return "admin/PhieuGiamGia/PhieuGiamGiaIndex";
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
    public String addPhieuGiamGia(@Valid @ModelAttribute("phieuGiamGia") PhieuGiamGiaRequest pgg, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            System.out.println("loi");
            PhieuGiamGia pggnew = new PhieuGiamGia();

            pggnew.setMa("VC"+  phieuGiamGiaService.getall().size() );
            pggnew.setSoLuong(pgg.getSoLuong());
            pggnew.setHinhThucGiam(pgg.getHinhThucGiam());
//            pggnew.setDonToiThieu(pgg.getDonToiThieu());
            pggnew.setGiaTriGiam(pgg.getGiaTriGiam());
            pggnew.setGiamToiDa(pgg.getGiamToiDa());
            pggnew.setNgayBatDau(new Date());
            pggnew.setNgayKetThuc(new Date());
            pggnew.setTrangThai(pgg.getTrangThai());
            phieuGiamGiaService.Add(pggnew);

            return "redirect:/admin/phieu-giam-gia";

        }
        return "redirect:/admin/phieu-giam-gia";
    }

    @GetMapping("/UpdatePhieuGiamGia/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        PhieuGiamGia pgg = phieuGiamGiaService.findById(id);
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
        System.out.println(pgg.getNgayBatDau());
        System.out.println(pgg.getNgayKetThuc());
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
//        Pageable pageable = PageRequest.of(page - 1, 5); // 5 là số lượng item mỗi trang
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