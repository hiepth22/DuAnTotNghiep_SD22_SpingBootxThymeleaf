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


@Controller
@RequestMapping("/phieu-giam-gia")
@CrossOrigin("*")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;

    @GetMapping("index")
    public String HienThi(Model model){
        model.addAttribute("lstPgg",phieuGiamGiaService.getall());
        System.out.println(phieuGiamGiaService.getall());
        return "admin/PhieuGiamGia/index";

    }
    @GetMapping("/AddPhieuGiamGia")
    public String PhieuGiamGiaadd(Model model){
        PhieuGiamGia pgg = new PhieuGiamGia();
        model.addAttribute("pgg",pgg);
        return "admin/PhieuGiamGia/add";
    }

    @PostMapping("/SavePhieuGiamGia")
    public String addPhieuGiamGia(@Valid @ModelAttribute("phieuGiamGia") PhieuGiamGia pgg, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/PhieuGiamGia/add";
        }
        pgg.setNgayBatDau(new Date());
        pgg.setNgayKetThuc(new Date());
        pgg.setNgayTao(new Date());
        pgg.setNgayCapNhat(new Date());
        phieuGiamGiaService.Add(pgg);
        return "redirect:/phieu-giam-gia";
    }
    @GetMapping("/UpdatePhieuGiamGia/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        PhieuGiamGia employee = phieuGiamGiaService.findById(id);
        model.addAttribute("pgg", employee);
        return "admin/PhieuGiamGia/update";
    }



}