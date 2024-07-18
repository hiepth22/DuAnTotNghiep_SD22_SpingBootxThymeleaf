package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {

    @Query(value = "select * from hoa_don where trangThai = :trangThai", nativeQuery = true)
    Page<HoaDon> findAllByTrangThai(@Param("trangThai") int trangThai, Pageable pageable);

    @Query(value = "SELECT * FROM hoa_don WHERE (ma LIKE %:keyword% OR ngayTao BETWEEN :startDate AND :endDate) AND trangThai = :trangThai", nativeQuery = true)
    Page<HoaDon> findByMaAndNgayTaoBetweenAndTrangThai(@Param("keyword") String keyword, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("trangThai") int trangThai, Pageable pageable);

    @Query(value = "SELECT * FROM hoa_don WHERE ma LIKE %:keyword% OR ngayTao BETWEEN :startDate AND :endDate", nativeQuery = true)
    Page<HoaDon> findByMaAndNgayTaoBetween(@Param("keyword") String keyword, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);

    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon", nativeQuery = true)
    List<HoaDonChiTiet> findByIdHD(@Param("id") Long id);

    @Query(value = "select * from hoa_don where trangThai = 8", nativeQuery = true)
    List<HoaDon> findHoaDonCho();


}
