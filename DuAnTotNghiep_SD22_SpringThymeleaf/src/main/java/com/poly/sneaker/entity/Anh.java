package com.poly.sneaker.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "anh")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Anh {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ten")
    private String ten;

    private String url;

    private String nguoiTao;

    private String nguoiCapNhat;

    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;

    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;

    private Integer trangThai;

    @ManyToOne
    @JoinColumn(name = "idSanPhamChiTiet", referencedColumnName = "id")
    private SanPhamChiTiet sanPhamChiTiet;
}
