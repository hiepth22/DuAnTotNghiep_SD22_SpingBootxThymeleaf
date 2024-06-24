package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {

    @Query(value = "select * from hoa_don where trangThai = :trangThai", nativeQuery = true)
    List<HoaDon> findAllbyTrangThai(int trangThai);
}
