package com.poly.sneaker.api;
import com.poly.sneaker.entity.Anh;
import com.poly.sneaker.sevice.AnhService;
import com.poly.sneaker.sevice.SanPhamChiTietService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/anh")
public class AnhApi {
    @Autowired
    private AnhService anhService;

    @PostMapping("/upload")
    public ResponseEntity<List<Anh>> uploadMultipleAnh(@RequestParam("files") List<MultipartFile> files,
                                                       @RequestParam("sanPhamChiTietId") Long sanPhamChiTietId) {
        try {
            List<Anh> savedAnhList = anhService.saveMultipleFiles(files, sanPhamChiTietId);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedAnhList);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
