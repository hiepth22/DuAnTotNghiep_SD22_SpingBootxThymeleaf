package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ChatLieuRepository extends JpaRepository<ChatLieu, Long>, JpaSpecificationExecutor<ChatLieu> {

    @Query(value = "SELECT * FROM chat_lieu ORDER BY id DESC", nativeQuery = true)
    List<ChatLieu> getAll();

    List<ChatLieu> findByTen(String ten);


    @Query(value = "SELECT * FROM chat_lieu WHERE trangThai = 1", nativeQuery = true)
    List<ChatLieu> getChatLieu();


    @Query("SELECT cl FROM ChatLieu cl " +
            "WHERE cl.ten LIKE %:keyword% " +
            "ORDER BY cl.ngayTao DESC")
    List<ChatLieu> searchChatLieu(String keyword);

}
