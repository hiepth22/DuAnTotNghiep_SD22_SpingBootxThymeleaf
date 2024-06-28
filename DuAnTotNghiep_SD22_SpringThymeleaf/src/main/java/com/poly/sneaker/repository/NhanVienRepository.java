package com.poly.sneaker.repository;

import com.poly.sneaker.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public interface NhanVienRepository extends JpaRepository<NhanVien,Long> {
    @Query(value = "SELECT * FROM nhan_vien n WHERE " +
            "n.ten COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.ma COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.sdt COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.diachi COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.cccd COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.email COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword%", nativeQuery = true)
    List<NhanVien> findByTen(@Param("keyword") String keyword);

    List<NhanVien> findByTrangThai(int tt);
    Page<NhanVien> findByTrangThai(int trangThai, Pageable pageable);
}
