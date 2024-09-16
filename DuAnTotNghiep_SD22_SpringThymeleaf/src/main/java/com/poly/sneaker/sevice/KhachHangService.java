package com.poly.sneaker.sevice;

import com.poly.sneaker.dto.KhachHangDTO;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class KhachHangService {
    @Autowired
    private KhachHangRepository khachHangRepository;

//    public Page<KhachHang> getAllPage(int page, int size) {
//        Pageable pageable = PageRequest.of(page, size);
//        return khachHangRepository.findAll(pageable);
//    }
    public List<KhachHang> getAll() {

        return khachHangRepository.findAll();
    }

    public KhachHang Add(KhachHang Nv) {
        return khachHangRepository.save(Nv);
    }

    public KhachHang deleteById(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            khachHangRepository.delete(o);
            return o;
        }).orElse(null);
    }
    public KhachHang save(KhachHang khachHang) {
        return khachHangRepository.save(khachHang);
    }
    public KhachHang update(Long id, KhachHang newnv) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> {
            o.setTen(newnv.getTen());
            o.setMa(newnv.getMa());
            o.setAnh(newnv.getAnh());
            o.setCccd(newnv.getCccd());
            o.setEmail(newnv.getEmail());
            o.setGioiTinh(newnv.getGioiTinh());
//            o.setMatKhau(newnv.getMatKhau());
            o.setNgaySinh(newnv.getNgaySinh());
            o.setSdt(newnv.getSdt());
//            o.setTrangThai(newnv.getTrangThai());
            o.setNgaycapnhap(java.time.LocalDateTime.now());
            return khachHangRepository.save(o);
        }).orElse(null);
    }
    public KhachHang updateTrangThai(Long id, Integer tt) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        if (optional.isPresent()) {
            KhachHang kh = optional.get();
            kh.setTrangThai(tt);
            return khachHangRepository.save(kh);
        } else {
            throw new RuntimeException("Không tìm thấy khách hàng với ID: " + id);
        }
    }
    public KhachHang resetPassword(String mail, String newpw) {
        Optional<KhachHang> optional = khachHangRepository.findByEmail(mail);
        if (optional.isPresent()) {
            KhachHang kh = optional.get();
            kh.setMatKhau(newpw);
            return khachHangRepository.save(kh);
        } else {
            throw new RuntimeException("Không tìm thấy khách hàng với email: " + mail);
        }
    }
    public Boolean existsById(Long id) {
        return khachHangRepository.existsById(id);
    }
    public Boolean trangthai(int tt) {
        return khachHangRepository.findByTrangThai(tt).size() > 0;
    }

    public List<KhachHang> search(String keyword) {
        return khachHangRepository.findByTen(keyword);
    }

    public KhachHang findById(Long id) {
        Optional<KhachHang> optional = khachHangRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }
    public List<KhachHangDTO> loc(String keyword, Optional<Integer> tt,
                                  Integer page_index, Integer page_size, Date startDate, Date endDate ) {
        if (startDate != null && endDate == null) {
            endDate = java.sql.Date.valueOf(LocalDate.now());
        }
        return khachHangRepository.findByKH(keyword, tt,startDate,endDate, page_index, page_size);
    }


    public Page<KhachHang> getKhachHangNoID1(String sdt, Pageable pageable) {
        return khachHangRepository.getKhachHangNoID1(sdt, pageable);
    }


}
