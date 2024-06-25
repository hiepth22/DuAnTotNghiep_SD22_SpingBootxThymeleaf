package com.poly.sneaker.controller.KhachHang;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.sevice.HoaDonService;
import com.poly.sneaker.sevice.KhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.CrossOrigin;

@RestController
@RequestMapping("/khach-hang")
@CrossOrigin(origins = "*")
public class KhachHangController {

    @Autowired
    private KhachHangService service;

    @Autowired
    HoaDonService hoaDonService;

    @GetMapping("")
    public List<KhachHang> HienThi() {
        return service.getAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> detail(@PathVariable(name = "id") Long id) {
        if (!service.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy!!");
        }
        return ResponseEntity.ok(service.findById(id));
    }

//    @GetMapping("/page")
//    public ResponseEntity<?> page(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
//        Pageable pageable = PageRequest.of(page, size);
//        Page<KhachHang> khachHangPage = service.phanTrang(pageable, 1);
//        List<KhachHang> list = khachHangPage.getContent().stream()
//                .sorted(Comparator.comparing(KhachHang::getId))
//                .collect(Collectors.toList());
//        return ResponseEntity.ok(list);
//    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid KhachHang kh, BindingResult rs) {
        if (rs.hasErrors()) {
            List<ObjectError> list = rs.getAllErrors();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(list);
        }

        service.add(kh);
        return ResponseEntity.ok("Thành Công!!!");
    }

//    @DeleteMapping("/{id}")
//    public ResponseEntity<?> delete(@PathVariable(name = "id") Long id) {
//        if (!service.existsById(id)) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy");
//        }
//        return ResponseEntity.ok(service.deleteById(id));
//    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable("id") Long id, @RequestBody KhachHang nv) {
        if (!service.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy");
        }
        return ResponseEntity.ok(service.update(id, nv));
    }

//    @GetMapping("/search")
//    public ResponseEntity<?> search(@RequestParam String keyword) {
//        List<KhachHang> resultList = service.search(keyword);
//        if (resultList.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
//        }
//        return ResponseEntity.ok(resultList);
//    }


    @PutMapping("tt/{id}")
    public ResponseEntity<?> updateTT(@PathVariable("id") Long id) {
        if (!service.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy");
        }
        return ResponseEntity.ok(service.updateTrangThaiToInactive(id));
    }




}
