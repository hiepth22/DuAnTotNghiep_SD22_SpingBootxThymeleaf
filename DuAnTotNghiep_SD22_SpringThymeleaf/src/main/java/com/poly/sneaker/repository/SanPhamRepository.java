package com.poly.sneaker.repository;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Long>, JpaSpecificationExecutor<SanPham> {

    List<SanPham> findByTen(String ten);

    @Query(value = "SELECT * FROM san_pham ORDER BY id DESC", nativeQuery = true)
    List<SanPham> findAll();

    @Query(value = "SELECT s FROM SanPham s " +
            "LEFT JOIN s.thuongHieu t " +
            "WHERE s.ten LIKE %?1% " +
            "OR s.moTa LIKE %?1% " +
            "OR t.ten LIKE %?1% AND ORDER BY DESC", nativeQuery = true)
    List<SanPham> searchSP(String keyword);

    boolean existsByTenAndThuongHieu(String ten, ThuongHieu thuongHieu);

    @Query(value = "SELECT * FROM san_pham WHERE trangThai = 1", nativeQuery = true)
    List<SanPham> getSanPham();
}
