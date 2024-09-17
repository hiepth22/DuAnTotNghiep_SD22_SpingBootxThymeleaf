package com.poly.sneaker.sevice;

import com.poly.sneaker.dto.DiaChiAdd;
import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.DiaChirepository;
import com.poly.sneaker.repository.KhachHangRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DiaChiService {
    @Autowired
    private DiaChirepository diaChirepository;
    public List<DiaChi> getAll(){
        return diaChirepository.findAll();
    }


    public List<DiaChi> getByID(Long idKh) {
        return diaChirepository.findByIdKH(idKh);
    }

    public List<DiaChi> getKHDESCByID(Long idKh) {
        return diaChirepository.findKHDESCByIdKH(idKh);
    }


    public DiaChi getDiaChiMacDinh(Long idKh) {
        return diaChirepository.getDiaChiMacDinh(idKh);
    }

    @Modifying
    @Transactional
    public int setDiaChi(Long idKh) {
        return diaChirepository.setDiaChi(idKh);
    }

    @Modifying
    @Transactional
    public DiaChi setDiaChi2(Long id){
        return diaChirepository.setDiaChi2(id);
    }

    public DiaChi update(Long id, DiaChi newnv) {
        Optional<DiaChi> optional = diaChirepository.findById(id);
        return optional.map(o -> {
            o.setTen(newnv.getTen());
            o.setMoTaChiTiet(newnv.getMoTaChiTiet());
            o.setThanhPho(newnv.getThanhPho());
            o.setPhuongXa(newnv.getPhuongXa());
            o.setQuanHuyen(newnv.getQuanHuyen());
            o.setSoNha(newnv.getSoNha());
            o.setNgayCapNhat(java.time.LocalDateTime.now());
            return diaChirepository.save(o);
        }).orElse(null);
    }
    public DiaChi add(DiaChiAdd dc){
        if (checkTrangThai(dc.getIdKH())==0) {
            DiaChi newdc = new DiaChi();
            BeanUtils.copyProperties(dc, newdc);
            KhachHang khachHang = new KhachHang();
            khachHang.setId(dc.getIdKH());
            newdc.setIdKH(khachHang);
            newdc.setTrangThai(1);
            System.out.println(khachHang);
            newdc.setThanhPho(dc.getThanhPho());
            newdc.setQuanHuyen(dc.getQuanHuyen());
            newdc.setPhuongXa(dc.getPhuongXa());
            return diaChirepository.save(newdc);
        }else {
            DiaChi newdc = new DiaChi();
            BeanUtils.copyProperties(dc, newdc);
            KhachHang khachHang = new KhachHang();
            khachHang.setId(dc.getIdKH());
            newdc.setIdKH(khachHang);
            newdc.setTrangThai(0);
            System.out.println(khachHang);
            newdc.setThanhPho(dc.getThanhPho());
            newdc.setQuanHuyen(dc.getQuanHuyen());
            newdc.setPhuongXa(dc.getPhuongXa());
            return diaChirepository.save(newdc);
        }

    }
    public Integer checkTrangThai(Long idKhachHang){
        return diaChirepository.checkTrangThai(idKhachHang);

    }
    public DiaChi findById(Long id) {
        Optional<DiaChi> optional = diaChirepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }


    public DiaChi themNhanh(DiaChi diaChi){
        return diaChirepository.save(diaChi);
    }
    @org.springframework.transaction.annotation.Transactional
    public void updateTrangThai(Long diaChiId, int newTrangThai) {
        if (newTrangThai != 1) {
            throw new IllegalArgumentException("Trạng thái mới phải là 1.");
        }

        DiaChi diaChi = diaChirepository.findById(diaChiId)
                .orElseThrow(() -> new RuntimeException("DiaChi not found with id " + diaChiId));

        diaChi.setTrangThai(newTrangThai);
        diaChirepository.save(diaChi);

        KhachHang khachHang = diaChi.getIdKH();

        diaChirepository.updateAllOtherDiaChiToZero(khachHang.getId(), diaChiId);
    }
    @Transactional
    public DiaChi updateDiaChi(Long id, DiaChi diaChiUpdate) {

        DiaChi existingDiaChi = diaChirepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy địa chỉ với ID: " + id));


        existingDiaChi.setThanhPho(diaChiUpdate.getThanhPho());
        existingDiaChi.setQuanHuyen(diaChiUpdate.getQuanHuyen());
        existingDiaChi.setPhuongXa(diaChiUpdate.getPhuongXa());
        existingDiaChi.setSoNha(diaChiUpdate.getSoNha());
        existingDiaChi.setMoTaChiTiet(diaChiUpdate.getMoTaChiTiet());
        existingDiaChi.setTen(diaChiUpdate.getTen());



        // Lưu lại thay đổi
        return diaChirepository.save(existingDiaChi);
    }
}
