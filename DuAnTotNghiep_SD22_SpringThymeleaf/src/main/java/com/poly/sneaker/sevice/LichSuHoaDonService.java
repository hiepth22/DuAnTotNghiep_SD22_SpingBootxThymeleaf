package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.entity.LichSuHoaDon;
import com.poly.sneaker.repository.HoaDonRepository;
import com.poly.sneaker.repository.LichSuHoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LichSuHoaDonService {

    @Autowired
    LichSuHoaDonRepository lichSuHoaDonRepository;

    public LichSuHoaDon add(Long id,LichSuHoaDon lichSuHoaDon) {
        lichSuHoaDon.setIdHoaDon(id);
        return lichSuHoaDonRepository.save(lichSuHoaDon);
    }

}
