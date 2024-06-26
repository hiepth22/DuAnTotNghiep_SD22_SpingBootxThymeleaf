package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.Anh;
import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.DanhMuc;
import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.repository.SanPhamChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SanPhamChiTietService {
    @Autowired
    private SanPhamChiTietRepository repository;

    public List<SanPhamChiTiet> getAll() {
        return repository.findAll();
    }

    public Page<SanPhamChiTiet> getSanPhamChiTietBySanPhamId(Long sanPhamId, int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return repository.findBySanPhamId(sanPhamId, pageable);
    }


    public List<SanPhamChiTiet> getAllSanPham(Long idSP) {
        return repository.findBySanPham(idSP);
    }

    public SanPhamChiTiet add(SanPhamChiTiet sanPhamChiTiet) {
        sanPhamChiTiet.setId(null);
        SanPhamChiTiet spct = repository.findIdLonNhat();
        Long newId = spct.getId() + 1;

        String ma = "SPCT" + newId;
        sanPhamChiTiet.setMa(ma);

        return repository.save(sanPhamChiTiet);
    }



    public SanPhamChiTiet finById(Long id) {
        Optional<SanPhamChiTiet> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public SanPhamChiTiet deleteById(Long id) {
        Optional<SanPhamChiTiet> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public SanPhamChiTiet update(Long id, SanPhamChiTiet newSPCT) {
        Optional<SanPhamChiTiet> optional = repository.findById(id);
        return optional.map(o -> {
            o.setSoLuong(newSPCT.getSoLuong());
            o.setGiaBan(newSPCT.getGiaBan());
            o.setMoTa(newSPCT.getMoTa());
            o.setTrangThai(newSPCT.getTrangThai());
            o.setTen(newSPCT.getTen());
            o.setCanNang(newSPCT.getCanNang());
            o.setNgayTao(newSPCT.getNgayTao());
            o.setNgayCapNhat(newSPCT.getNgayCapNhat());
            o.setNguoiTao(newSPCT.getNguoiTao());
            o.setNguoiCapNhat(newSPCT.getNguoiCapNhat());

            o.setAnh(Anh.builder().id(newSPCT.getAnh().getId()).build());
            o.setSanPham(SanPham.builder().id(newSPCT.getSanPham().getId()).build());
            o.setKichCo(KichCo.builder().id(newSPCT.getKichCo().getId()).build());
            o.setMauSac(MauSac.builder().id(newSPCT.getMauSac().getId()).build());
            o.setDeGiay(DeGiay.builder().id(newSPCT.getDeGiay().getId()).build());
            o.setChatLieu(ChatLieu.builder().id(newSPCT.getChatLieu().getId()).build());
            o.setCoGiay(CoGiay.builder().id(newSPCT.getCoGiay().getId()).build());
            o.setNhaSanXuat(NhaSanXuat.builder().id(newSPCT.getNhaSanXuat().getId()).build());
            o.setDanhMuc(DanhMuc.builder().id(newSPCT.getDanhMuc().getId()).build());

            return repository.save(o);
        }).orElse(null);
    }

    public SanPhamChiTiet updateTrangThai(Long id) {
        Optional<SanPhamChiTiet> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(0);
            return repository.save(o);
        }).orElse(null);
    }

    public Boolean existingById(Long id) {
        return repository.existsById(id);
    }

    public Boolean existingByMa(String ma) {
        return repository.findByMa(ma).size() > 0;
    }

    public List<SanPhamChiTiet> addToList(List<SanPhamChiTiet> sanPhamChiTiets) {
        sanPhamChiTiets.stream().forEach(o -> System.out.println(o));
        return repository.saveAll(sanPhamChiTiets);
    }

<<<<<<< HEAD
=======
//    public int countVariantsBySanPhamId(Long sanPhamId) {
//        return repository.countBySanPhamId(sanPhamId);
//    }

>>>>>>> eba6307b83d574846a13be69f3186107eedd5659
}
