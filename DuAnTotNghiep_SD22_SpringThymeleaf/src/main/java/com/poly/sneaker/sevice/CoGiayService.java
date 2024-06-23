package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.repository.CoGiayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CoGiayService {
    @Autowired
    private CoGiayRepository repository;

    public List<CoGiay> getAll() {
        return repository.findAll();
    }

    public CoGiay add(CoGiay coGiay) {
        return repository.save(coGiay);
    }

    public CoGiay finById(Long id) {
        Optional<CoGiay> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public CoGiay deleteById(Long id) {
        Optional<CoGiay> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public CoGiay update(Long id, CoGiay newCoGiay) {
        Optional<CoGiay> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newCoGiay.getTen());
            o.setMoTa(newCoGiay.getMoTa());
            o.setNgayTao(newCoGiay.getNgayTao());
            o.setNgayCapNhat(newCoGiay.getNgayCapNhat());
            o.setNguoiTao(newCoGiay.getNguoiTao());
            o.setNguoiCapNhat(newCoGiay.getNguoiCapNhat());
            o.setTrangThai(newCoGiay.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public CoGiay updateTrangThai(Long id) {
        Optional<CoGiay> optional = repository.findById(id);
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
