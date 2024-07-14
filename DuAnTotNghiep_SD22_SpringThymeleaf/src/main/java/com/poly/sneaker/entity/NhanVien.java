package com.poly.sneaker.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;
import java.time.LocalDateTime;
@Entity
@Table(name = "nhan_vien")
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ten", length = 30)
    private String ten;

    @Column(name = "ma", length = 30)
    private String ma;

    @Column(name = "sdt", length = 30)
    private String sdt;

    @Column(name = "ngaysinh")
    private Date ngaySinh;

    @Column(name = "email", length = 50)
    private String email;

    @Column(name = "gioitinh")
    private Boolean gioiTinh;

    @Column(name = "diachi", length = 100)
    private String diachi;

    @Column(name = "cccd", length = 30)
    private String cccd;

    @Column(name = "anh", length = 100)
    private String anh;

    @Column(name = "matkhau", length = 30)
    private String matKhau;

    @Column(name = "vaiTro")
    private Integer vaiTro;

    @Column(name = "trangthai")
    private Integer trangThai;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Ho_Chi_Minh")
    @Column(name = "ngayCapNhat")
    private LocalDateTime ngayCapNhat;
}
