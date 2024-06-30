package com.poly.sneaker.Request;

import jakarta.persistence.*;
import lombok.*;

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


    private Date ngayBatDau;


    private Date ngayKetThuc;


    private Integer trangThai;

}
