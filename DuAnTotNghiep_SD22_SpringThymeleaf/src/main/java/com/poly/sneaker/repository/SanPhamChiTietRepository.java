package com.poly.sneaker.repository;

import com.poly.sneaker.entity.SanPhamChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Long>, JpaSpecificationExecutor<SanPhamChiTiet> {

    List<SanPhamChiTiet> findByMa(String ma);

    @Query(value = "select * \n" +
            "from [san_pham_chi_tiet] where idSanPham = ?1", nativeQuery = true)
    List<SanPhamChiTiet> findBySanPham(Long id);

    @Query(value = "SELECT spct FROM SanPhamChiTiet spct WHERE spct.sanPham.id = :sanPhamId")
    Page<SanPhamChiTiet> findBySanPhamId(@Param("sanPhamId") Long sanPhamId, Pageable pageable);


    @Query(value = "select top 1 * from [san_pham_chi_tiet] order by id desc", nativeQuery = true)
    SanPhamChiTiet findIdLonNhat();
}
