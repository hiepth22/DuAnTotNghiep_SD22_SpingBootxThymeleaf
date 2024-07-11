package com.poly.sneaker.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

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
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ma", length = 30)
    private String ma;


    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "hinhThucGiam")
    private Boolean hinhThucGiam;

    @Column(name = "giaTriGiam")
    private BigDecimal giaTriGiam;
//
//    @Column(name = "donToiThieu")
//    private BigDecimal donToiThieu;

    @Column(name = "giamToiDa")
    private BigDecimal giamToiDa;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "ngayBatDau")
    private Date ngayBatDau;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "ngayKetThuc")
    private Date ngayKetThuc;


    @Column(name = "trangThai")
    private Integer trangThai;


}