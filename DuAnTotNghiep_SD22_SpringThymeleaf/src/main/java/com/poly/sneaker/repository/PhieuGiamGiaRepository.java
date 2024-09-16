package com.poly.sneaker.repository;


import com.poly.sneaker.dto.KhachHangDTO;
import com.poly.sneaker.dto.NhanVienPhanTrang;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.entity.PhieuGiamGia;
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
public interface PhieuGiamGiaRepository extends JpaRepository<PhieuGiamGia, Long> {
    //    @Query("SELECT new com.poly.sneaker.dto.PhieuGiamGiaDTO(p.id, p.ma, p.ten, p.soLuong, p.hinhThucGiam, p.giaTriGiam, p.donToiThieu, p.giamToiDa, p.ngayBatDau, p.ngayKetThuc, p.trangThai, COUNT(p) OVER() AS totalRow) " +
//            "FROM PhieuGiamGia p " +
//            "WHERE (:keyword IS NULL OR p.ten LIKE %:keyword% OR p.ma LIKE %:keyword%) " +
//            "AND (:tt IS NULL OR p.trangThai = :tt) " +
//            "AND (:hinhThucGiam IS NULL OR p.hinhThucGiam = :hinhThucGiam) " +
//            "AND (:startDate IS NULL OR :endDate IS NULL OR p.ngayBatDau BETWEEN :startDate AND :endDate) " +
//            "ORDER BY p.id DESC")
//    List<PhieuGiamGiaDTO> findBypgg(@Param("keyword") String keyword,
//                                    @Param("tt") Optional<Integer> tt,
//                                    @Param("hinhThucGiam") Optional<Integer> hinhThucGiam,
//                                    @Param("startDate") Date startDate,
//                                    @Param("endDate") Date endDate,
//                                    @Param("pageIndex") Integer pageIndex,
//                                    @Param("pageSize") Integer pageSize);
    List<PhieuGiamGia> findByTrangThai(int tt);
    @Query(value = "select * from phieu_giam_gia ORDER BY id DESC", nativeQuery = true)
    List<PhieuGiamGia> findAllDesc();

    @Query(value = "SELECT  * FROM phieu_giam_gia WHERE GETDATE() BETWEEN ngayBatdau AND ngayKetThuc;", nativeQuery = true)
    List<PhieuGiamGia> getPGGConHanSD();



//    @Query(value = "SELECT * FROM phieu_giam_gia WHERE ( GETDATE() BETWEEN ngayBatdau AND ngayKetThuc) AND (donToiThieu BETWEEN 0 AND :maxValue) AND trangthai = 1 ORDER BY giamToiDa DESC", nativeQuery = true)
//    List<PhieuGiamGia> getPhieuGiamGiaPhuHop(@Param("maxValue") Long maxValue);

    @Query(value = "SELECT * FROM phieu_giam_gia WHERE GETDATE() BETWEEN ngayBatdau AND ngayKetThuc AND donToiThieu <= :maxValue ORDER BY giamToiDa DESC", nativeQuery = true)
    List<PhieuGiamGia> getPhieuGiamGiaPhuHop(@Param("maxValue") Long maxValue);



}

