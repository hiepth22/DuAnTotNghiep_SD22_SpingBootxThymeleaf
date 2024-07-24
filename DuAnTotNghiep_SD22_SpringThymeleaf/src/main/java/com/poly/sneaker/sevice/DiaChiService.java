package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.entity.KhachHang;
import com.poly.sneaker.repository.DiaChirepository;
import com.poly.sneaker.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

    public DiaChi setDiaChi(Long idKh){
        return diaChirepository.setDiaChi(idKh);
    }
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
    public DiaChi add(DiaChi dc){
        dc.setIdKH(dc.getIdKH());
        return diaChirepository.save(dc);
    }
    public DiaChi findById(Long id) {
        Optional<DiaChi> optional = diaChirepository.findById(id);
        return optional.map(o -> o).orElse(null);
    }
}
