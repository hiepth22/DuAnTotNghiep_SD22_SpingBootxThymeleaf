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
    @Query(value = "select * from nhan_vien n where " +
            "n.ten collate SQL_Latin1_General_CP1_CI_AI like %:keyword% " +
            "or n.ma collate SQL_Latin1_General_CP1_CI_AI like %:keyword% " +
            "or n.sdt collate SQL_Latin1_General_CP1_CI_AI like %:keyword% " +
            "or n.diachi collate SQL_Latin1_General_CP1_CI_AI like %:keyword% " +
            "or n.cccd collate SQL_Latin1_General_CP1_CI_AI like %:keyword% " +
            "or n.email collate SQL_Latin1_General_CP1_CI_AI like %:keyword%", nativeQuery = true)
    Page<NhanVien> findByTen(@Param("keyword") String ten, Pageable pageable);

    List<NhanVien> findByTrangThai(int tt);
    Page<NhanVien> findByTrangThai(int trangThai, Pageable pageable);
}
