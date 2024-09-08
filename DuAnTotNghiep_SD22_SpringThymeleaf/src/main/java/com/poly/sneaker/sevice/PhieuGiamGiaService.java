package com.poly.sneaker.sevice;



import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.PhieuGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class PhieuGiamGiaService {
    @Autowired
    private PhieuGiamGiaRepository phieuGiamGiaRepository;

    public List<PhieuGiamGia> getall() {
        return phieuGiamGiaRepository.findAllDesc();
    }
    public List<PhieuGiamGia> getall(int tt) {
        return phieuGiamGiaRepository.findByTrangThai(tt);
    }


    public PhieuGiamGia Add(PhieuGiamGia Pgg) {
        return phieuGiamGiaRepository.save(Pgg);
    }

    public PhieuGiamGia deleteById(Long id) {
        Optional<PhieuGiamGia> optional = phieuGiamGiaRepository.findById(id);
        return optional.map(o -> {
            phieuGiamGiaRepository.delete(o);
            return o;
        }).orElse(null);
    }

    public PhieuGiamGia update(Long id, PhieuGiamGia newpgg) {
        Optional<PhieuGiamGia> optional = phieuGiamGiaRepository.findById(id);
        return optional.map(o -> {
            o.setMa(newpgg.getMa());
            o.setTen(newpgg.getTen());
            o.setSoLuong(newpgg.getSoLuong());
            o.setHinhThucGiam(newpgg.getHinhThucGiam());
            o.setDonToiThieu(newpgg.getDonToiThieu());
            o.setGiaTriGiam(newpgg.getGiaTriGiam());
            o.setGiamToiDa(newpgg.getGiamToiDa());
            o.setNgayBatDau(newpgg.getNgayBatDau());
            o.setNgayKetThuc(newpgg.getNgayKetThuc());
            o.setTrangThai(newpgg.getTrangThai());
            return phieuGiamGiaRepository.save(o);
        }).orElse(null);
    }
    public PhieuGiamGia updateTrangThai(Long id, Integer tt){
        Optional<PhieuGiamGia> optional = phieuGiamGiaRepository.findById(id);

        return optional.map(o -> {
            o.setTrangThai(0);
            return phieuGiamGiaRepository.save(o);
        }).orElse(null);
    }
    public Boolean existsById(Long id) {
        return phieuGiamGiaRepository.existsById(id);
    }

    public Boolean trangthai(int tt) {
        return phieuGiamGiaRepository.findByTrangThai(tt).size() > 0;
    }
    public PhieuGiamGia findById(Long id) {
        Optional<PhieuGiamGia> optional = phieuGiamGiaRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }


    public List<PhieuGiamGia> PhieuGiamGiaPhuHop(Long max){
        return phieuGiamGiaRepository.getPhieuGiamGiaPhuHop(max);
    }


}
