package com.poly.sneaker.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Entity
@Table(name = "dia_chi")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class DiaChi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "idKhachHang")
    private KhachHang idKH;

    @Column(name = "thanhPho", length = 30)
    private String thanhPho;

    @Column(name = "quanHuyen", length = 30)
    private String quanHuyen;

    @Column(name = "phuongXa")
    private String phuongXa;

    @Column(name = "soNha", length = 50)
    private String soNha;

    @Column(name = "moTaChiTiet")
    private String moTaChiTiet;

    @Column(name = "tenNguoiNhan")
    private String ten;

    @Column(name = "trangThai")
    private int trangThai;

    @Column(name = "ngayTao")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ngayTao;

    @Column(name = "ngayCapNhat")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ngayCapNhat;
    public void updateTrangThai(int newTrangThai) {
        this.trangThai = newTrangThai;
        this.ngayCapNhat = LocalDateTime.now();
    }
}
