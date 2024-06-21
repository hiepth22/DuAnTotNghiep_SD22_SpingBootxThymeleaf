package com.poly.sneaker.controller;

import com.poly.sneaker.entity.PhieuGiamGia;
import com.poly.sneaker.service.PhieuGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/phieu-giam-gia")
@CrossOrigin("*")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;

    @GetMapping("")
    public List<PhieuGiamGia> HienThi() {
        List<PhieuGiamGia> lst = phieuGiamGiaService.getall();
        return lst;
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> detail(@PathVariable(name = "id") Long id) {
        if (!phieuGiamGiaService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    "Không tìm thấy id"
            );
        }
        return ResponseEntity.ok(phieuGiamGiaService.findById(id));
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid PhieuGiamGia pgg, BindingResult rs) {
        if (rs.hasErrors()) {
            List<ObjectError> lst = rs.getAllErrors();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(lst);
        }
        phieuGiamGiaService.Add(pgg);
        return ResponseEntity.ok("thêm thành công");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable(name = "id") Long id) {
        if (!phieuGiamGiaService.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    "Không tìm thấy id"
            );
        }
        return ResponseEntity.ok(phieuGiamGiaService.deleteById(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable("id") Long id
            , @RequestBody PhieuGiamGia pgg) {
        if (!phieuGiamGiaService.existsById(id)) {
            ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    "Không tìm thấy"
            );
        }
        return ResponseEntity.ok(phieuGiamGiaService.update(id, pgg));
    }
    @PutMapping("tt/{id}")
    public ResponseEntity<?> updateTT(@PathVariable("id") Long id
    ) {
        if (!phieuGiamGiaService.existsById(id)) {
            ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    "Không tìm thấy"
            );
        }
        return ResponseEntity.ok(phieuGiamGiaService.updateTrangThai(id));
    }
    @GetMapping("page")
    public ResponseEntity<?> page(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<PhieuGiamGia> phieuGiamGiaPage = phieuGiamGiaService.page( pageable,1);

        List<PhieuGiamGia> lst = phieuGiamGiaPage.getContent()
                .stream()
                .sorted(Comparator.comparing(PhieuGiamGia::getId))
                .collect(Collectors.toList());
        return ResponseEntity.ok(lst);
    }
}