package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.GioHang;
import com.poly.sneaker.entity.GioHangChiTiet;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.repository.GioHangChiTietRepository;
import com.poly.sneaker.repository.GioHangRepository;
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

    public GioHang detail(Long id) {
        Optional<GioHang> optional = gioHangRepository.findByIdTK(id);
        return optional.map(o -> o).orElse(null);
    }


    public List<GioHangChiTiet> detailGHCT(Long id) {
        return gioHangChiTietRepository.findByIdGH(id);
    }

}
