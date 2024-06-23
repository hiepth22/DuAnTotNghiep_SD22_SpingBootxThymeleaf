package com.poly.sneaker.repository;

import com.poly.sneaker.entity.KichCo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KichCoRepository extends JpaRepository<KichCo, Long>, JpaSpecificationExecutor<KichCo> {

    List<KichCo> findByTen(String ten);
}
