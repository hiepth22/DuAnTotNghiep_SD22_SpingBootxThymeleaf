package com.poly.sneaker.sevice;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import com.poly.sneaker.repository.SanPhamChiTietRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

@Service
public class HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;


    public Page<HoaDon> getAll(Pageable pageable) {
        return hoaDonRepository.getAllHoaDon(pageable);
    }


    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }

    public Page<HoaDon> getAllByTrangThai(int trangThai, Pageable pageable) {
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
            o.setNgayNhan(hoaDon.getNgayNhan());
            o.setNgayGiaoHang(hoaDon.getNgayGiaoHang());
            o.setNgayThanhToan(hoaDon.getNgayThanhToan());
            o.setTrangThai(hoaDon.getTrangThai());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDon updatePGG(Long id, HoaDon hd) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setPhieuGiamGia(hd.getPhieuGiamGia());
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
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).orElse(null);

        if (hoaDonChiTiet == null) {
            return null;
        }

        hoaDonChiTiet.setSoLuong(hdct.getSoLuong());

        return hoaDonChiTietRepository.save(hoaDonChiTiet);

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

    public HoaDon updateHoaDon(Long id, HoaDon hd) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setNguoiNhan(hd.getNguoiNhan());
            o.setSdtNguoiNhan(hd.getSdtNguoiNhan());
            o.setDiaChiNguoiNhan(hd.getDiaChiNguoiNhan());
            o.setTienShip(hd.getTienShip());
            o.setGhiChu(hd.getGhiChu());
            o.setTrangThai(hd.getTrangThai());

            return hoaDonRepository.save(o);
        }).orElse(null);
    }


    public Optional<HoaDon> getHoaDonByID(Long id) {
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
        List<SanPhamBanChayDTO> result = hoaDonRepository.getSanPhamBanChayNhat(PageRequest.of(0, 5));
        return result;
    }

    public List<SanPhamChiTiet> getSanPhamSapHetHang() {
        return sanPhamChiTietRepository.getSanPhamSapHetHang();
    }

    public List<HoaDon> getDoanhThuHomNay() {
        LocalDate today = LocalDate.now();

        LocalDateTime startOfDay = today.atStartOfDay();
        LocalDateTime endOfDay = today.atTime(LocalTime.MAX);

        return hoaDonRepository.findByTrangThaiAndNgayThanhToanBetween(6, startOfDay, endOfDay);
    }

    public List<HoaDon> getDoanhThuThangHienTai() {
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfMonth = today.withDayOfMonth(1);

        LocalDateTime startOfMonth = firstDayOfMonth.atStartOfDay();
        LocalDateTime endOfMonth = today.atTime(LocalTime.now());

        return hoaDonRepository.findByTrangThaiAndNgayThanhToanBetween(6, startOfMonth, endOfMonth);
    }

    public List<HoaDon> getDoanhThuNamHienTai() {
        LocalDate today = LocalDate.now();
        LocalDate startOfYear = LocalDate.of(today.getYear(), 1, 1);

        LocalDateTime startOfYearDateTime = startOfYear.atStartOfDay();
        LocalDateTime endOfYearDateTime = today.atTime(LocalTime.MAX);

        return hoaDonRepository.findByTrangThaiAndNgayThanhToanBetween(6, startOfYearDateTime, endOfYearDateTime);
    }

}
