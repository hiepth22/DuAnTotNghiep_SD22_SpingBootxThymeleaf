package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.NhanVien;
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



    public List<HoaDonChiTiet> findByHDId(Long idHoaDon) {
        return hoaDonChiTietRepository.TimTongTien(idHoaDon);
    }

    public HoaDonChiTiet deleteById(Long id) {
        Optional<HoaDonChiTiet> optional = hoaDonChiTietRepository.findById(id);
        return optional.map(o -> {
            hoaDonChiTietRepository.delete(o);
            return o;
        }).orElse(null);
    }



}
