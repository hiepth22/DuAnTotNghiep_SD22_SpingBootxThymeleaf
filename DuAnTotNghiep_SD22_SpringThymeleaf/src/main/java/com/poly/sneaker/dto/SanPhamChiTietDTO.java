package com.poly.sneaker.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class SanPhamChiTietDTO {

    private Long id;
    private String ma;
    private String ten;
    private String anh;
    private Integer soLuong;
    private BigDecimal giaBan;
    private String moTa;
    private Integer trangThai;
    private Integer canNang;
    private String kichCo;
    private String mauSac;
    private String deGiay;
    private String chatLieu;
    private Long sanPham;
    private String coGiay;
    private String nhaSanXuat;
    private Date ngayCapNhat;
    private String tenThuongHieu;


    public SanPhamChiTietDTO(Long id, String ma, String ten, String anh, Integer soLuong, BigDecimal giaBan,
                             String moTa, Integer trangThai, Integer canNang, String kichCo, String mauSac,
                             String deGiay, String chatLieu, Long sanPham, String coGiay,
                             String nhaSanXuat, Date ngayCapNhat, String tenThuongHieu) {
        this.id = id;
        this.ma = ma;
        this.ten = ten;
        this.anh = anh;
        this.soLuong = soLuong;
        this.giaBan = giaBan;
        this.moTa = moTa;
        this.trangThai = trangThai;
        this.canNang = canNang;
        this.kichCo = kichCo;
        this.mauSac = mauSac;
        this.deGiay = deGiay;
        this.chatLieu = chatLieu;
        this.sanPham = sanPham;
        this.coGiay = coGiay;
        this.nhaSanXuat = nhaSanXuat;
        this.ngayCapNhat = ngayCapNhat;
        this.tenThuongHieu = tenThuongHieu;
    }
}
