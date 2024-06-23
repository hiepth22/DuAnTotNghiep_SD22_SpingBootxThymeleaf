package com.poly.sneaker.repository;

import com.poly.sneaker.entity.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DanhMucRepository extends JpaRepository<DanhMuc, Long>, JpaSpecificationExecutor<DanhMuc> {

    List<DanhMuc> findByTen(String ten);
}
