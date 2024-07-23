package com.poly.sneaker.repository;

import com.poly.sneaker.dto.KhachHangDTO;
import com.poly.sneaker.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

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
    @Query(name ="find_kh",nativeQuery = true)
    List<KhachHangDTO> findByKH(@Param("KEYWORD") String keyword,
                                @Param("TRANGTHAI") Optional<Integer> trangThai,
                                @Param("startDate") Date startDate,
                                @Param("endDate") Date endDate,
                                @Param("PAGE_INDEX") Integer page_index,
                                @Param("PAGE_SIZE") Integer page_size);

    List<KhachHang> findByTrangThai(int tt);
<<<<<<< HEAD
    Optional<KhachHang> findByEmail(String email);
    List<KhachHang> findByEmail(String mail);
=======

    Optional<KhachHang> findByEmail(String email);


>>>>>>> 7dc3cb5c85e0d9433ad4c8699abed5acff619e16
}
