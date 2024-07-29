package com.poly.sneaker.sevice;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.dto.SanPhamDTO;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;


    public Page<HoaDon> getAll(Pageable pageable){
        return hoaDonRepository.getAllHoaDon(pageable);
    }


    public List<HoaDon> findAll(){
        return hoaDonRepository.findAll();
    }

    public Page<HoaDon> getAllByTrangThai(int trangThai, Pageable pageable){
        if (trangThai == 0) {
            return hoaDonRepository.findAll(pageable);
        } else {
            return hoaDonRepository.findAllByTrangThai(trangThai, pageable);
        }
    }

    public Page<HoaDon> findHoaDonByMaAndNgayTaoAndTrangThai(String keyword, int loai, Date startDate, Date endDate, int trangThai, Pageable pageable) {
        return hoaDonRepository.findByKeywordAndNgayTaoBetweenAndTrangThai(keyword, loai, startDate, endDate, trangThai, pageable);
    }

    public Page<HoaDon> findHoaDonByMaAndNgayTao(String keyword, int loai, Date startDate, Date endDate, Pageable pageable) {
        return hoaDonRepository.findByMaAndNgayTaoBetweenAndKeyword(keyword, loai, startDate, endDate, pageable);
    }

    public HoaDon add(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    public HoaDon taoMaHoaDon(Long id, HoaDon hoaDon) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setMa(hoaDon.getMa());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDon detail(Long id) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }


    public HoaDon updateTrangThai(Long id, HoaDon hoaDon) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setNgayThanhToan(hoaDon.getNgayThanhToan());
            o.setTrangThai(hoaDon.getTrangThai());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDon updateTongTien(Long id, HoaDon hd) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setTongTien(hd.getTongTien());
            o.setTongTienSauGiam(hd.getTongTienSauGiam());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDonChiTiet updateSoLuong(Long id, HoaDonChiTiet hdct) {
        Optional<HoaDonChiTiet> optional = hoaDonChiTietRepository.findById(id);
        return optional.map(o -> {
            o.setSoLuong(hdct.getSoLuong());
            return hoaDonChiTietRepository.save(o);
        }).orElse(null);
    }

    public HoaDon updateThongTinNguoiNhan(Long id, HoaDon hd) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setNguoiNhan(hd.getNguoiNhan());
            o.setSdtNguoiNhan(hd.getSdtNguoiNhan());
            o.setDiaChiNguoiNhan(hd.getDiaChiNguoiNhan());
            o.setTienShip(hd.getTienShip());
            o.setGhiChu(hd.getGhiChu());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public Optional<HoaDon> getHoaDonByID(Long id){
        return hoaDonRepository.findById(id);
    }


    public List<HoaDon> findByIDKHAndTrangThai(Long id) {
        return hoaDonRepository.findByIDKHAndTrangThai(id);
    }

    public List<HoaDonChiTiet> findByIDKHAndTrangThaiHDCT(Long id) {
        try {
            return hoaDonRepository.findByIDKHAndTrangThaiHDCT(id);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi lấy chi tiết đơn hàng", e);
        }
    }

    @Transactional
    public void updateHoaDonChiTiet(Long idChiTietSanPham, Long idHoaDon, Integer soLuong, BigDecimal gia, Integer trangThai) {
        hoaDonRepository.updateByIdChiTietSanPhamAndIdHoaDon(soLuong, gia, trangThai, idChiTietSanPham, idHoaDon);
    }

    public List<SanPhamBanChayDTO> getTop10Products() {
        List<Object[]> result = hoaDonRepository.getSanPhamBanChayNhat();
        List<SanPhamBanChayDTO> top10Products = new ArrayList<>();

        for (Object[] row : result) {
            SanPhamBanChayDTO sanPhamBanChayDTO = new SanPhamBanChayDTO();
            sanPhamBanChayDTO.setId((Long) row[0]);
            sanPhamBanChayDTO.setAnh((String) row[1]);
            sanPhamBanChayDTO.setTen((String) row[2]);
            sanPhamBanChayDTO.setGiaBan((BigDecimal) row[3]);
            sanPhamBanChayDTO.setTongSoLuong((Long) row[4]);
            top10Products.add(sanPhamBanChayDTO);
        }
        
        return top10Products;
    }


}
