package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.entity.LichSuHoaDon;
import com.poly.sneaker.entity.PhuongThucThanhToan;
import com.poly.sneaker.repository.PhuongThucThanhToanRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PhuongThucThanhToanService {


    private final PhuongThucThanhToanRepository phuongThucThanhToanRepository;

    public PhuongThucThanhToanService(PhuongThucThanhToanRepository phuongThucThanhToanRepository) {
        this.phuongThucThanhToanRepository = phuongThucThanhToanRepository;
    }

    public PhuongThucThanhToan detail(Long id) {
        Optional<PhuongThucThanhToan> optional = phuongThucThanhToanRepository.findByIdHoaDon(id);
        return optional.map(o -> o).orElse(null);
    }

    public PhuongThucThanhToan updateTrangThaiThanhToan(Long id, PhuongThucThanhToan phuongThucThanhToan) {
        Optional<PhuongThucThanhToan> optional = phuongThucThanhToanRepository.findById(id);
        return optional.map(o -> {
            o.setLoaiThanhToan(phuongThucThanhToan.getLoaiThanhToan());
            return phuongThucThanhToanRepository.save(o);
        }).orElse(null);
    }

}
