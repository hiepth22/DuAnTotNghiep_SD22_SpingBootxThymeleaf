package com.poly.sneaker.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class SanPhamDTO {
    private Long id;
    private String ten;
    private String thuongHieuTen;
    private int soLuongChiTiet;
    private int trangThai;
}