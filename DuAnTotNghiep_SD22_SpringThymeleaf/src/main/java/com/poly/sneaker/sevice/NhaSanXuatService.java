package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.repository.NhaSanXuatRepository;
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
public class NhaSanXuatService {
    @Autowired
    private NhaSanXuatRepository repository;

    public List<NhaSanXuat> getAll() {
        return repository.findAll();
    }

    public NhaSanXuat add(NhaSanXuat nhaSanXuat) {
        nhaSanXuat.setNgayCapNhat(null);
        nhaSanXuat.setNgayTao(new Date());
        nhaSanXuat.setNguoiTao("Nguyễn Bá Đăng");
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

    public List<NhaSanXuat> getNSX(){
        return repository.getNSX();
    }

    public Page<NhaSanXuat> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 10, Sort.by(Sort.Direction.DESC, "ngayTao"));
        return repository.findAll(pageable);
    }

    public List<NhaSanXuat> searchNSX(String keyword){
        return repository.searchNSX(keyword);
    }

    public Page<NhaSanXuat> searchNSX(String keyword, Integer pageNo){
        List list = repository.searchNSX(keyword);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        Integer start = (int) pageable.getOffset();

        Integer end = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size() : pageable.getOffset() + pageable.getPageSize());

        list = list.subList(start, end);

        return new PageImpl<NhaSanXuat>(list, pageable, searchNSX(keyword).size());
    }
}
