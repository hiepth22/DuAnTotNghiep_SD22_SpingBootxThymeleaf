package com.poly.sneaker.repository;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.LichSuHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LichSuHoaDonRepository extends JpaRepository<LichSuHoaDon, Long> {


    @Query(value = "select * from lich_su_hoa_don where idHoaDon = :idHoaDon and hanhDong !=10", nativeQuery = true)
    List<LichSuHoaDon> getByIdHoaDon(@Param("idHoaDon") Long idHoaDon);

    @Query(value = "select * from lich_su_hoa_don where idHoaDon = :idHoaDon", nativeQuery = true)
    List<LichSuHoaDon> getByIdHoaDon2(@Param("idHoaDon") Long idHoaDon);


}
