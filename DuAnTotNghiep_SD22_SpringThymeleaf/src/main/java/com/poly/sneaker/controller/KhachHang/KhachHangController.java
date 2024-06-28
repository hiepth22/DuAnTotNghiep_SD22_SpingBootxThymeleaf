package com.poly.sneaker.controller.KhachHang;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.sevice.KhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class KhachHangController {
    @Autowired
    private KhachHangService sevice;

    @GetMapping("/search-khach-hang")
    public String search(@RequestParam(name = "keyword", required = false) String keyword,
                                 Model model) {
        List<KhachHang> resultList ;
        if (keyword != null && !keyword.trim().isEmpty()) {
            resultList =sevice.search(keyword);
        } else {
            resultList = sevice.getAll();
        }
        model.addAttribute("kh", resultList);
        model.addAttribute("keyword", keyword);
        return "admin/KhachHang/KhachHang";
    }
    @GetMapping("/khach-hang")
    public String HienThi(Model model){

        model.addAttribute("kh",sevice.getAll());
        return "admin/KhachHang/KhachHangIndext";
    }


    @GetMapping("/view-add")
    public String viewAddKH(Model model) {
        KhachHang kh = new KhachHang();
        model.addAttribute("kh", kh);
        return "admin/KhachHang/KhachHangAdd";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute("khachHang") KhachHang kh, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/KhachHang/KhachHangAdd";
        }
        kh.setNgaycapnhap(LocalDateTime.now());
        kh.setNgaytao(LocalDateTime.now());
        kh.setTrangThai(1);
        sevice.Add(kh);
        return "redirect:/admin/khach-hang"; // Chuyển hướng về trang danh sách khách hàng
    }
    @GetMapping("/view-update/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        KhachHang kh = sevice.findById(id);
        model.addAttribute("kh", kh);
        return "admin/KhachHang/KhachHangUpdate";
    }
    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("kh") KhachHang kh, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/KhachHang/KhachHangUpdate";
        }

        KhachHang updatedNv = sevice.update(id, kh);
        if (updatedNv != null) {
            return "redirect:/admin/khach-hang";
        } else {
            return "redirect:/admin/khach-hang";
        }
    }


}
