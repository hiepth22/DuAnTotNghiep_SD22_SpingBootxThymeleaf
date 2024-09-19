package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac, Long>, JpaSpecificationExecutor<MauSac> {

    @Query(value = "SELECT * FROM mau_sac ORDER BY id DESC", nativeQuery = true)
    List<MauSac> findAll();

    List<MauSac> findByTen(String ten);

    @Query(value = "SELECT * FROM mau_sac WHERE trangThai = 1", nativeQuery = true)
    List<MauSac> getMauSac();

    @Query("SELECT ms FROM MauSac ms " +
            "WHERE ms.ten LIKE %:keyword% " +
            "OR ms.moTa LIKE %:keyword% " +
            "ORDER BY ms.ngayTao DESC")
    List<MauSac> searchMauSac(String keyword);

}
