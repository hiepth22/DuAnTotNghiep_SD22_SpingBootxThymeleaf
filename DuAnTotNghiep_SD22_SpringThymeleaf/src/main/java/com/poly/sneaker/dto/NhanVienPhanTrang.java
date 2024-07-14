package com.poly.sneaker.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.poly.sneaker.entity.NhanVien;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.time.LocalDateTime;
@Entity
@Data
@NamedNativeQuery(
        name = "find_nhanvien",
        query = "SELECT n.[id]\n" +
                "      ,n.[ten]\n" +
                "      ,n.[ma]\n" +
                "      ,n.[sdt]\n" +
                "      ,n.[ngaySinh]\n" +
                "      ,n.[email]\n" +
                "      ,n.[gioiTinh]\n" +
                "      ,n.[cccd]\n" +
                "      ,n.[anh]\n" +
                "      ,n.[matKhau]\n" +
                "      ,n. vaiTro\n" +
                "      ,n.[trangThai]\n" +
                "      ,n.[ngayTao]\n" +
                "      ,n.[ngayCapNhat]\n" +
                "      ,n.[diachi],\n" +
                " COUNT(0) OVER() AS totalRow FROM NHAN_VIEN N WHERE " +
                "(:KEYWORD IS NULL " +
                "OR N.TEN COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%'+ :KEYWORD+'%' " +
                "OR N.MA COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE  '%'+ :KEYWORD+'%'  " +
                "OR N.SDT COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE  '%'+ :KEYWORD+'%' " +
                "OR N.DIACHI COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%'+ :KEYWORD+'%' " +
                "OR N.CCCD COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE  '%'+ :KEYWORD+'%' " +
                "OR N.EMAIL COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE  '%'+ :KEYWORD+'%') " +
                "AND (:TRANGTHAI IS NULL OR N.TRANGTHAI = :TRANGTHAI) " +
                "AND (:VAITRO IS NULL OR N.VAITRO = :VAITRO) " +
                " AND ((:startDate IS NULL AND :endDate IS NULL) OR (N.ngaySinh BETWEEN :startDate AND :endDate)) "+
                "ORDER BY n.id " +"Desc "+
                "OFFSET :PAGE_INDEX ROWS FETCH NEXT :PAGE_SIZE ROWS ONLY",
        resultSetMapping = "find_NhanVien_dtos"
)
@SqlResultSetMapping(
        name = "find_NhanVien_dtos",
        classes = @ConstructorResult(
                targetClass = NhanVienPhanTrang.class,
                columns = {
                        @ColumnResult(name = "id", type = Long.class),
                        @ColumnResult(name = "ten", type = String.class),
                        @ColumnResult(name = "ma", type = String.class),
                        @ColumnResult(name = "sdt", type = String.class),
                        @ColumnResult(name = "ngaySinh", type = Date.class),
                        @ColumnResult(name = "email", type = String.class),
                        @ColumnResult(name = "gioiTinh", type = Boolean.class),
                        @ColumnResult(name = "diachi", type = String.class),
                        @ColumnResult(name = "cccd", type = String.class),
                        @ColumnResult(name = "anh", type = String.class),
                        @ColumnResult(name = "matKhau", type = String.class),
                        @ColumnResult(name = "vaiTro", type = Integer.class),
                        @ColumnResult(name = "trangThai", type = Integer.class),
                        @ColumnResult(name = "ngayTao", type = LocalDateTime.class),
                        @ColumnResult(name = "ngayCapNhat", type = LocalDateTime.class),
                        @ColumnResult(name = "totalRow", type = Integer.class)
                }
        )
)
public class NhanVienPhanTrang {
    @Id
    private Long id;

    private String ten;

    private String ma;

    private String sdt;

    private Date ngaySinh;

    private String email;

    private Boolean gioiTinh;

    private String diachi;

    private String cccd;

    private String anh;

    private String matKhau;

    private Integer vaiTro;

    private Integer trangThai;

    private LocalDateTime ngayTao;

    private LocalDateTime ngayCapNhat;

    private Integer totalRow;
}
