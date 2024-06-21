package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.HoaDonChiTiet;
import com.poly.sneaker.repository.HoaDonChiTietRepository;
import com.poly.sneaker.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class HoaDonChiTietService {
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

//    @Autowired
//    private SanPhamChiTietRepository sanPhamChiTietRepository;
//    @Autowired
//    private HoaDonRepository hoaDonRepository;
//
//    public HoaDonChiTiet addHoaDonChiTiet (HoaDonChiTiet hoaDonChiTiet) {
//        return hoaDonChiTietRepository.save(hoaDonChiTiet);
//    }
//
//    public List<HoaDonChiTietCustom> getAllByHoaDonId(Long hoaDonId) {
//        List<Object[]> results = hoaDonChiTietRepository.findByHoaDonId(hoaDonId);
//
//        return results.stream().map(result -> {
//            Long id = (Long) result[0];
//            String tenAnh = (String) result[1];
//            String tenSanPham = (String) result[2];
//            String kichCo = (String) result[3];
//            String mauSac = (String) result[4];
//            Integer soLuong = (Integer) result[5];
//            int soLuongValue = (soLuong != null) ?  soLuong : 0;
//            BigDecimal gia = (BigDecimal) result[6];
//            return new HoaDonChiTietCustom(id, tenAnh, tenSanPham, kichCo, mauSac, soLuongValue, gia);
//        }).collect(Collectors.toList());
//    }
//
//
//    public HoaDonChiTiet addSPToHDCT(HoaDonChiTiet hdct, Long id) {
//        Optional<HoaDon> getHDByID = hoaDonRepository.findById(id);
//        Optional<SanPhamChiTiet> getSPbyID = sanPhamChiTietRepository.findById(hdct.getSanPhamChiTiet().getId());
////        Long sanPhamChiTietId = hoaDonChiTietRepository.findBySanPhamCTId(hdct.getSanPhamChiTiet().getId());
////        if(!sanPhamChiTietId.equals(id)) {
//
//        HoaDon hoaDon = getHDByID.get();
//        SanPhamChiTiet sanPhamChiTiet = getSPbyID.get();
//
//        HoaDonChiTiet hdctChiTiet = new HoaDonChiTiet();
//        hdctChiTiet.setSoLuong(hdct.getSoLuong());
//        hdctChiTiet.setGia(hdct.getGia());
//        hdctChiTiet.setSanPhamChiTiet(sanPhamChiTiet);
//        hdctChiTiet.setHoaDon(hoaDon);
//        hdctChiTiet.setTrangThai(hdct.getTrangThai());
//        return hoaDonChiTietRepository.save(hdctChiTiet);
////        }
////        return null;
//    }


    public HoaDonChiTiet updateSoLuongSanPham(HoaDonChiTiet hdct, Long id){
        Optional<HoaDonChiTiet> getHDByID = hoaDonChiTietRepository.findById(id);
        int soluong = 1;
        hdct.setSoLuong(soluong);
        return hoaDonChiTietRepository.save(hdct);
    }
}
