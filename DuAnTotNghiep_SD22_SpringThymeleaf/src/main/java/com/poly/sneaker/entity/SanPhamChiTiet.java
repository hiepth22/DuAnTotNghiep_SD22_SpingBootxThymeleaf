package com.poly.sneaker.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

@Entity
@Table(name = "san_pham_chi_tiet")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String ma;

    private String ten;

    private String barcode;

    private Integer soLuong;

    private BigDecimal giaBan;

    private String moTa;

    private Integer trangThai;

    private Integer canNang;

    @ManyToOne
    @JoinColumn(name = "idKichCo", referencedColumnName = "id")
    private KichCo kichCo;

    @ManyToOne
    @JoinColumn(name = "idMauSac", referencedColumnName = "id")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "idDeGiay", referencedColumnName = "id")
    private DeGiay deGiay;

    @ManyToOne
    @JoinColumn(name = "idChatLieu", referencedColumnName = "id")
    private ChatLieu chatLieu;

    @ManyToOne
    @JoinColumn(name = "idSanPham", referencedColumnName = "id")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idCoGiay", referencedColumnName = "id")
    private CoGiay coGiay;

    @ManyToOne
    @JoinColumn(name = "idNhaSanXuat", referencedColumnName = "id")
    private NhaSanXuat nhaSanXuat;

    @ManyToOne
    @JoinColumn(name = "idAnh")
    private Anh anh;

    private Date ngaySanXuat;

    private String nguoiTao;

    private String nguoiCapNhat;

    private Date ngayTao;

    private Date ngayCapNhat;

    public String getFormattedGiaBan() {
        if (giaBan == null) {
            return "Chưa có giá";
        }
        NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        return formatter.format(giaBan) + " VNĐ";
    }

    public String getFormattedCanNang() {
        if (canNang == null) {
            return "Chưa có cân nặng";
        }
        NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        return formatter.format(canNang) + "g";
    }
}