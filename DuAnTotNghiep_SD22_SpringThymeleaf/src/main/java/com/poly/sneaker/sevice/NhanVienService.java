package com.poly.sneaker.sevice;

import com.poly.sneaker.dto.NhanVienPhanTrang;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class NhanVienService {
    @Autowired
    private NhanVienRepository nhanVienRepository;
    @Autowired
    private JavaMailSender emailSender;

    public List<NhanVien> getallNhanVien() {

        return nhanVienRepository.findAll();
    }
    public NhanVien Add(NhanVien Nv) {
        return nhanVienRepository.save(Nv);
    }

    public NhanVien deleteById(Long id) {
        Optional<NhanVien> optional = nhanVienRepository.findById(id);
        return optional.map(o -> {
            nhanVienRepository.delete(o);
            return o;
        }).orElse(null);
    }

    public NhanVien update(Long id, NhanVien newnv) {
        Optional<NhanVien> optional = nhanVienRepository.findById(id);
        return optional.map(o -> {
            o.setTen(newnv.getTen());
//            o.setMa(newnv.getMa());
            if (newnv.getAnh() == null) {
            } else {
                o.setAnh(newnv.getAnh());
            }
            if (newnv.getDiachi().equals("")) {

            } else {
                o.setDiachi(newnv.getDiachi());
            }
            o.setCccd(newnv.getCccd());
//            o.setEmail(newnv.getEmail());
            o.setGioiTinh(newnv.getGioiTinh());
//            o.setDiachi(newnv.getDiachi());
            o.setNgaySinh(newnv.getNgaySinh());
//            o.setSdt(newnv.getSdt());
            o.setVaiTro(newnv.getVaiTro());
            o.setNgayCapNhat(java.time.LocalDateTime.now());
            return nhanVienRepository.save(o);
        }).orElse(null);
    }

    public NhanVien updateTrangThai(Long id, Integer tt) {
        Optional<NhanVien> optional = nhanVienRepository.findById(id);
        if (optional.isPresent()) {
            NhanVien nhanVien = optional.get();
            nhanVien.setTrangThai(tt);
            return nhanVienRepository.save(nhanVien);
        } else {
            throw new RuntimeException("Không tìm thấy nhân viên với ID: " + id);
        }
    }

    public Boolean existsById(Long id) {
        return nhanVienRepository.existsById(id);
    }

    public Boolean trangthai(int tt) {
        return nhanVienRepository.findByTrangThai(tt).size() > 0;
    }

    public NhanVien findById(Long id) {
        Optional<NhanVien> optional = nhanVienRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public List<NhanVienPhanTrang> loc(String keyword, Optional<Integer> tt, Optional<Integer> vaitro,
                                       Integer page_index, Integer page_size, Date startDate,Date endDate ) {
        if (startDate != null && endDate == null) {
            endDate = java.sql.Date.valueOf(LocalDate.now());
        }
        return nhanVienRepository.findBynv(keyword, tt, vaitro,startDate,endDate, page_index, page_size);
    }
}
