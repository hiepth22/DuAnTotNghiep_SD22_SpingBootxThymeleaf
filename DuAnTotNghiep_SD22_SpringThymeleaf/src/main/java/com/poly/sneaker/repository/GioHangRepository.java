package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.GioHangChiTiet;
import com.poly.sneaker.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface GioHangRepository extends JpaRepository<GioHang, Long> {

    @Query(value = "SELECT * FROM gio_hang WHERE idTaiKhoan = :idTaiKhoan", nativeQuery = true)
    Optional<GioHang> findByIdTK(@Param("idTaiKhoan") Long idTaiKhoan);

    @Query(value = "SELECT id FROM gio_hang WHERE idTaiKhoan = :idTaiKhoan", nativeQuery = true)
    Long selectIDGH(@Param("idTaiKhoan") Long idTaiKhoan);



}
