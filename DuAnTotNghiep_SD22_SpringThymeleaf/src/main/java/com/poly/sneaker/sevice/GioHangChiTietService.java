package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.GioHangChiTietRepository;
import com.poly.sneaker.repository.GioHangRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GioHangChiTietService {

    @Autowired
    GioHangRepository gioHangRepository;

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;

    public GioHangChiTiet add(GioHangChiTiet gioHangChiTiet) {
        return gioHangChiTietRepository.save(gioHangChiTiet);
    }

    public GioHangChiTiet deleteById(Long id) {
        Optional<GioHangChiTiet> optional = gioHangChiTietRepository.findById(id);
        return optional.map(o -> {
            gioHangChiTietRepository.delete(o);
            return o;
        }).orElse(null);
    }

    @Transactional
    public void deleteGioHangChiTietByIdGioHang(Long idGioHang) {
        gioHangChiTietRepository.deleteByIdGioHang(idGioHang);
    }
    public GioHangChiTiet updateSL(Long idspct, Integer sl) {
        Optional<GioHangChiTiet> optional = gioHangChiTietRepository.findBySanPhamChiTietId(idspct);
        if (optional.isPresent()) {
            GioHangChiTiet gioHangChiTiet = optional.get();
            gioHangChiTiet.setSoLuong(sl);
            return gioHangChiTietRepository.save(gioHangChiTiet);
        } else {
            throw new RuntimeException("Không tìm thấy nhân viên với ID: " + idspct);
        }
    }

}
