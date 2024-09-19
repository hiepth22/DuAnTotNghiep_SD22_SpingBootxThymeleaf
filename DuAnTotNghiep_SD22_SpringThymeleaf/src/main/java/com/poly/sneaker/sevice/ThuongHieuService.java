package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.repository.ThuongHieuRepository;
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
public class ThuongHieuService {
    @Autowired
    private ThuongHieuRepository repository;

    public List<ThuongHieu> getAll() {
        return repository.findAll();
    }

    public ThuongHieu add(ThuongHieu thuongHieu) {
        thuongHieu.setNgayTao(new Date());
        thuongHieu.setNgayCapNhat(null);
        thuongHieu.setNguoiTao("Nguyễn Bá Đăng");
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

    public Page<ThuongHieu> pagination(int pageNo){
        Pageable pageable = PageRequest.of(pageNo - 1, 10, Sort.by(Sort.Direction.DESC, "ngayTao"));
        return repository.findAll(pageable);
    }

    public List<ThuongHieu> searchThuongHieu(String keyword){
        return repository.searchThuongHieu(keyword);
    }

    public Page<ThuongHieu> searchThuongHieu(String keyword, Integer pageNo){
        List list = repository.searchThuongHieu(keyword);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        Integer start = (int) pageable.getOffset();

        Integer end = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size() : pageable.getOffset() + pageable.getPageSize());

        list = list.subList(start, end);

        return new PageImpl<ThuongHieu>(list, pageable, searchThuongHieu(keyword).size());
    }
}
