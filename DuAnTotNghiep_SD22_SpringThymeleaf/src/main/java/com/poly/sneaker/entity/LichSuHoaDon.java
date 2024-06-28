package com.poly.sneaker.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "lich_su_hoa_don")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LichSuHoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "idHoaDon")
    private Long idHoaDon;

    @Column(name = "ghiChu", length = 200)
    private String ghiChu;

    @Column(name = "nguoiTao", length = 50)
    private String nguoiTao;

    @Column(name = "nguoiCapNhat", length = 50)
    private String nguoiCapNhat;

    @Column(name = "ngayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime ngayTao;

    @Column(name = "ngayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;

    @Column(name = "hanhDong")
    private Integer hanhDong;

    @Column(name = "trangThai")
    private Integer trangThai;
}
