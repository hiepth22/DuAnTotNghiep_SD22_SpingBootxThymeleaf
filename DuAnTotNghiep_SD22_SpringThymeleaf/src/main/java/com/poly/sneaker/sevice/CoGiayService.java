package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.repository.CoGiayRepository;
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
public class CoGiayService {
    @Autowired
    private CoGiayRepository repository;

    public List<CoGiay> getAll() {
        return repository.findAll();
    }

    public CoGiay add(CoGiay coGiay) {
        coGiay.setNgayTao(new Date());
        coGiay.setNgayCapNhat(null);
        coGiay.setNguoiTao("Nguyễn Bá Đăng");
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

    public List<CoGiay> getCoGiay(){
        return repository.getCoGiay();
    }

    public Page<CoGiay> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 10, Sort.by(Sort.Direction.DESC, "ngayTao"));
        return repository.findAll(pageable);
    }

    public List<CoGiay> searchCoGiay(String keyword){
        return repository.searchCoGiay(keyword);
    }

    public Page<CoGiay> searchCoGiay(String keyword, Integer pageNo){
        List list = repository.searchCoGiay(keyword);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        Integer start = (int) pageable.getOffset();

        Integer end = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size() : pageable.getOffset() + pageable.getPageSize());

        list = list.subList(start, end);

        return new PageImpl<CoGiay>(list, pageable, searchCoGiay(keyword).size());
    }
}
