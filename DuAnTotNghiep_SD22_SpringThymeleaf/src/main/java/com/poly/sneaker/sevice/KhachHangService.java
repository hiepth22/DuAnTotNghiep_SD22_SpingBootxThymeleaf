package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class KhachHangService {

    private final KhachHangRepository khachHangRepository;

    @Autowired
    public KhachHangService(KhachHangRepository khachHangRepository) {
        this.khachHangRepository = khachHangRepository;
    }

    public List<KhachHang> getAll() {
        return khachHangRepository.findAll();
    }

    public Page<KhachHang> phanTrang(Pageable pageable, int tt) {
        return khachHangRepository.findByTrangThai(tt, pageable);
    }

    public KhachHang add(KhachHang kh) {
        return khachHangRepository.save(kh);
    }

    public KhachHang deleteById(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            khachHangRepository.delete(o);
            return o;
        }).orElse(null);
    }

    public KhachHang update(Long id, KhachHang kh) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            o.setTen(kh.getTen());
            o.setMa(kh.getMa());
            o.setAnh(kh.getAnh());
            o.setCccd(kh.getCccd());
            o.setEmail(kh.getEmail());
            o.setGioiTinh(kh.getGioiTinh());
            o.setMatKhau(kh.getMatKhau());
            o.setNgaySinh(kh.getNgaySinh());
            o.setSdt(kh.getSdt());
            o.setTrangThai(kh.getTrangThai());
            o.setNgaycapnhap(java.time.LocalDateTime.now());
            return khachHangRepository.save(o);
        }).orElse(null);
    }

    public KhachHang updateTrangThaiToInactive(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(0);
            return khachHangRepository.save(o);
        }).orElse(null);
    }

    public Boolean existsById(Long id) {
        return khachHangRepository.existsById(id);
    }

    public KhachHang findById(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.orElse(null);
    }

    public List<KhachHang> search(String keyword) {
        List<KhachHang> allKhachHangs = khachHangRepository.findAll();

        return allKhachHangs.stream()
                .filter(kh ->
                        kh.getTen().toLowerCase().contains(keyword.toLowerCase()) ||
                                kh.getMa().toLowerCase().contains(keyword.toLowerCase()) ||
                                kh.getSdt().toLowerCase().contains(keyword.toLowerCase())
                )
                .collect(Collectors.toList());
    }
}
