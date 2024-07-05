package com.poly.sneaker.repository;

import com.poly.sneaker.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang,Long> {
    @Query(value = "SELECT * FROM khach_hang n WHERE " +
            "n.ten COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.ma COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.sdt COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.cccd COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword% " +
            "OR n.email COLLATE SQL_Latin1_General_CP1_CI_AI LIKE %:keyword%", nativeQuery = true)
    List<KhachHang> findByTen(@Param("keyword") String keyword);
    Page<KhachHang> findAll(Pageable pageable);
    List<KhachHang> findByTrangThai(int tt);
    Page<KhachHang> findByTrangThai(int trangThai, Pageable pageable);
}
