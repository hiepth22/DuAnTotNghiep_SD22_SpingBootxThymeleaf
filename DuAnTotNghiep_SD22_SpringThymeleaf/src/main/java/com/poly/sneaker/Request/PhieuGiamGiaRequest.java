package com.poly.sneaker.Request;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class PhieuGiamGiaRequest {


    private Long id;


    private String ma;


    private Integer soLuong;


    private Boolean hinhThucGiam;


    private BigDecimal giaTriGiam;


    private BigDecimal donToiThieu;


    private BigDecimal giamToiDa;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "ngayBatDau")
    private LocalDate ngayBatDau;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "ngayKetThuc")
    private LocalDate ngayKetThuc;


    private Integer trangThai;

}
