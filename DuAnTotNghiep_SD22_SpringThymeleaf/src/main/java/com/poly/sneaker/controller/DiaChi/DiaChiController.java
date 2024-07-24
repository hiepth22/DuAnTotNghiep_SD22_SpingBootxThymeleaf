package com.poly.sneaker.controller.DiaChi;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.sevice.DiaChiService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

@Controller
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;

    @GetMapping("/dia-chi-view-update/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        DiaChi dc = diaChiService.findById(id);
        if (dc == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Địa chỉ không tìm thấy");
        }
        model.addAttribute("dc", dc);
        return "admin/DiaChi/DiaChiUpdate";
    }

    @PostMapping("/dia-chi-update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("dc") DiaChi kh, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/DiaChi/DiaChiUpdate";
        }
        DiaChi updated = diaChiService.update(id, kh);
        if (updated != null) {
            return "redirect:/admin/khach-hang";
        } else {
            return "redirect:/admin/khach-hang";
        }
    }
    @GetMapping("/admin/dia-chi-view-add")
    public String viewAddKH(Model model) {
        DiaChi dc = new DiaChi();
        model.addAttribute("dc", dc);
        return "admin/DiaChi/DiaChiAdd";
    }
    @PostMapping("/admin/dia-chi-add")
    public String add(@Valid @ModelAttribute("dc") DiaChi dc,
                      BindingResult result, Model model, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/DiaChi/DiaChiAdd";
        }
        dc.setNgayTao(java.time.LocalDateTime.now());
        dc.setIdKH(dc.getIdKH());
        diaChiService.add(dc);
        redirectAttributes.addFlashAttribute("successMessage", "Địa chỉ đã được thêm thành công.");
        return "redirect:/admin/khach-hang";
    }
}
