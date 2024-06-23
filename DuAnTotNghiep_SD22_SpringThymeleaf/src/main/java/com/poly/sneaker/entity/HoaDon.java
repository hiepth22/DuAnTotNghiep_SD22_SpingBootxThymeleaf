package com.poly.sneaker.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "hoa_don")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "idPhieuGiamGia")
    private PhieuGiamGia phieuGiamGia;

    @ManyToOne
    @JoinColumn(name = "idNhanVien")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "idKhachHang")
    private KhachHang khachHang;

    @Column(name = "ma", length = 30)
    private String ma;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "ngayCapNhat")
    private LocalDateTime ngayCapNhat;

    @Column(name = "nguoiTao", length = 50)
    private String nguoiTao;

    @Column(name = "nguoiCapNhat", length = 50)
    private String nguoiCapNhat;

    @Column(name = "ngayGiaoHang")
    private LocalDateTime ngayGiaoHang;

    @Column(name = "tienShip")
    private BigDecimal tienShip;

    @Column(name = "ngayNhan")
    private LocalDateTime ngayNhan;

    @Column(name = "ngayThanhToan")
    private LocalDateTime ngayThanhToan;

    @Column(name = "tongTien")
    private BigDecimal tongTien;

    @Column(name = "tongTienSauGiam")
    private BigDecimal tongTienSauGiam;

    @Column(name = "nguoiNhan", length = 50)
    private String nguoiNhan;

    @Column(name = "sdtNguoiNhan", length = 20)
    private String sdtNguoiNhan;

    @Column(name = "diaChiNguoiNhan", length = 100)
    private String diaChiNguoiNhan;

    @Column(name = "ghiChu", length = 200)
    private String ghiChu;

    @Column(name = "trangThai")
    private Integer trangThai;
}
