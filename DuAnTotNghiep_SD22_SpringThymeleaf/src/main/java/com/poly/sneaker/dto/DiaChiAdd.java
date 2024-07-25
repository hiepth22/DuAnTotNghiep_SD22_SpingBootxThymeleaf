package com.poly.sneaker.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.poly.sneaker.entity.KhachHang;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class DiaChiAdd {

    private Long id;


    private Long idKH;


    private String thanhPho;


    private String quanHuyen;


    private String phuongXa;


    private String soNha;


    private String moTaChiTiet;


    private String ten;


    private int trangThai;


    private LocalDateTime ngayTao;


    private LocalDateTime ngayCapNhat;
}
