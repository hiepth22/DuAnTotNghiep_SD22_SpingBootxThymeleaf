package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, Long>, JpaSpecificationExecutor<ThuongHieu> {

    List<ThuongHieu> findByTen(String ten);

    @Query(value = "SELECT * FROM thuong_hieu WHERE trangThai = 1", nativeQuery = true)
    List<ThuongHieu> getThuongHieu();
}
