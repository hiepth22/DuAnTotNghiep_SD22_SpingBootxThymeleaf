package com.poly.sneaker.repository;

import com.poly.sneaker.dto.SanPhamChiTietDTO;
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

    @Query("SELECT s FROM SanPhamChiTiet s ")
    List<SanPhamChiTiet> findTop12NamesByNgayTaoDesc(Pageable pageable);

    @Query("SELECT s FROM SanPhamChiTiet s JOIN s.nhaSanXuat t WHERE t.ten = :ten")
    List<SanPhamChiTiet> findByThuongHieu_TenThuongHieu(@Param("ten") String tenThuongHieu);

    @Query("SELECT s FROM SanPhamChiTiet s " +
            "LEFT JOIN s.sanPham sp " +
            "LEFT JOIN s.deGiay d " +
            "LEFT JOIN s.coGiay c " +
            "LEFT JOIN s.chatLieu cl " +
            "LEFT JOIN s.kichCo k " +
            "WHERE s.sanPham.id = :sanPhamId " +
            "AND (:keyword IS NULL OR sp.ten LIKE %:keyword% OR s.moTa LIKE %:keyword% OR d.ten LIKE %:keyword% OR c.ten LIKE %:keyword% OR k.ten LIKE %:keyword% " +
            "OR cl.ten LIKE %:keyword% OR s.ma LIKE %:keyword%) " +
            "AND (:coGiayId IS NULL OR c.id = :coGiayId) " +
            "AND (:deGiayId IS NULL OR d.id = :deGiayId) " +
            "AND (:chatLieuId IS NULL OR cl.id = :chatLieuId) " +
            "AND (:kichCoId IS NULL OR k.id = :kichCoId) " +
            "AND (:minPrice IS NULL OR s.giaBan >= :minPrice) " +
            "AND (:maxPrice IS NULL OR s.giaBan <= :maxPrice) " +
            "ORDER BY s.id DESC")
    List<SanPhamChiTiet> filterAndSearchSPCT(@Param("sanPhamId") Long sanPhamId,
                                             @Param("keyword") String keyword,
                                             @Param("coGiayId") Long coGiayId,
                                             @Param("deGiayId") Long deGiayId,
                                             @Param("chatLieuId") Long chatLieuId,
                                             @Param("kichCoId") Long kichCoId,
                                             @Param("minPrice") Double minPrice,
                                             @Param("maxPrice") Double maxPrice);




    @Query("SELECT s FROM SanPhamChiTiet s WHERE s.sanPham.id = ?1")
    List<SanPhamChiTiet> findBySanPhamId(Long sanPhamId);

    @Query("SELECT s FROM SanPhamChiTiet s WHERE s.barcode = ?1")
    SanPhamChiTiet findSPByBarcode(String barcode);

    @Query("SELECT sp FROM SanPhamChiTiet sp " +
            "JOIN sp.chatLieu cl " +
            "JOIN sp.coGiay cg " +
            "JOIN sp.deGiay dg " +
            "JOIN sp.kichCo kc " +
            "JOIN sp.mauSac ms " +
            "JOIN sp.sanPham spn " +
            "JOIN spn.thuongHieu th " +
            "WHERE (:idChatLieu IS NULL OR sp.chatLieu.id = :idChatLieu) " +
            "AND (:idCoGiay IS NULL OR sp.coGiay.id = :idCoGiay) " +
            "AND (:idDeGiay IS NULL OR sp.deGiay.id = :idDeGiay) " +
            "AND (:idKichCo IS NULL OR sp.kichCo.id = :idKichCo) " +
            "AND (:idMauSac IS NULL OR sp.mauSac.id = :idMauSac) " +
            "AND (:idThuongHieu IS NULL OR spn.thuongHieu.id = :idThuongHieu) " +
            "AND (sp.ten LIKE %:keyword% " +
            "OR cl.ten LIKE %:keyword% " +
            "OR cg.ten LIKE %:keyword% " +
            "OR dg.ten LIKE %:keyword% " +
            "OR kc.ten LIKE %:keyword% " +
            "OR ms.ten LIKE %:keyword% " +
            "OR spn.ten LIKE %:keyword% " +
            "OR th.ten LIKE %:keyword%) " +
            "AND (sp.giaBan >= :giaBanMin OR :giaBanMin IS NULL) " +
            "AND (sp.giaBan <= :giaBanMax OR :giaBanMax IS NULL) and spn.trangThai != 0" +
            "ORDER BY sp.id DESC ")
    Page<SanPhamChiTiet> findByBlaBla(@Param("idChatLieu") Long idChatLieu,
                                      @Param("idCoGiay") Long idCoGiay,
                                      @Param("idDeGiay") Long idDeGiay,
                                      @Param("idKichCo") Long idKichCo,
                                      @Param("idMauSac") Long idMauSac,
                                      @Param("idThuongHieu") Long idThuongHieu,
                                      @Param("keyword") String keyword,
                                      @Param("giaBanMin") Double giaBanMin,
                                      @Param("giaBanMax") Double giaBanMax,
                                      Pageable pageable);

    @Query("SELECT sp FROM SanPhamChiTiet sp " +
            "JOIN sp.chatLieu cl " +
            "JOIN sp.coGiay cg " +
            "JOIN sp.deGiay dg " +
            "JOIN sp.kichCo kc " +
            "JOIN sp.mauSac ms " +
            "JOIN sp.sanPham spn " +
            "JOIN spn.thuongHieu th " +
            "WHERE sp.id IN (" +
            "   SELECT DISTINCT sp1.id FROM SanPhamChiTiet sp1 " +
            "   JOIN sp1.chatLieu cl1 " +
            "   JOIN sp1.coGiay cg1 " +
            "   JOIN sp1.deGiay dg1 " +
            "   JOIN sp1.kichCo kc1 " +
            "   JOIN sp1.mauSac ms1 " +
            "   JOIN sp1.sanPham spn1 " +
            "   JOIN spn1.thuongHieu th1 " +
            "   WHERE (:idChatLieu IS NULL OR sp1.chatLieu.id = :idChatLieu) " +
            "   AND (:idCoGiay IS NULL OR sp1.coGiay.id = :idCoGiay) " +
            "   AND (:idDeGiay IS NULL OR sp1.deGiay.id = :idDeGiay) " +
            "   AND (:idKichCo IS NULL OR sp1.kichCo.id = :idKichCo) " +
            "   AND (:idMauSac IS NULL OR sp1.mauSac.id = :idMauSac) " +
            "   AND (:idThuongHieu IS NULL OR spn1.thuongHieu.id = :idThuongHieu)" +
            "AND spn1.trangThai != 0 " +
            "   AND (sp1.ten LIKE %:keyword% " +
            "   OR cl1.ten LIKE %:keyword% " +
            "   OR cg1.ten LIKE %:keyword% " +
            "   OR dg1.ten LIKE %:keyword% " +
            "   OR kc1.ten LIKE %:keyword% " +
            "   OR ms1.ten LIKE %:keyword% " +
            "   OR spn1.ten LIKE %:keyword% " +
            "   OR th1.ten LIKE %:keyword%) " +
            "   AND (:giaBanMin IS NULL OR sp1.giaBan >= :giaBanMin) " +
            "   AND (:giaBanMax IS NULL OR sp1.giaBan <= :giaBanMax)" +
            ") " +
            "ORDER BY sp.id DESC")
    Page<SanPhamChiTiet> findByBlaBla1(@Param("idChatLieu") Long idChatLieu,
                                      @Param("idCoGiay") Long idCoGiay,
                                      @Param("idDeGiay") Long idDeGiay,
                                      @Param("idKichCo") Long idKichCo,
                                      @Param("idMauSac") Long idMauSac,
                                      @Param("idThuongHieu") Long idThuongHieu,
                                      @Param("keyword") String keyword,
                                      @Param("giaBanMin") Double giaBanMin,
                                      @Param("giaBanMax") Double giaBanMax,
                                      Pageable pageable);
    @Query("SELECT new com.poly.sneaker.dto.SanPhamChiTietDTO(s.id, s.ma, s.ten, s.anh, s.soLuong, s.giaBan, " +
            "s.moTa, s.trangThai, s.canNang, s.kichCo.ten, s.mauSac.ten, s.deGiay.ten, s.chatLieu.ten, sp.id, s.coGiay.ten, " +
            "s.nhaSanXuat.ten, s.ngayCapNhat, th.ten) " +
            "FROM SanPhamChiTiet s " +
            "JOIN s.sanPham sp " +
            "JOIN sp.thuongHieu th " +
            "WHERE s.id = :id")
    SanPhamChiTietDTO findSanPhamChiTietById(@Param("id") Long id);
}
