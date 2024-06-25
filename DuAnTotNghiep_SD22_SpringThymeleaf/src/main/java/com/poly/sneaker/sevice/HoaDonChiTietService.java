package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class HoaDonChiTietService {
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;


    public HoaDonChiTiet updateSoLuongSanPham(HoaDonChiTiet hdct, Long id) {
        Optional<HoaDonChiTiet> getHDByID = hoaDonChiTietRepository.findById(id);
        int soluong = 1;
        hdct.setSoLuong(soluong);
        return hoaDonChiTietRepository.save(hdct);
    }


    public List<HoaDonChiTiet> findByHDId(Long idHoaDon) {
        return hoaDonChiTietRepository.TimTongTien(idHoaDon);
    }

}
