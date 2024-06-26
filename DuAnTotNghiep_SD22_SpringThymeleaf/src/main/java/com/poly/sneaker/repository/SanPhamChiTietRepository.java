package com.poly.sneaker.repository;

import com.poly.sneaker.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Long>, JpaSpecificationExecutor<SanPhamChiTiet> {

    @Query(value = "\tSELECT \n" +
            "\tspct.id,\n" +
            "    anh.ten AS url,\n" +
            "    sp.ten AS TenSanPham,\n" +
            "    spct.giaBan,\n" +
            "    spct.soLuong,\n" +
            "    kc.ten AS TenKichCo,\n" +
            "    ms.ten AS TenMauSac,\n" +
            "    spct.trangThai AS TrangThaiCTSP\n" +
            "FROM \n" +
            "    san_pham_chi_tiet spct\n" +
            "JOIN \n" +
            "    anh ON spct.idAnh = anh.id\n" +
            "JOIN \n" +
            "    san_pham sp ON spct.idSanPham = sp.id\n" +
            "JOIN \n" +
            "    kich_co kc ON spct.idKichCo = kc.id\n" +
            "JOIN \n" +
            "    mau_sac ms ON spct.idMauSac = ms.id\n" +
            "WHERE \n" +
            "    spct.trangThai = 1", nativeQuery = true)
    List<Object[]> findBySanPhamCT();


    List<SanPhamChiTiet> findByMa(String ma);

    @Query(value = "select * \n" +
            "from [san_pham_chi_tiet] where idSanPham = ?1", nativeQuery = true)
    List<SanPhamChiTiet> findBySanPham(Long id);

    @Query(value = "select top 1 * from [san_pham_chi_tiet] order by id desc", nativeQuery = true)
    SanPhamChiTiet findIdLonNhat();

}
