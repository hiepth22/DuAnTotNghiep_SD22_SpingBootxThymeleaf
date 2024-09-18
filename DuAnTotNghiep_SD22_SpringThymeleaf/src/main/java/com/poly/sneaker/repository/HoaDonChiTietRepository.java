package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Long> {

//    @Query(value = "SELECT hdct.id, a.ten, sp.ten, kc.ten AS tenKichCo, ms.ten AS tenMauSac, hdct.soLuong, hdct.gia, hdct.trangThai " +
//            "FROM dbo.hoa_don_chi_tiet hdct " +
//            "LEFT JOIN dbo.hoa_don hd ON hd.id = hdct.idHoaDon " +
//            "LEFT JOIN dbo.san_pham_chi_tiet spct ON hdct.idSanPhamChiTiet = spct.id " +
//            "LEFT JOIN dbo.anh a ON spct.idAnh = a.id " +
//            "LEFT JOIN dbo.kich_co kc ON spct.idKichCo = kc.id " +
//            "LEFT JOIN dbo.mau_sac ms ON spct.idMauSac = ms.id " +
//            "LEFT JOIN dbo.san_pham sp ON spct.idSanPham = sp.id " +
//            "WHERE hd.id = :idHoaDon", nativeQuery = true)
//    List<Object[]> findByHoaDonId(@Param("idHoaDon") Long idHoaDon);


//    @Query(value = "select count(idHoaDon) from hoa_don_chi_tiet where idSanPhamChiTiet = :idSanPhamChiTiet", nativeQuery = true)
//    Long findIDHDByIDSPCT(@Param("idSanPhamChiTiet") Long idSanPhamChiTiet);


    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon ORDER BY id desc", nativeQuery = true)
    List<HoaDonChiTiet> TimTongTien(@Param("idHoaDon") Long idHoaDon);


    @Query("SELECT hdct FROM HoaDonChiTiet hdct JOIN hdct.hoaDon hd WHERE hdct.hoaDon.id = :idHoaDon AND hd.trangThai = :trangThai ORDER BY hd.ngayTao desc")
    List<HoaDonChiTiet> findHoaDonChiTietByIdHoaDon(@Param("idHoaDon") Long idHoaDon, @Param("trangThai") int trangThai);


    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon", nativeQuery = true)
    List<HoaDonChiTiet> findByIdHD(@Param("idHoaDon") Long idHoaDon);

    @Query("SELECT hdct FROM HoaDonChiTiet hdct " +
            "INNER JOIN hdct.hoaDon hd " +
            "WHERE hd.ngayThanhToan BETWEEN :startDate AND :endDate " +
            "AND hd.trangThai = 6")
    List<HoaDonChiTiet> findHoaDonChiTietByDateRange(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate);

    @Query("SELECT hdc FROM HoaDonChiTiet hdc JOIN hdc.hoaDon hd WHERE hd.ma = :ma")
    List<HoaDonChiTiet> findByMa(@Param("ma") String ma);
}