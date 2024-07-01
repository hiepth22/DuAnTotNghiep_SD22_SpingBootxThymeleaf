package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.entity.NhanVien;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;


    public List<HoaDon> getAll(){
        return hoaDonRepository.findAll();
    }

    public List<HoaDon> getAllbyTrangThai(int trangThai){
        if (trangThai == 0) {
            return hoaDonRepository.findAll();
        } else {
            return hoaDonRepository.findAllbyTrangThai(trangThai);
        }
    }

    public List<HoaDon> findHoaDonByMaAndNgayTaoAndTrangThai(String ma, Date startDate, Date endDate, int trangThai) {
        return hoaDonRepository.findByMaAndNgayTaoBetweenAndTrangThai(ma, startDate, endDate, trangThai);
    }

    public List<HoaDon> findHoaDonByMaAndNgayTao(String ma, Date startDate, Date endDate) {
        return hoaDonRepository.findByMaAndNgayTaoBetween(ma, startDate, endDate);
    }
//    public List<HoaDon> findAllFilter(Date startDate, Date endDate, String ma, String status) {
//        return hoaDonRepository.findAllByNgayTaoBetweenAndMaContainingIgnoreCaseAndTrangThaiContainingIgnoreCase(startDate, endDate, ma, status);
//    }


    public HoaDon add(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    public HoaDon detail(Long id) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }


    public HoaDon updateTrangThai(Long id, HoaDon hoaDon) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(hoaDon.getTrangThai());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDon updateTongTien(Long id, HoaDon hd) {
        Optional<HoaDon> optional = hoaDonRepository.findById(id);
        return optional.map(o -> {
            o.setTongTien(hd.getTongTien());
            o.setTongTienSauGiam(hd.getTongTienSauGiam());
            return hoaDonRepository.save(o);
        }).orElse(null);
    }

    public HoaDonChiTiet updateSoLuong(Long id, HoaDonChiTiet hdct) {
        Optional<HoaDonChiTiet> optional = hoaDonChiTietRepository.findById(id);
        return optional.map(o -> {
            o.setSoLuong(hdct.getSoLuong());
            return hoaDonChiTietRepository.save(o);
        }).orElse(null);
    }




}
