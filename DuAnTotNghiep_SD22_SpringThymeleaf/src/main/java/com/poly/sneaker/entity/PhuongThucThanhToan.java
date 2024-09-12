package com.poly.sneaker.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "phuong_thuc_thanh_toan")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PhuongThucThanhToan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "idHoaDon")
    private HoaDon hoaDon;

    @Column(name = "tenThanhToan")
    private String tenThanhToan;

    @Column(name = "loaiThanhToan")
    private Boolean loaiThanhToan;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "ngayCapNhat")
    private LocalDateTime ngayCapNhat;

    @Column(name = "nguoiTao")
    private Long nguoiTao;

    @Column(name = "nguoiCapNhat")
    private Long nguoiCapNhat;

    @Column(name = "trangThai")
    private Integer trangThai;

    @Column(name = "tienDaThanhToan")
    private BigDecimal tienDaThanhToan;

}
