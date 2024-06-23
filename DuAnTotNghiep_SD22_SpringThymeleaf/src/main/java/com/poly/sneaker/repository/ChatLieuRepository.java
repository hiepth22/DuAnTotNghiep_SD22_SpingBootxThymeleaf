package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatLieuRepository extends JpaRepository<ChatLieu, Long>, JpaSpecificationExecutor<ChatLieu> {

    List<ChatLieu> findByTen(String ten);
}
