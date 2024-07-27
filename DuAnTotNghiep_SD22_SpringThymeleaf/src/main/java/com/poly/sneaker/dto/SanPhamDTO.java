package com.poly.sneaker.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.poly.sneaker.entity.ThuongHieu;
import jakarta.persistence.Column;
import jakarta.persistence.ColumnResult;
import jakarta.persistence.ConstructorResult;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedNativeQuery;
import jakarta.persistence.SqlResultSetMapping;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "san_pham")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@NamedNativeQuery(
        name = "find_sanpham",
        query = "SELECT " +
                "    s.id, " +
                "    s.ten, " +
                "    s.moTa, " +
                "    s.nguoiTao, " +
                "    s.nguoiCapNhat, " +
                "    s.ngayTao, " +
                "    s.ngayCapNhat, " +
                "    s.trangThai, " +
                "    s.idThuongHieu, " +
                "    th.ten AS tenThuongHieu, " +
                "    COUNT(*) OVER () AS totalRow, " +
                "    ROW_NUMBER() OVER (ORDER BY s.id DESC) AS rowNumber " +
                "FROM " +
                "    san_pham s " +
                "LEFT JOIN " +
                "    thuong_hieu th ON s.idThuongHieu = th.id " +
                "WHERE " +
                "    (:keyword IS NULL OR " +
                "    s.ten COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :keyword + '%' " +
                "    OR s.soLuong COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :keyword + '%' " +
                "    OR s.moTa COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :keyword + '%' " +
                "    OR s.nguoiTao COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :keyword + '%' " +
                "    OR s.nguoiCapNhat COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :keyword + '%' " +
                "    OR th.tenThuongHieu COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%' + :keyword + '%') " +
                "    AND (:trangthai IS NULL OR s.trang_thai = :trangthai) " +
                "ORDER BY " +
                "    s.id DESC " +
                "OFFSET " +
                "    :page_index ROWS FETCH NEXT :page_size ROWS ONLY",
        resultSetMapping = "find_sanpham_mapping"
)
@SqlResultSetMapping(
        name = "find_sanpham_mapping",
        classes = @ConstructorResult(
                targetClass = SanPhamDTO.class,
                columns = {
                        @ColumnResult(name = "id", type = Long.class),
                        @ColumnResult(name = "ten", type = String.class),
                        @ColumnResult(name = "soLuong", type = String.class),
                        @ColumnResult(name = "moTa", type = String.class),
                        @ColumnResult(name = "nguoiTao", type = String.class),
                        @ColumnResult(name = "nguoiCapNhat", type = String.class),
                        @ColumnResult(name = "ngayTao", type = LocalDateTime.class),
                        @ColumnResult(name = "ngayCapNhat", type = LocalDateTime.class),
                        @ColumnResult(name = "trangThai", type = Integer.class),
                        @ColumnResult(name = "idThuongHieu", type = Long.class),
                        @ColumnResult(name = "tenThuongHieu", type = String.class),
                        @ColumnResult(name = "totalRow", type = Integer.class),
                        @ColumnResult(name = "rowNumber", type = Integer.class)
                }
        )
)
public class SanPhamDTO {

    @Id
    private Long id;

    private String ten;

    private String moTa;

    private Integer soLuong;

    private String nguoiTao;

    private String nguoiCapNhat;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ngayTao;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ngayCapNhat;

    private Integer trangThai;

    @ManyToOne
    @JoinColumn(name = "id_thuong_hieu", referencedColumnName = "id")
    private ThuongHieu thuongHieu;

    private Integer totalRow;
}

