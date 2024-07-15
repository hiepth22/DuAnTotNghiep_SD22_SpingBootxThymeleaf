package com.poly.sneaker.dto;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Date;
import java.time.LocalDateTime;

@Entity
@Data
@NamedNativeQuery(
        name = "find_kh",
        query = "SELECT n.[id], " +
                "n.[ten], " +
                "n.[ma], " +
                "n.[sdt], " +
                "n.[ngaySinh], " +
                "n.[email], " +
                "n.[gioiTinh], " +
                "n.[cccd], " +
                "n.[anh], " +
                "n.[matKhau], " +
                "n.[trangThai], " +
                "n.[ngayTao], " +
                "n.[ngayCapNhat], " +
                "COUNT(0) OVER() AS totalRow " +
                "FROM khach_hang N " +
                "WHERE (:KEYWORD IS NULL " +
                "OR N.TEN COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :KEYWORD + '%' " +
                "OR N.MA COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :KEYWORD + '%' " +
                "OR N.SDT COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :KEYWORD + '%' " +
                "OR N.CCCD COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :KEYWORD + '%' " +
                "OR N.EMAIL COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :KEYWORD + '%') " +
                "AND (:TRANGTHAI IS NULL OR N.TRANGTHAI = :TRANGTHAI) " +
                "AND ((:startDate IS NULL AND :endDate IS NULL) OR (N.ngaySinh BETWEEN :startDate AND :endDate)) " +
                "ORDER BY n.id DESC " +
                "OFFSET :PAGE_INDEX ROWS FETCH NEXT :PAGE_SIZE ROWS ONLY",
        resultSetMapping = "find_KhachHang_dtos"
)
@SqlResultSetMapping(
        name = "find_KhachHang_dtos",
        classes = @ConstructorResult(
                targetClass = KhachHangDTO.class,
                columns = {
                        @ColumnResult(name = "id", type = Long.class),
                        @ColumnResult(name = "ten", type = String.class),
                        @ColumnResult(name = "ma", type = String.class),
                        @ColumnResult(name = "sdt", type = String.class),
                        @ColumnResult(name = "ngaySinh", type = Date.class),
                        @ColumnResult(name = "email", type = String.class),
                        @ColumnResult(name = "gioiTinh", type = Boolean.class),
                        @ColumnResult(name = "cccd", type = String.class),
                        @ColumnResult(name = "anh", type = String.class),
                        @ColumnResult(name = "matKhau", type = String.class),
                        @ColumnResult(name = "trangThai", type = Integer.class),
                        @ColumnResult(name = "ngayTao", type = LocalDateTime.class),
                        @ColumnResult(name = "ngayCapNhat", type = LocalDateTime.class),
                        @ColumnResult(name = "totalRow", type = Integer.class)
                }
        )
)
public class KhachHangDTO {
    @Id
    private Long id;

    private String ten;

    private String ma;

    private String sdt;

    private Date ngaySinh;

    private String email;

    private Boolean gioiTinh;

    private String cccd;

    private String anh;

    private String matKhau;

    private Integer trangThai;

    private LocalDateTime ngayTao;

    private LocalDateTime ngayCapNhat;

    private Integer totalRow;
}
