package com.poly.sneaker.repository;

import com.poly.sneaker.entity.Anh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnhRepository extends JpaRepository<Anh, Long>, JpaSpecificationExecutor<Anh> {

    List<Anh> findByTen(String ten);
}
