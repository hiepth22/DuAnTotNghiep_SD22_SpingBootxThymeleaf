package com.poly.sneaker.controller.DiaChi;

import com.poly.sneaker.dto.DiaChiAdd;
import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.sevice.DiaChiService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;


    private Long idkh;
    @GetMapping("/api/khach-hang/dia-chi/{id}")
    public ResponseEntity<?> getByID(@PathVariable Long id) {
        try {
            List<DiaChi> diaChiList = diaChiService.getByID(id);
            idkh = id;
            diaChiList.sort((d1, d2) -> {
                if (d1.getTrangThai() == 1 && d2.getTrangThai() != 1) {
                    return -1; // d1 nên đứng trước d2
                } else if (d1.getTrangThai() != 1 && d2.getTrangThai() == 1) {
                    return 1; // d1 nên đứng sau d2
                } else {
                    return 0;
                }
            });
            return ResponseEntity.ok(diaChiList);
        } catch (Exception e) {
            String errorMessage = "Error retrieving addresses for customer with ID: " + id;
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
        }
    }

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
      DiaChiAdd dto = new DiaChiAdd(dc.getId(),idkh,dc.getThanhPho(),dc.getQuanHuyen()
      , dc.getPhuongXa(),dc.getSoNha(),dc.getMoTaChiTiet(),dc.getTen(),dc.getTrangThai(),dc.getNgayTao(),dc.getNgayCapNhat());
//        dc.setIdKH(idkh);
        dc.setNgayTao(java.time.LocalDateTime.now());
        diaChiService.add(dto);
        redirectAttributes.addFlashAttribute("successMessage", "Địa chỉ đã được thêm thành công.");
        return "redirect:/admin/khach-hang";
    }
}
