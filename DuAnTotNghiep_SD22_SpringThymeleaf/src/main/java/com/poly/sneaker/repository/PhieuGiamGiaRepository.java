package com.poly.sneaker.repository;


import com.poly.sneaker.entity.PhieuGiamGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PhieuGiamGiaRepository extends JpaRepository<PhieuGiamGia, Long> {
    List<PhieuGiamGia> findByTen(String ten);
    List<PhieuGiamGia> findByTrangThai(int tt);
    Page<PhieuGiamGia> findByTrangThai(int trangThai, Pageable pageable);

}

