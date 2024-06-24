package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.repository.NhaSanXuatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NhaSanXuatService {
    @Autowired
    private NhaSanXuatRepository repository;

    public List<NhaSanXuat> getAll() {
        return repository.findAll();
    }

    public NhaSanXuat add(NhaSanXuat nhaSanXuat) {
        return repository.save(nhaSanXuat);
    }

    public NhaSanXuat finById(Long id) {
        Optional<NhaSanXuat> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public NhaSanXuat deleteById(Long id) {
        Optional<NhaSanXuat> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public NhaSanXuat update(Long id, NhaSanXuat newNhaSanXuat) {
        Optional<NhaSanXuat> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newNhaSanXuat.getTen());
            o.setMoTa(newNhaSanXuat.getMoTa());
            o.setNgayTao(newNhaSanXuat.getNgayTao());
            o.setNgayCapNhat(newNhaSanXuat.getNgayCapNhat());
            o.setNguoiTao(newNhaSanXuat.getNguoiTao());
            o.setNguoiCapNhat(newNhaSanXuat.getNguoiCapNhat());
            o.setTrangThai(newNhaSanXuat.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public NhaSanXuat updateTrangThai(Long id) {
        Optional<NhaSanXuat> optional = repository.findById(id);
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
