package com.poly.sneaker.controller.PhieuGiamGia;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.sevice.PhieuGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/phieu-giam-gia")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;

//    @GetMapping("/search-phieu-giam-gia")
//    public String search(@RequestParam(name = "keyword", required = false) String keyword,
//                         Model model) {
//        List<KhachHang> resultList ;
////        if (keyword != null && !keyword.trim().isEmpty()) {
////            resultList =phieuGiamGiaService.search(keyword);
////        } else {
////            resultList = phieuGiamGiaService.getall();
////        }
////        model.addAttribute("pgg", resultList);
////        model.addAttribute("keyword", keyword);
//        return "admin/PhieuGiamGia/PhieuGiamGia";
//    }

    @GetMapping("/phieu-giam-gia")
    public String HienThi(Model model){
        model.addAttribute("lstPgg",phieuGiamGiaService.getall());
        return "admin/PhieuGiamGia/PhieuGiamGiaIndext";

    }
    @GetMapping("/phieu-giam-gia/add")
    public String PhieuGiamGiaAdd(Model model){
        PhieuGiamGia pgg = new PhieuGiamGia();
        model.addAttribute("pgg", pgg);
        return "admin/PhieuGiamGia/PhieuGiamGiaAdd";
    }

    @PostMapping("/add")
    public String addPhieuGiamGia(@Valid @ModelAttribute("phieuGiamGia") PhieuGiamGia pgg, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/PhieuGiamGia/PhieuGiamGiaAdd";
        }
        pgg.setNgayBatDau(new Date());
        pgg.setNgayKetThuc(new Date());

        phieuGiamGiaService.Add(pgg);
        return "redirect:/admin/phieu-giam-gia";
    }
    @GetMapping("/phieu-giam-gia-update/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        PhieuGiamGia pgg = phieuGiamGiaService.findById(id);
        model.addAttribute("pgg", pgg);
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }
    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("pgg") PhieuGiamGia pgg, BindingResult result) {
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