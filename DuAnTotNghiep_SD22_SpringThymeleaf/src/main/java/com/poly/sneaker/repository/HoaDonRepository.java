package com.poly.sneaker.repository;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.SanPhamChiTiet;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {

    @Query(value = "SELECT * FROM hoa_don WHERE trangThai = :trangThai AND trangThai != 8 and trangThai != 20  ORDER BY id DESC", nativeQuery = true)
    Page<HoaDon> findAllByTrangThai(@Param("trangThai") int trangThai, Pageable pageable);

    @Query(value = "SELECT h.* FROM hoa_don h " +
            "LEFT JOIN nhan_vien nv ON h.idNhanVien = nv.id " +
            "WHERE ((h.ma LIKE %:keyword% OR h.sdtNguoiNhan LIKE %:keyword% OR nv.ma LIKE %:keyword%) " +
            "and loai = :loai and h.ngayTao BETWEEN :startDate AND :endDate) AND h.trangThai = :trangThai AND h.trangThai != 8 and h.trangThai != 20 ORDER BY h.id DESC", nativeQuery = true)
    Page<HoaDon> findByKeywordAndNgayTaoBetweenAndTrangThai(@Param("keyword") String keyword, @Param("loai") int loai, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("trangThai") int trangThai, Pageable pageable);

    @Query(value = "SELECT h.* FROM hoa_don h " +
            "LEFT JOIN nhan_vien nv ON h.idNhanVien = nv.id " +
            "WHERE ((h.ma LIKE %:keyword% OR h.sdtNguoiNhan LIKE %:keyword% OR nv.ma LIKE %:keyword%) " +
            "and loai = :loai and h.ngayTao BETWEEN :startDate AND :endDate) AND h.trangThai != 8 and h.trangThai != 20 ORDER BY h.id DESC", nativeQuery = true)
    Page<HoaDon> findByMaAndNgayTaoBetweenAndKeyword(@Param("keyword") String keyword, @Param("loai") int loai, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);

    @Query(value = "SELECT * FROM hoa_don WHERE trangThai = 8 ORDER BY id DESC", nativeQuery = true)
    List<HoaDon> findHoaDonCho();

    @Query(value = "SELECT * FROM hoa_don WHERE trangThai != 8  and trangThai != 20 ORDER BY id DESC" , nativeQuery = true)
    Page<HoaDon> getAllHoaDon(Pageable pageable);


    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon and trangThai != 8 and trangThai != 20 ", nativeQuery = true)
    List<HoaDonChiTiet> findByIdHD(@Param("id") Long id);

    List<HoaDon> findAllByNgayTaoBetweenAndTrangThaiAndMaContainingIgnoreCaseOrSdtNguoiNhanContainingIgnoreCase(
            LocalDateTime startDate, LocalDateTime endDate, int trangThai, String ma, String sdt);

    @Query(value = "SELECT * FROM hoa_don WHERE idKhachHang = :idKhachHang and loai = 1 ORDER BY id DESC", nativeQuery = true)
    List<HoaDon> findByIDKHAndTrangThai(@Param("idKhachHang") Long idKhachHang);

    @Query(value = "SELECT * FROM hoa_don_chi_tiet WHERE idHoaDon = :idHoaDon", nativeQuery = true)
    List<HoaDonChiTiet> findByIDKHAndTrangThaiHDCT(@Param("idHoaDon") Long idHoaDon);

    @Modifying
    @Query(value = "UPDATE hoa_don_chi_tiet SET soLuong = :soLuong, gia = :gia, trangThai = :trangThai WHERE idChiTietSanPham = :idChiTietSanPham AND idHoaDon = :idHoaDon", nativeQuery = true)
    void updateByIdChiTietSanPhamAndIdHoaDon(@Param("soLuong") Integer soLuong,
                                             @Param("gia") BigDecimal gia,
                                             @Param("trangThai") Integer trangThai,
                                             @Param("idChiTietSanPham") Long idChiTietSanPham,
                                             @Param("idHoaDon") Long idHoaDon);

    @Query(value = "SELECT * FROM hoa_don", nativeQuery = true)
    List<HoaDon> getAll2();

    @Query(value = "SELECT new com.poly.sneaker.dto.SanPhamBanChayDTO(spct.id, spct.anh, spct.ten, spct.giaBan, SUM(hdct.soLuong))" +
            "FROM HoaDon hd \n" +
            "INNER JOIN \n" +
            "    HoaDonChiTiet hdct ON hd.id = hdct.hoaDon.id \n" +
            "INNER JOIN \n" +
            "    SanPhamChiTiet spct ON hdct.sanPhamChiTiet.id = spct.id \n" +
            "INNER JOIN \n" +
            "    SanPham sp ON sp.id = spct.sanPham.id \n" +
            "WHERE \n" +
            "    hd.trangThai = 6 AND sp.trangThai != 0 \n " +
            "GROUP BY spct.id, spct.anh, spct.ten, spct.giaBan\n" +
            "ORDER BY SUM(hdct.soLuong) DESC ")
    List<SanPhamBanChayDTO> getSanPhamBanChayNhat(Pageable pageable);

    @Query("SELECT hd FROM HoaDon hd WHERE hd.ma = :ma")
    List<HoaDon> findByMa(@Param("ma") String ma);

    @Query(value = "SELECT * FROM hoa_don WHERE trangThai = :trangThai AND ngayThanhToan BETWEEN :startDate AND :endDate", nativeQuery = true)
    List<HoaDon> findByTrangThaiAndNgayThanhToanBetween(@Param("trangThai") int trangThai,
                                                        @Param("startDate") LocalDateTime startDate,
                                                        @Param("endDate") LocalDateTime endDate);


}
