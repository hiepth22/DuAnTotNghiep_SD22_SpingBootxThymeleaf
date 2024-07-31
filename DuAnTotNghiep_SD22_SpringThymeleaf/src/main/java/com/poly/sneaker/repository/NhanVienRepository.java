package com.poly.sneaker.repository;

import com.poly.sneaker.dto.NhanVienPhanTrang;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Long> {
    @Query(name ="find_nhanvien",nativeQuery = true)
    List<NhanVienPhanTrang> findBynv(@Param("KEYWORD") String keyword,
                                     @Param("TRANGTHAI") Optional<Integer> trangThai,
                                     @Param("VAITRO") Optional<Integer> vaiTro,
                                     @Param("startDate") Date startDate,
                                     @Param("endDate") Date endDate,
                                     @Param("PAGE_INDEX") Integer page_index,
                                     @Param("PAGE_SIZE") Integer page_size);

    List<NhanVien> findByTrangThai(int tt);


    Optional<NhanVien> findByEmail(String email);

    Optional<NhanVien> findBySdt(String sdt);
    Page<NhanVien> findByTrangThai(int trangThai, Pageable pageable);
}
