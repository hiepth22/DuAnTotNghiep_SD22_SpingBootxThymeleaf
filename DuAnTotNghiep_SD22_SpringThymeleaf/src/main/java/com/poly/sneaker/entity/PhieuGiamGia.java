package com.poly.sneaker.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.time.LocalDateTime;
@Entity
@Table(name = "phieu_giam_gia")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class PhieuGiamGia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ma", length = 30)
    private String ma;

    @Column(name = "ten", length = 30)
    private String ten;

    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "hinhThucGiam")
    private Boolean hinhThucGiam;

    @Column(name = "dieuKienGiam")
    private BigDecimal dieuKienGiam;

    @Column(name = "giaTriGiam")
    private BigDecimal giaTriGiam;

    @Column(name = "giamToiDa")
    private BigDecimal giamToiDa;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayBatdau")
    private LocalDateTime ngayBatdau;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayKetThuc")
    private LocalDateTime ngayKetThuc;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayCapNhat")
    private LocalDateTime ngayCapNhat;

    @Column(name = "nguoiTao", length = 50)
    private String nguoiTao;

    @Column(name = "nguoiCapNhat", length = 50)
    private String nguoiCapNhat;

    @Column(name = "trangThai")
    private Integer trangThai;


}