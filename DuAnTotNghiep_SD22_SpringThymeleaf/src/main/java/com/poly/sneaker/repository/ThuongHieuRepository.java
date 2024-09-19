package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, Long>, JpaSpecificationExecutor<ThuongHieu> {

    @Query(value = "SELECT * FROM thuong_hieu ORDER BY id DESC", nativeQuery = true)
    List<ThuongHieu> findAll();

    List<ThuongHieu> findByTen(String ten);

    @Query(value = "SELECT * FROM thuong_hieu WHERE trangThai = 1", nativeQuery = true)
    List<ThuongHieu> getThuongHieu();

    @Query("SELECT th FROM ThuongHieu th " +
            "WHERE th.ten LIKE %:keyword% " +
            "ORDER BY th.ngayTao DESC")
    List<ThuongHieu> searchThuongHieu(String keyword);
}
