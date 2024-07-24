package com.poly.sneaker.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder;


import java.time.LocalDateTime;

@Entity
@Table(name = "gio_hang_chi_tiet")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GioHangChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "idGioHang")
    private GioHang gioHang;

    @ManyToOne
    @JoinColumn(name = "idSanPhamChiTiet")
    private SanPhamChiTiet sanPhamChiTiet;

    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "ngayCapNhat")
    private LocalDateTime ngayCapNhat;

    @Column(name = "nguoiTao")
    private Long nguoiTao;

    @Column(name = "nguoiCapNhat")
    private Long nguoiCapNhat;
}
