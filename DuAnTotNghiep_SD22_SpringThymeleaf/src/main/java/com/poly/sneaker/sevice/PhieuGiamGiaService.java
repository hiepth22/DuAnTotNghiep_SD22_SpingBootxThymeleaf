package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.PhieuGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class PhieuGiamGiaService {
    @Autowired
    private PhieuGiamGiaRepository phieuGiamGiaRepository;

    public List<PhieuGiamGia> getall() {

        return phieuGiamGiaRepository.findAll();
    }
    public List<PhieuGiamGia> getall(int tt) {
        return phieuGiamGiaRepository.findByTrangThai(tt);
    }
    public Page<PhieuGiamGia> page(Pageable pageable,int tt) {
        return phieuGiamGiaRepository.findByTrangThai(tt,pageable);
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
    public PhieuGiamGia updateTrangThai(Long id, Integer trangThai){
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


    public List<PhieuGiamGia> getAll() {
        return phieuGiamGiaRepository.findAll();
    }










}
