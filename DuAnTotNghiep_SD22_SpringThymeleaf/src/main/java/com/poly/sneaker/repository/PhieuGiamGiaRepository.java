package com.poly.sneaker.repository;


import com.poly.sneaker.entity.PhieuGiamGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface PhieuGiamGiaRepository extends JpaRepository<PhieuGiamGia, Long> {

    List<PhieuGiamGia> findByTrangThai(int tt);

    Page<PhieuGiamGia> findByTrangThai(int trangThai, Pageable pageable);

    List<PhieuGiamGia> findByTen(String keyword);




}

