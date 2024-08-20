package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.GioHangChiTiet;
import com.poly.sneaker.entity.SanPhamChiTiet;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, Long> {

    @Query(value = "SELECT * FROM gio_hang_chi_tiet WHERE idGioHang = :idGioHang", nativeQuery = true)
    List<GioHangChiTiet> findByIdGH(@Param("idGioHang") Long idGioHang);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM gio_hang_chi_tiet WHERE idGioHang = :idGioHang", nativeQuery = true)
    void deleteByIdGioHang(@Param("idGioHang") Long idGioHang);

    @Query("SELECT ghct FROM GioHangChiTiet ghct " +
            "JOIN ghct.sanPhamChiTiet spct " +
            "WHERE spct.id = :idSanPhamChiTiet ")
    Optional<GioHangChiTiet> findBySanPhamChiTietId(@Param("idSanPhamChiTiet") Long idSanPhamChiTiet);



    @Query("SELECT ghct.sanPhamChiTiet FROM GioHangChiTiet ghct " +
            "JOIN ghct.sanPhamChiTiet spct " +
            "WHERE spct.id = :idSanPham AND ghct.gioHang.id = :idGioHang")
    List<SanPhamChiTiet> findDetailsBySanPhamIdAndGioHangId(
            @Param("idSanPham") Long idSanPham,
            @Param("idGioHang") Long idGioHang
    );
}
