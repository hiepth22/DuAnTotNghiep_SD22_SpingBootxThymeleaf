package com.poly.sneaker.repository;

import com.poly.sneaker.entity.CoGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoGiayRepository extends JpaRepository<CoGiay, Long>, JpaSpecificationExecutor<CoGiay> {

    List<CoGiay> findByTen(String ten);
}
