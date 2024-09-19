package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class MauSacService {
    @Autowired
    private MauSacRepository repository;

    public List<MauSac> getAll() {
        return repository.findAll();
    }

    public MauSac add(MauSac mauSac) {
        mauSac.setNgayTao(new Date());
        mauSac.setNgayCapNhat(null);
        mauSac.setNguoiTao("Nguyễn Bá Đăng");
        return repository.save(mauSac);
    }

    public MauSac finById(Long id) {
        Optional<MauSac> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public MauSac deleteById(Long id) {
        Optional<MauSac> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public MauSac update(Long id, MauSac newMauSac) {
        Optional<MauSac> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newMauSac.getTen());
            o.setNgayTao(newMauSac.getNgayTao());
            o.setNgayCapNhat(newMauSac.getNgayCapNhat());
            o.setNguoiTao(newMauSac.getNguoiTao());
            o.setNguoiCapNhat(newMauSac.getNguoiCapNhat());
            o.setTrangThai(newMauSac.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public MauSac updateTrangThai(Long id) {
        Optional<MauSac> optional = repository.findById(id);
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

    public List<MauSac> getMauSac(){
        return repository.getMauSac();
    }

    public Page<MauSac> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 10, Sort.by(Sort.Direction.DESC, "ngayTao"));
        return repository.findAll(pageable);
    }

    public List<MauSac> searchMauSac(String keyword){
        return repository.searchMauSac(keyword);
    }

    public Page<MauSac> searchMauSac(String keyword, Integer pageNo){
        List list = repository.searchMauSac(keyword);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        Integer start = (int) pageable.getOffset();

        Integer end = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size() : pageable.getOffset() + pageable.getPageSize());

        list = list.subList(start, end);

        return new PageImpl<MauSac>(list, pageable, searchMauSac(keyword).size());
    }
}
