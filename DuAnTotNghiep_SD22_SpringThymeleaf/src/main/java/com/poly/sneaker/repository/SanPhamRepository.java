package com.poly.sneaker.repository;

import com.poly.sneaker.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Long>, JpaSpecificationExecutor<SanPham> {

    List<SanPham> findByTen(String ten);

    @Query("SELECT s FROM SanPham s WHERE s.ten like %?1%")
    List<SanPham> searchSP(String keyword);
}
