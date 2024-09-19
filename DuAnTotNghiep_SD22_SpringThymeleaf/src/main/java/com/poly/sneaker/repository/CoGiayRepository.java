package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoGiayRepository extends JpaRepository<CoGiay, Long>, JpaSpecificationExecutor<CoGiay> {

    @Query(value = "SELECT * FROM co_giay ORDER BY id DESC", nativeQuery = true)
    List<CoGiay> findAll();

    List<CoGiay> findByTen(String ten);

    @Query(value = "SELECT * FROM co_giay WHERE trangThai = 1", nativeQuery = true)
    List<CoGiay> getCoGiay();

    @Query("SELECT cg FROM CoGiay cg " +
            "WHERE cg.ten LIKE %:keyword% " +
            "ORDER BY cg.ngayTao DESC")
    List<CoGiay> searchCoGiay(String keyword);
}
