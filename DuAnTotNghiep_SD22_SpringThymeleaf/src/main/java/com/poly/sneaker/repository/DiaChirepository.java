package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DiaChi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiaChirepository extends JpaRepository<DiaChi, Long> {


    @Query(value = "SELECT * FROM dia_chi WHERE idKhachHang = :idKhachHang ", nativeQuery = true)
    List<DiaChi> findByIdKH(@Param("idKhachHang") Long idKhachHang);

    @Query(value = "UPDATE dia_chi SET trangThai = 0 WHERE idKhachHang = :idKhachHang; " , nativeQuery = true)
    DiaChi setDiaChi(@Param("idKhachHang") Long idKhachHang);

    @Query(value = "UPDATE dia_chi SET trangThai = 1 WHERE id = :id", nativeQuery = true)
    DiaChi setDiaChi2(@Param("id")Long id);

    @Query(value = "select count (*) from dia_chi where idKhachHang= :idKH", nativeQuery = true)
    Integer checkTrangThai(@Param("idKH") Long idKhachHang);
}
