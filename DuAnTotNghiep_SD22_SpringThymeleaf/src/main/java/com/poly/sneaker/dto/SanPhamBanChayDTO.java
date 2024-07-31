package com.poly.sneaker.dto;

import com.poly.sneaker.entity.SanPhamChiTiet;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SanPhamBanChayDTO {


    private Long id;
    private String anh;
    private String ten;
    private BigDecimal giaBan;
    private Long tongSoLuong;


}
