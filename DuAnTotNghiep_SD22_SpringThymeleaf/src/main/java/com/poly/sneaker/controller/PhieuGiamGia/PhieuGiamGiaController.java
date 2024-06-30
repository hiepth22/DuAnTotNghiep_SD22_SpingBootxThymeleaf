package com.poly.sneaker.controller.PhieuGiamGia;

import com.poly.sneaker.Request.PhieuGiamGiaRequest;
import com.poly.sneaker.entity.PhieuGiamGia;
import com.poly.sneaker.repository.PhieuGiamGiaRepository;
import com.poly.sneaker.sevice.PhieuGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


@Controller
@RequestMapping("/admin")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;
    PhieuGiamGiaRepository phieuGiamGiaRepository;

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
            pggnew.setDonToiThieu(pgg.getDonToiThieu());
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
        model.addAttribute("pgg", pgg);
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }

    @PostMapping("/updatePhieuGiamGia/{id}")
    public String updatePhieuGiamGia(@PathVariable("id") Long id, @Valid @ModelAttribute("pgg") PhieuGiamGia pgg, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
        }

        PhieuGiamGia updatedPgg = phieuGiamGiaService.update(id, pgg);
        if (updatedPgg != null) {
            return "redirect:/admin/phieu-giam-gia";
        } else {
            return "redirect:/admin/phieu-giam-gia";
        }
    }


}