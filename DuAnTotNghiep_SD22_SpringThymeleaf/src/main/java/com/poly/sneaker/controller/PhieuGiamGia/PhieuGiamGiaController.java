package com.poly.sneaker.controller.PhieuGiamGia;

import com.poly.sneaker.entity.PhieuGiamGia;
import com.poly.sneaker.sevice.PhieuGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
@RequestMapping("/admin")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;


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

            return "redirect:/admin/phieu-giam-gia";
        }
//        pgg.setMa(generateMaPhieuGiamGia());
        pgg.setMa(pgg.getMa());
        pgg.setTen(pgg.getTen());
        pgg.setSoLuong(pgg.getSoLuong());
        pgg.setHinhThucGiam(pgg.getHinhThucGiam());
        pgg.setDonToiThieu(pgg.getDonToiThieu());
        pgg.setGiaTriGiam(pgg.getGiaTriGiam());
        pgg.setGiamToiDa(pgg.getGiamToiDa());
        pgg.setNgayBatDau(pgg.getNgayBatDau());
        pgg.setNgayKetThuc(pgg.getNgayKetThuc());

        LocalDate now = LocalDate.now();
        if (now.isBefore(pgg.getNgayBatDau())) {
            pgg.setTrangThai(2); // Chưa diễn ra
        } else if (now.isAfter(pgg.getNgayKetThuc())) {
            pgg.setTrangThai(1); // Ngừng hoạt động
        } else {
            pgg.setTrangThai(0); // Hoạt động
        }

        phieuGiamGiaService.Add(pgg);
        return "redirect:/admin/phieu-giam-gia";
    }


    @GetMapping("/UpdatePhieuGiamGia/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        PhieuGiamGia pgg = phieuGiamGiaService.findById(id);
        model.addAttribute("pgg", pgg);
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }

    @PostMapping("/savePhieuGiamGia/{id}")
    public String updatePhieuGiamGia(@PathVariable("id") Long id, @Valid @ModelAttribute("pgg") PhieuGiamGia pgg, BindingResult result) {
        LocalDate now = LocalDate.now();
        if (now.isBefore(pgg.getNgayBatDau())) {
            pgg.setTrangThai(2); // Chưa diễn ra
        } else if (now.isAfter(pgg.getNgayKetThuc())) {
            pgg.setTrangThai(1); // Ngừng hoạt động
        } else {
            pgg.setTrangThai(0); // Hoạt động
        }
        if (result.hasErrors()) {
            return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
        }
        PhieuGiamGia updatedPgg = phieuGiamGiaService.update(id, pgg);
        if (updatedPgg != null) {
            return "redirect:/admin/phieu-giam-gia";
        }
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }

    @PostMapping("/phieu-giam-gia/{id}/delete")
    public ResponseEntity<String> deleteTrangThai(@PathVariable("id") Long id, @RequestBody Map<String, Integer> requestBody) {
        Integer trangThai = requestBody.get("trangThai");

        try {
            phieuGiamGiaService.updateTrangThai(id, trangThai);
            return ResponseEntity.ok("Cập nhật trạng thái phiếu giảm giá thành công");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái phiếu giảm ");
        }
    }


}