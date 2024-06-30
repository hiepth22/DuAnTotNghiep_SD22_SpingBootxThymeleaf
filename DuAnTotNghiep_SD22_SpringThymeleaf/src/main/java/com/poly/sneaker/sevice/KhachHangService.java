package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.KhachHangRepository;
import jakarta.persistence.Entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class KhachHangService {
    @Autowired
    private KhachHangRepository khachHangRepository;

    public List<KhachHang> getAll() {

        return khachHangRepository.findAll();
    }

    public KhachHang Add(KhachHang Nv) {
        return khachHangRepository.save(Nv);
    }

    public KhachHang deleteById(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            khachHangRepository.delete(o);
            return o;
        }).orElse(null);
    }

    public KhachHang update(Long id, KhachHang newnv) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            o.setTen(newnv.getTen());
            o.setMa(newnv.getMa());
            o.setAnh(newnv.getAnh());
            o.setCccd(newnv.getCccd());
            o.setEmail(newnv.getEmail());
            o.setGioiTinh(newnv.getGioiTinh());
            o.setMatKhau(newnv.getMatKhau());
            o.setNgaySinh(newnv.getNgaySinh());
            o.setSdt(newnv.getSdt());
            o.setTrangThai(newnv.getTrangThai());
            o.setNgaycapnhap(java.time.LocalDateTime.now());
            return khachHangRepository.save(o);
        }).orElse(null);
    }
    public KhachHang updateTrangThai(Long id){
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            //
            o.setTrangThai(0);

            return khachHangRepository.save(o);
        }).orElse(null);
    }
    public Boolean existsById(Long id) {
        return khachHangRepository.existsById(id);
    }

    public List<KhachHang> search(String keyword) {
        return khachHangRepository.findByTen(keyword);
    }
    public KhachHang findById(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }
}
