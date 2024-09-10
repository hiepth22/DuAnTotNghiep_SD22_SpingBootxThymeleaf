package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.PhuongThucThanhToan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PhuongThucThanhToanRepository extends JpaRepository<PhuongThucThanhToan, Long> {


    @Query(value = "SELECT * FROM phuong_thuc_thanh_toan WHERE idHoaDon = :idHoaDon", nativeQuery = true)
    Optional<PhuongThucThanhToan> findByIdHoaDon(@Param("idHoaDon") Long idHoaDon);

    @Query(value = "SELECT * FROM phuong_thuc_thanh_toan WHERE idHoaDon = :idHoaDon", nativeQuery = true)
    List<PhuongThucThanhToan> findByIdHoaDon1(@Param("idHoaDon") Long idHoaDon);

}
