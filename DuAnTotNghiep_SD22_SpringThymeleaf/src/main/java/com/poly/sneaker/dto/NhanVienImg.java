package com.poly.sneaker.dto;

import com.poly.sneaker.entity.NhanVien;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;
@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
public class NhanVienImg extends NhanVien {
    private MultipartFile img;
}
