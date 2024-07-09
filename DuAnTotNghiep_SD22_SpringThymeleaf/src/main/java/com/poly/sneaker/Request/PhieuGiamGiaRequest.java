package com.poly.sneaker.Request;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
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

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date ngayBatDau;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date ngayKetThuc;


    private Integer trangThai;

}
