package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.DanhMuc;
import com.poly.sneaker.repository.DanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DanhMucService {
    @Autowired
    private DanhMucRepository repository;

    public List<DanhMuc> getAll() {
        return repository.findAll();
    }

    public DanhMuc add(DanhMuc danhMuc) {
        return repository.save(danhMuc);
    }

    public DanhMuc finById(Long id) {
        Optional<DanhMuc> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public DanhMuc deleteById(Long id) {
        Optional<DanhMuc> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public DanhMuc update(Long id, DanhMuc newDanhMuc) {
        Optional<DanhMuc> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newDanhMuc.getTen());
            o.setNgayTao(newDanhMuc.getNgayTao());
            o.setNgayCapNhat(newDanhMuc.getNgayCapNhat());
            o.setNguoiTao(newDanhMuc.getNguoiTao());
            o.setNguoiCapNhat(newDanhMuc.getNguoiCapNhat());
            o.setTrangThai(newDanhMuc.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public DanhMuc updateTrangThai(Long id) {
        Optional<DanhMuc> optional = repository.findById(id);
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
