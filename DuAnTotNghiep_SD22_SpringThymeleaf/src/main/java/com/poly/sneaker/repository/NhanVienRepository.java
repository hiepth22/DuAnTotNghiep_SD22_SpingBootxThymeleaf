package com.poly.sneaker.repository;

import com.poly.sneaker.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien,Long> {
    @Query(value = "SELECT * FROM nhan_vien n WHERE " +
            "n.ten COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.ma COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.sdt COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.diachi COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.cccd COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.email COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword%", nativeQuery = true)
    List<NhanVien> findByTen(@Param("keyword") String keyword);
//    @Query(value = "SELECT * FROM nhan_vien n WHERE " +
//            "(n.ten COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
//            "OR n.ma COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
//            "OR n.sdt COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
//            "OR n.diachi COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
//            "OR n.cccd COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
//            "OR n.email COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword%) " +
//            "AND (:trangThai IS NULL OR n.trang_thai = :trangThai) " +
//            "AND (:gioiTinh IS NULL OR n.ngaySinh = :gioiTinh) " +
//            "AND (:ngaySinh IS NULL OR n.ngaySinh >= :ngaySinh) " +
//            "AND (:ngaySinh IS NULL OR n.ngaySinh <= :ngaySinh) " +
//            "ORDER BY n.id " + // Sắp xếp theo id
//            "OFFSET :offset ROWS FETCH NEXT :limit ROWS ONLY", // Phân trang
//            nativeQuery = true)
//    List<NhanVien> findBynv(@Param("keyword") String keyword,
//                             @Param("trangThai") Integer trangThai,
//                             @Param("gioiTinh") Integer gioiTinh,
//                             @Param("ngaySinhFrom") Date ngaySinhFrom,
//                             @Param("ngaySinhTo") Date ngaySinhTo,
//                             @Param("offset") int offset,
//                             @Param("limit") int limit);
    List<NhanVien> findByTrangThai(int tt);
    Page<NhanVien> findByTrangThai(int trangThai, Pageable pageable);
}
