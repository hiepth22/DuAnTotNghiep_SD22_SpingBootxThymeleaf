package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.LichSuHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LichSuHoaDonRepository extends JpaRepository<LichSuHoaDon, Long> {
}
