package com.poly.sneaker.repository;

import com.poly.sneaker.entity.NhaSanXuat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhaSanXuatRepository extends JpaRepository<NhaSanXuat, Long> {

    List<NhaSanXuat> findByTen(String ten);

    @Query(value = "SELECT * FROM nha_san_xuat WHERE trangThai = 1", nativeQuery = true)
    List<NhaSanXuat> getNSX();
}
