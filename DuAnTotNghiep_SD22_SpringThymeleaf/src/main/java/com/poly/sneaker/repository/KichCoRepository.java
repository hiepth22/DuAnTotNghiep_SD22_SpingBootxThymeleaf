package com.poly.sneaker.repository;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.KichCo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KichCoRepository extends JpaRepository<KichCo, Long>, JpaSpecificationExecutor<KichCo> {

    @Query(value = "SELECT * FROM kich_co ORDER BY id DESC", nativeQuery = true)
    List<KichCo> findAll();

    List<KichCo> findByTen(String ten);

    @Query(value = "SELECT * FROM kich_co WHERE trangThai = 1", nativeQuery = true)
    List<KichCo> getKichCo();
}
