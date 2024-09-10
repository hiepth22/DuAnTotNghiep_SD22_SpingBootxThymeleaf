package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.entity.LichSuHoaDon;
import com.poly.sneaker.repository.HoaDonRepository;
import com.poly.sneaker.repository.LichSuHoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class LichSuHoaDonService {

    @Autowired
    LichSuHoaDonRepository lichSuHoaDonRepository;

    public LichSuHoaDon add(Long id,LichSuHoaDon lichSuHoaDon) {
        lichSuHoaDon.setIdHoaDon(id);
        lichSuHoaDon.setGhiChu(lichSuHoaDon.getGhiChu());
        lichSuHoaDon.setHanhDong(lichSuHoaDon.getHanhDong());
        LocalDateTime ngayTao = LocalDateTime.now();
        lichSuHoaDon.setNgayTao(ngayTao);
        lichSuHoaDon.setNguoiTao("Admin");
        return lichSuHoaDonRepository.save(lichSuHoaDon);
    }

    public List<LichSuHoaDon> getAllByIdhoaDon(Long idhoaDon) {
        return lichSuHoaDonRepository.getByIdHoaDon(idhoaDon);
    }

    public List<LichSuHoaDon> getAllByIdhoaDon2(Long idhoaDon) {
        return lichSuHoaDonRepository.getByIdHoaDon2(idhoaDon);
    }



}
