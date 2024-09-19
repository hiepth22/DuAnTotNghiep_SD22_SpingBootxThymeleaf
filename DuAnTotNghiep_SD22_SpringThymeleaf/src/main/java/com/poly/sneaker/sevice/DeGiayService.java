package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.repository.DeGiayRepository;
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
public class DeGiayService {
    @Autowired
    private DeGiayRepository repository;

    public List<DeGiay> getAll() {
        return repository.findAll();
    }

    public DeGiay add(DeGiay deGiay) {
        deGiay.setNgayTao(new Date());
        deGiay.setNgayCapNhat(null);
        deGiay.setNguoiTao("Nguyễn Bá Đăng");
        return repository.save(deGiay);
    }

    public DeGiay finById(Long id) {
        Optional<DeGiay> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public DeGiay deleteById(Long id) {
        Optional<DeGiay> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public DeGiay update(Long id, DeGiay newDeGiay) {
        Optional<DeGiay> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newDeGiay.getTen());
            o.setNgayTao(newDeGiay.getNgayTao());
            o.setNgayCapNhat(newDeGiay.getNgayCapNhat());
            o.setNguoiTao(newDeGiay.getNguoiTao());
            o.setNguoiCapNhat(newDeGiay.getNguoiCapNhat());
            o.setTrangThai(newDeGiay.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public DeGiay updateTrangThai(Long id) {
        Optional<DeGiay> optional = repository.findById(id);
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

    public List<DeGiay> getDeGiay(){
        return repository.getDeGiay();
    }

    public Page<DeGiay> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 10, Sort.by(Sort.Direction.DESC, "ngayTao"));
        return repository.findAll(pageable);
    }

    public List<DeGiay> searchDeGiay(String keyword){
        return repository.searchDeGiay(keyword);
    }

    public Page<DeGiay> searchDeGiay(String keyword, Integer pageNo){
        List list = repository.searchDeGiay(keyword);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        Integer start = (int) pageable.getOffset();

        Integer end = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size() : pageable.getOffset() + pageable.getPageSize());

        list = list.subList(start, end);

        return new PageImpl<DeGiay>(list, pageable, searchDeGiay(keyword).size());
    }
}
