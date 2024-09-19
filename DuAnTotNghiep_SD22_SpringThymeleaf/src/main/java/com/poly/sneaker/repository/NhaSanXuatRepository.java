package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.NhaSanXuat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhaSanXuatRepository extends JpaRepository<NhaSanXuat, Long> {

    @Query(value = "SELECT * FROM nha_san_xuat ORDER BY id DESC", nativeQuery = true)
    List<NhaSanXuat> findAll();

    List<NhaSanXuat> findByTen(String ten);

    @Query(value = "SELECT * FROM nha_san_xuat WHERE trangThai = 1", nativeQuery = true)
    List<NhaSanXuat> getNSX();

    @Query("SELECT ns FROM NhaSanXuat ns " +
            "WHERE ns.ten LIKE %:keyword% " +
            "ORDER BY ns.ngayTao DESC")
    List<NhaSanXuat> searchNSX(String keyword);
}
