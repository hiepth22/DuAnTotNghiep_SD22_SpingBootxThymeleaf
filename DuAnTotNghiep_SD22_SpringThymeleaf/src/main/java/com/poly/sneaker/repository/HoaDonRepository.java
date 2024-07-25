package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {

    @Query(value = "select * from hoa_don where trangThai = :trangThai and trangThai != 8", nativeQuery = true)
    Page<HoaDon> findAllByTrangThai(@Param("trangThai") int trangThai, Pageable pageable);

//    @Query(value = "SELECT * FROM hoa_don WHERE (ma LIKE %:keyword% OR ngayTao BETWEEN :startDate AND :endDate) AND trangThai = :trangThai", nativeQuery = true)
//    Page<HoaDon> findByMaAndNgayTaoBetweenAndTrangThai(@Param("keyword") String keyword, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("trangThai") int trangThai, Pageable pageable);

    @Query(value = "SELECT h.* FROM hoa_don h " +
            "left nhan_vien nv ON h.idNhanVien = nv.id " +
            "WHERE ((h.ma LIKE %:keyword% OR h.sdtNguoiNhan LIKE %:keyword% OR nv.ma LIKE %:keyword%)  " +
            "or h.ngayTao BETWEEN :startDate AND :endDate) AND h.trangThai = :trangThai and h.trangThai != 8", nativeQuery = true)
    Page<HoaDon> findByKeywordAndNgayTaoBetweenAndTrangThai(@Param("keyword") String keyword, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("trangThai") int trangThai, Pageable pageable);


//    @Query(value = "SELECT * FROM hoa_don WHERE (ma LIKE %:keyword% OR ngayTao BETWEEN :startDate AND :endDate )AND trangThai != 8", nativeQuery = true)
//    Page<HoaDon> findByMaAndNgayTaoBetween(@Param("keyword") String keyword, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);

    @Query(value = "SELECT h.* FROM hoa_don h " +
            "left nhan_vien nv ON h.idNhanVien = nv.id " +
            "WHERE ((h.ma LIKE %:keyword% OR h.sdtNguoiNhan LIKE %:keyword% OR nv.ma LIKE %:keyword% ) " +
            "or h.ngayTao BETWEEN :startDate AND :endDate) and trangThai != 8", nativeQuery = true)
    Page<HoaDon> findByMaAndNgayTaoBetweenAndKeyword(@Param("keyword") String keyword, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);


    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon and trangThai != 8", nativeQuery = true)
    List<HoaDonChiTiet> findByIdHD(@Param("id") Long id);

    @Query(value = "select * from hoa_don where trangThai = 8", nativeQuery = true)
    List<HoaDon> findHoaDonCho();


    List<HoaDon> findAllByNgayTaoBetweenAndTrangThaiAndMaContainingIgnoreCaseOrSdtNguoiNhanContainingIgnoreCase(
            LocalDateTime startDate, LocalDateTime endDate, int trangThai, String ma, String sdt);
}
