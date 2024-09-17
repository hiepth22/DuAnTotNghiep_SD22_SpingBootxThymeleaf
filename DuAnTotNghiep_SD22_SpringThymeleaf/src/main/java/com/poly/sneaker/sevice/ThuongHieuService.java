package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.repository.ThuongHieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ThuongHieuService {
    @Autowired
    private ThuongHieuRepository repository;

    public List<ThuongHieu> getAll() {
        return repository.findAll();
    }

    public ThuongHieu add(ThuongHieu thuongHieu) {
        thuongHieu.setNgayTao(new Date());
        thuongHieu.setNgayCapNhat(null);
        thuongHieu.setNguoiTao("admin");
        return repository.save(thuongHieu);
    }

    public ThuongHieu finById(Long id) {
        Optional<ThuongHieu> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public ThuongHieu deleteById(Long id) {
        Optional<ThuongHieu> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public ThuongHieu update(Long id, ThuongHieu newThuongHieu) {
        Optional<ThuongHieu> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newThuongHieu.getTen());
            o.setNgayTao(newThuongHieu.getNgayTao());
            o.setNgayCapNhat(newThuongHieu.getNgayCapNhat());
            o.setNguoiTao(newThuongHieu.getNguoiTao());
            o.setNguoiCapNhat(newThuongHieu.getNguoiCapNhat());
            o.setTrangThai(newThuongHieu.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public ThuongHieu updateTrangThai(Long id) {
        Optional<ThuongHieu> optional = repository.findById(id);
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

    public List<ThuongHieu> getThuongHieu(){
        return repository.getThuongHieu();
    }
}
