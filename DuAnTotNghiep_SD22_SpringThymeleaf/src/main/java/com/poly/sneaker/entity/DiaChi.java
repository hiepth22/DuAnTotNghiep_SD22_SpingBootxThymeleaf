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
import java.util.Date;

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
    private Date phuongXa;

    @Column(name = "soNha", length = 50)
    private String soNha;

    @Column(name = "moTaChiTiet")
    private Boolean moTa;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayTao")
    private LocalDateTime ngaytao;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayCapNhat")
    private LocalDateTime ngaycapnhap;


}
