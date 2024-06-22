package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DeGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeGiayRepository extends JpaRepository<DeGiay, Long>, JpaSpecificationExecutor<DeGiay> {

    List<DeGiay> findByTen(String ten);
}
