package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.DiaChi;
import com.poly.sneaker.repository.DiaChirepository;
import com.poly.sneaker.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiaChiService {
    @Autowired
    private DiaChirepository diaChirepository;
    public List<DiaChi> getAll(){
        return diaChirepository.findAll();
    }
    public List<DiaChi> getByID(String idKh){
        return diaChirepository.findByIdKH(idKh);
    }

}
