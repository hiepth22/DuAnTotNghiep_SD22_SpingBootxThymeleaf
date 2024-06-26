package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {

    @Query(value = "select * from hoa_don where trangThai = :trangThai", nativeQuery = true)
    List<HoaDon> findAllbyTrangThai(int trangThai);


    @Query(value = "SELECT * FROM hoa_don WHERE ma LIKE %:ma% OR ngayTao BETWEEN :startDate AND :endDate", nativeQuery = true)
    List<HoaDon> findByMaAndNgayTaoBetween(@Param("ma") String ma, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query(value = "SELECT * FROM hoa_don WHERE (ma LIKE %:ma% OR ngayTao BETWEEN :startDate AND :endDate) AND trangThai = :trangThai", nativeQuery = true)
    List<HoaDon> findByMaAndNgayTaoBetweenAndTrangThai(@Param("ma") String ma, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("trangThai") int trangThai);

    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon", nativeQuery = true)
    List<HoaDonChiTiet> findByIdHD(@Param("id") Long id);


}
