package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.repository.KichCoRepository;
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
public class KichCoService {
    @Autowired
    private KichCoRepository repository;

    public List<KichCo> getAll() {
        return repository.findAll();
    }

    public KichCo add(KichCo kichCo) {
        kichCo.setNgayTao(new Date());
        kichCo.setNgayCapNhat(null);
        kichCo.setNguoiTao("Nguyễn Bá Đăng");
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

    public Page<KichCo> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 10, Sort.by(Sort.Direction.DESC, "ngayTao"));
        return repository.findAll(pageable);
    }

    public List<KichCo> searchKichCo(String keyword){
        return repository.searchKichCo(keyword);
    }

    public Page<KichCo> searchKichCo(String keyword, Integer pageNo){
        List list = repository.searchKichCo(keyword);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        Integer start = (int) pageable.getOffset();

        Integer end = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size() : pageable.getOffset() + pageable.getPageSize());

        list = list.subList(start, end);

        return new PageImpl<KichCo>(list, pageable, searchKichCo(keyword).size());
    }
}
