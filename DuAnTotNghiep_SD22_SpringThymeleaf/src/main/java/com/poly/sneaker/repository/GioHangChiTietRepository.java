package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.GioHangChiTiet;
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


}
