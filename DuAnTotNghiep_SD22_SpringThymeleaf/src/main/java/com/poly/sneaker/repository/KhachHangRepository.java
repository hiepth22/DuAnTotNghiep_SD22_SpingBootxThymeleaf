package com.poly.sneaker.repository;

import com.poly.sneaker.dto.KhachHangDTO;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
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

    Optional<KhachHang> findByEmail(String email);

    Optional<KhachHang> findBySdt(String sdt);

    @Query(value = "SELECT * FROM khach_hang WHERE (:sdt IS NULL OR sdt LIKE %:sdt%)", nativeQuery = true)
    Page<KhachHang> getKhachHangNoID1(@Param("sdt") String sdt, Pageable pageable);


//    Optional<KhachHang> findByEmail(String email);

}
