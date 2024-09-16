package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DiaChi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface DiaChirepository extends JpaRepository<DiaChi, Long> {


    @Query(value = "SELECT * FROM dia_chi WHERE idKhachHang = :idKhachHang ", nativeQuery = true)
    List<DiaChi> findByIdKH(@Param("idKhachHang") Long idKhachHang);

    @Query(value = "SELECT * FROM dia_chi WHERE idKhachHang = :idKhachHang and trangThai = 1", nativeQuery = true)
    DiaChi getDiaChiMacDinh(@Param("idKhachHang") Long idKhachHang);

    @Query(value = "UPDATE dia_chi SET trangThai = 0 WHERE trangThai = 1 and idKhachHang = :idKhachHang", nativeQuery = true)
    int setDiaChi(@Param("idKhachHang") Long idKhachHang);

    @Query(value = "UPDATE dia_chi SET trangThai = 1 WHERE id = :id", nativeQuery = true)
    DiaChi setDiaChi2(@Param("id") Long id);

    @Query(value = "select count (*) from dia_chi where idKhachHang= :idKH", nativeQuery = true)
    Integer checkTrangThai(@Param("idKH") Long idKhachHang);

    @Query(value = "SELECT * FROM dia_chi WHERE idKhachHang = :idKhachHang ORDER BY trangThai desc ", nativeQuery = true)
    List<DiaChi> findKHDESCByIdKH(@Param("idKhachHang") Long idKhachHang);
    @Modifying
    @Transactional
    @Query("UPDATE DiaChi d SET d.trangThai = 0 WHERE d.idKH.id = :idKhachHang AND d.id <> :excludedDiaChiId")
    void updateAllOtherDiaChiToZero(@Param("idKhachHang") Long idKhachHang, @Param("excludedDiaChiId") Long excludedDiaChiId);
}
