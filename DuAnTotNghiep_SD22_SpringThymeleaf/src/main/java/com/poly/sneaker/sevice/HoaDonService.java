package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;


    public Page<HoaDon> getAll(Pageable pageable){
        return hoaDonRepository.findAll(pageable);
    }

    public Page<HoaDon> getAllByTrangThai(int trangThai, Pageable pageable){
        if (trangThai == 0) {
            return hoaDonRepository.findAll(pageable);
        } else {
            return hoaDonRepository.findAllByTrangThai(trangThai, pageable);
        }
    }

    public Page<HoaDon> findHoaDonByMaAndNgayTaoAndTrangThai(String keyword, Date startDate, Date endDate, int trangThai, Pageable pageable) {
        return hoaDonRepository.findByKeywordAndNgayTaoBetweenAndTrangThai(keyword, startDate, endDate, trangThai, pageable);
    }

    public Page<HoaDon> findHoaDonByMaAndNgayTao(String keyword, Date startDate, Date endDate, Pageable pageable) {
        return hoaDonRepository.findByMaAndNgayTaoBetweenAndKeyword(keyword, startDate, endDate, pageable);
    }

    public HoaDon add(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    public HoaDon detail(Long id) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }


    public HoaDon updateTrangThai(Long id, HoaDon hoaDon) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
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




}
