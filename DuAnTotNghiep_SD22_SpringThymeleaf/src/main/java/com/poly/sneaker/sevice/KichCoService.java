package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.repository.KichCoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class KichCoService {
    @Autowired
    private KichCoRepository repository;

    public List<KichCo> getAll() {
        return repository.findAll();
    }

    public KichCo add(KichCo kichCo) {
        kichCo.setNgayTao(new Date());
        kichCo.setNgayCapNhat(null);
        kichCo.setNguoiTao("admin");
        return repository.save(kichCo);
    }

    public KichCo finById(Long id) {
        Optional<KichCo> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public KichCo deleteById(Long id) {
        Optional<KichCo> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public KichCo update(Long id, KichCo newKichCo) {
        Optional<KichCo> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newKichCo.getTen());
            o.setNgayTao(newKichCo.getNgayTao());
            o.setNgayCapNhat(newKichCo.getNgayCapNhat());
            o.setNguoiTao(newKichCo.getNguoiTao());
            o.setNguoiCapNhat(newKichCo.getNguoiCapNhat());
            o.setTrangThai(newKichCo.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public KichCo updateTrangThai(Long id) {
        Optional<KichCo> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(0);
            return repository.save(o);
        }).orElse(null);
    }

    public Boolean existingById(Long id) {
        return repository.existsById(id);
    }

    public List<KichCo> getKichCo(){
        return repository.getKichCo();
    }

    public Boolean existingByTen(String ten) {
        return repository.findByTen(ten).size() > 0;
    }
}
