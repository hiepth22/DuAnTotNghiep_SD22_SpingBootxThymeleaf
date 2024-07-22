package com.poly.sneaker.api;

import com.poly.sneaker.entity.Anh;
import com.poly.sneaker.sevice.AnhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api")
public class AnhAPI {

    @Autowired
    private AnhService anhService;

    @PostMapping("/upload-images")
    public ResponseEntity<List<Anh>> uploadImages(@RequestParam("files") MultipartFile[] files) {
        List<Anh> uploadedImages = new ArrayList<>();

        for (MultipartFile file : files) {
            try {
                // Tạo tên file và lưu vào thư mục
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get("src/main/resources/static/imageSP/" + fileName);
                Files.write(filePath, file.getBytes());

                // Lưu thông tin ảnh vào cơ sở dữ liệu
                Anh anh = Anh.builder()
                        .ten(file.getOriginalFilename())
                        .url("/imageSP/" + fileName)
                        .nguoiTao("admin")
                        .ngayTao(new Date())
                        .trangThai(1)
                        .build();

                anh = anhService.save(anh); // Lưu vào cơ sở dữ liệu

                uploadedImages.add(anh);
            } catch (IOException e) {
                e.printStackTrace();
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
            }
        }

        return ResponseEntity.ok(uploadedImages);
    }
}



