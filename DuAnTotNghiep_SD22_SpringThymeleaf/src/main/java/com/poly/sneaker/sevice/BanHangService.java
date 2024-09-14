package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import com.poly.sneaker.repository.SanPhamChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BanHangService {


    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;
    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    public Page<SanPhamChiTiet> getAllSanPham(Pageable pageable) {
        return sanPhamChiTietRepository.findAll(pageable);
    }

    public HoaDonChiTiet add(HoaDonChiTiet hoaDonChiTiet) {
        return hoaDonChiTietRepository.save(hoaDonChiTiet);
    }

    public List<HoaDon> getHoaDonCho() {
        return hoaDonRepository.findHoaDonCho();
    }

    public HoaDon updateKhachHang(Long id, HoaDon hoaDon) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setKhachHang(hoaDon.getKhachHang());
            o.setNguoiNhan(hoaDon.getNguoiNhan());
            o.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDon updateThongTinNguoiNhan(Long id, HoaDon hoaDon) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setNguoiNhan(hoaDon.getNguoiNhan());
            o.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }


}
