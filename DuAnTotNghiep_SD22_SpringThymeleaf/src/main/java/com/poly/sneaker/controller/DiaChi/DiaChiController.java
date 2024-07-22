package com.poly.sneaker.controller.DiaChi;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.sevice.DiaChiService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.server.ResponseStatusException;

@Controller
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;

    @GetMapping("/dia-chi-view-update/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        DiaChi kh = diaChiService.findById(id);
        if (kh == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Địa chỉ không tìm thấy");
        }
        model.addAttribute("dc", kh);
        return "admin/DiaChi/DiaChiUpdate";
    }

    @PostMapping("/dia-chi-update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("dc") DiaChi kh, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/DiaChi/DiaChiUpdate";
        }
//        kh.setTrangThai(1);
        DiaChi updated = diaChiService.update(id, kh);
        if (updated != null) {
            return "redirect:/admin/khach-hang";
        } else {
            return "redirect:/admin/khach-hang";
        }
    }
}
