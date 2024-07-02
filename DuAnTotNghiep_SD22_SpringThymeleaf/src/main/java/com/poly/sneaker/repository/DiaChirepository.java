package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DiaChi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiaChirepository extends JpaRepository<DiaChi, Long> {


    @Query(value = "SELECT * FROM dia_chi WHERE idKhachHang = :idKhachHang ", nativeQuery = true)
    List<DiaChi> findByIdKH(@Param("idKhachHang") Long idKhachHang);

}
