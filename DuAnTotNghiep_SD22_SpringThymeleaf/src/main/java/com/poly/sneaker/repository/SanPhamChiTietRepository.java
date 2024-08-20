package com.poly.sneaker.repository;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.SanPhamChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Long>, JpaSpecificationExecutor<SanPhamChiTiet> {

    List<SanPhamChiTiet> findByMa(String ma);

    @Query(value = "SELECT *\n" +
            "FROM san_pham_chi_tiet\n" +
            "where soLuong<10\n" +
            "ORDER BY soLuong ASC;", nativeQuery = true)
    List<SanPhamChiTiet> getSanPhamSapHetHang();

    @Query(value = "select * \n" +
            "from [san_pham_chi_tiet] where idSanPham = ?1", nativeQuery = true)
    List<SanPhamChiTiet> findBySanPham(Long id);

    @Query(value = "select top 1 * from [san_pham_chi_tiet] order by id desc", nativeQuery = true)
    SanPhamChiTiet findIdLonNhat();

    @Query("SELECT COUNT(spct) FROM SanPhamChiTiet spct WHERE spct.sanPham.id = :sanPhamId")
    int countBySanPhamId(@Param("sanPhamId") Long sanPhamId);

    @Query("SELECT s.kichCo.ten FROM SanPhamChiTiet s JOIN s.sanPham sp WHERE sp.id = :idSanPham")
    List<String> findKichCoBySanPhamId(@Param("idSanPham") Long idSanPham);

    @Query("SELECT s.anh FROM SanPhamChiTiet s JOIN s.sanPham sp WHERE sp.id = :idSanPham")
    List<String> findanhBySanPhamId(@Param("idSanPham") Long idSanPham);

    @Query("SELECT s.kichCo.ten FROM SanPhamChiTiet s WHERE s.sanPham.id = :idSanPham "
            + "AND (:anh IS NULL OR s.anh LIKE %:anh%)")
    List<String> findKichCoBySanPhamIdAndImageName(
            @Param("idSanPham") Long idSanPham,
            @Param("anh") String anh
    );

    @Query("SELECT s.giaBan FROM SanPhamChiTiet s JOIN s.kichCo sp WHERE s.sanPham.id = :idSanPham AND sp.ten = :ten AND s.anh LIKE :anh")
    List<Double> findGiaBan(@Param("idSanPham") Long idSanPham, @Param("ten") String ten, @Param("anh") String anh);

    @Query("SELECT s.soLuong FROM SanPhamChiTiet s " +
            "JOIN s.kichCo sp " +
            "WHERE s.sanPham.id = :idSanPham " +
            "AND (:anh IS NULL OR s.anh LIKE :anh) " +
            "AND (:size IS NULL OR sp.ten LIKE :size)")
    List<Integer> findSoLuong(
            @Param("idSanPham") Long idSanPham,
            @Param("anh") String anh,
            @Param("size") String size
    );
    @Query("SELECT s FROM SanPhamChiTiet s " +
            "JOIN s.kichCo sp " +
            "WHERE s.sanPham.id = :idSanPham " +
            "AND (:anh IS NULL OR s.anh LIKE :anh) " +
            "AND (:size IS NULL OR sp.ten LIKE :size)")
    SanPhamChiTiet findidspct(
            @Param("idSanPham") Long idSanPham,
            @Param("anh") String anh,
            @Param("size") String size
    );
    @Query("SELECT spct FROM GioHangChiTiet ghct " +
            "JOIN ghct.sanPhamChiTiet spct " +
            "WHERE spct.id = :idSanPham")
    List<SanPhamChiTiet> findDetailsBySanPhamId(@Param("idSanPham") Long idSanPham);

    @Query("SELECT s.id FROM SanPhamChiTiet s WHERE s.anh = :anh and s.sanPham.id = :idSanPham")
    List<Long> findIdsByAnhContaining(@Param("anh") Long anh,
     @Param("idSanPham") Long idSanPham);
    Optional<SanPhamChiTiet> findByKichCoAndMauSacAndDeGiayAndChatLieuAndTenAndCoGiay(
            KichCo kichCo,
            MauSac mauSac,
            DeGiay deGiay,
            ChatLieu chatLieu,
            String ten,
            CoGiay coGiay
    );

    Page<SanPhamChiTiet> findBySanPhamId(Long sanPhamId, Pageable pageable);

    @Query("SELECT s FROM SanPhamChiTiet s ORDER BY s.ngayTao DESC")
    List<SanPhamChiTiet> findTop12NamesByNgayTaoDesc(Pageable pageable);

    @Query("SELECT s FROM SanPhamChiTiet s " +
            "JOIN s.deGiay d " +
            "JOIN s.coGiay c " +
            "JOIN s.chatLieu cl " +
            "JOIN s.kichCo k " +
            "WHERE s.sanPham.id = :sanPhamId " +
            "AND (:keyword IS NULL OR s.ten LIKE %:keyword% OR s.moTa LIKE %:keyword% OR d.ten LIKE %:keyword% OR c.ten LIKE %:keyword%) " +
            "AND (:coGiayId IS NULL OR c.id = :coGiayId) " +
            "AND (:deGiayId IS NULL OR d.id = :deGiayId) " +
            "AND (:chatLieuId IS NULL OR cl.id = :chatLieuId) " +
            "AND (:kichCoId IS NULL OR k.id = :kichCoId)")
    List<SanPhamChiTiet> filterAndSearchSPCT(@Param("sanPhamId") Long sanPhamId,
                                             @Param("keyword") String keyword,
                                             @Param("coGiayId") Long coGiayId,
                                             @Param("deGiayId") Long deGiayId,
                                             @Param("chatLieuId") Long chatLieuId,
                                             @Param("kichCoId") Long kichCoId);


    @Query("SELECT s FROM SanPhamChiTiet s WHERE s.sanPham.id = ?1")
    List<SanPhamChiTiet> findBySanPhamId(Long sanPhamId);
}
