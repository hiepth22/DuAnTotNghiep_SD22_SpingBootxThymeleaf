package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SanPhamService {
    @Autowired
    private SanPhamRepository repository;

    public List<SanPham> getAll() {
        return repository.findAll();
    }

    public Page<SanPham> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 5);
        return repository.findAll(pageable);
    }

    public SanPham add(SanPham sanPham) {
        return repository.save(sanPham);
    }

    public SanPham finById(Long id) {
        Optional<SanPham> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public SanPham deleteById(Long id) {
        Optional<SanPham> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public SanPham update(Long id, SanPham newSanPham) {
        Optional<SanPham> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newSanPham.getTen());
            o.setThuongHieu(newSanPham.getThuongHieu());
            o.setMoTa(newSanPham.getMoTa());
            o.setNgayTao(newSanPham.getNgayTao());
            o.setNgayCapNhat(newSanPham.getNgayCapNhat());
            o.setNguoiTao(newSanPham.getNguoiTao());
            o.setNguoiCapNhat(newSanPham.getNguoiCapNhat());
            o.setTrangThai(newSanPham.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public SanPham updateTrangThai(Long id) {
        Optional<SanPham> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(0);
            return repository.save(o);
        }).orElse(null);
    }

    public Boolean existingById(Long id) {
        return repository.existsById(id);
    }

    public Boolean existingByTen(String ten) {
        return repository.findByTen(ten).size() > 0;
    }
}
