package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.GioHangChiTietRepository;
import com.poly.sneaker.repository.GioHangRepository;
import com.poly.sneaker.repository.PhieuGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GiohangService {

    @Autowired
    GioHangRepository gioHangRepository;

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;
    @Autowired
    private PhieuGiamGiaRepository phieuGiamGiaRepository;

    public GioHang detail(Long id) {
        Optional<GioHang> optional = gioHangRepository.findByIdTK(id);
        return optional.map(o -> o).orElse(null);
    }


    public List<GioHangChiTiet> detailGHCT(Long id) {
        return gioHangChiTietRepository.findByIdGH(id);
    }

    public GioHang add(GioHang gioHang) {
        return gioHangRepository.save(gioHang);
    }

    public Long IdGioHang(Long id) {
        return gioHangRepository.selectIDGH(id);
    }

    public GioHangChiTiet updateSoLuong(Long id, GioHangChiTiet gioHangChiTiet) {
        Optional<GioHangChiTiet> optional = gioHangChiTietRepository.findById(id);
        return optional.map(o -> {
            o.setSoLuong(gioHangChiTiet.getSoLuong());
            return gioHangChiTietRepository.save(o);
        }).orElse(null);
    }

    public List<PhieuGiamGia> getPhieuGiamGia() {
        return phieuGiamGiaRepository.getPGGConHanSD();
    }

}
