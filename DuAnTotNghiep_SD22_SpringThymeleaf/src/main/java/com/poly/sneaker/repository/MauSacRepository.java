package com.poly.sneaker.repository;

import com.poly.sneaker.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac, Long>, JpaSpecificationExecutor<MauSac> {

    List<MauSac> findByTen(String ten);

    @Query(value = "SELECT * FROM mau_sac WHERE trangThai = 1", nativeQuery = true)
    List<MauSac> getMauSac();
}
