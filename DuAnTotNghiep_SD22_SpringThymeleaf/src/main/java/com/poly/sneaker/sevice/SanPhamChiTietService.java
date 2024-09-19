package com.poly.sneaker.sevice;

import com.poly.sneaker.dto.SanPhamChiTietDTO;
import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.SanPhamChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class SanPhamChiTietService {
    @Autowired
    private SanPhamChiTietRepository repository;

    public List<SanPhamChiTiet> getAll() {
        return repository.findAll();
    }
    public SanPhamChiTiet findById1(Long id) {
        Optional<SanPhamChiTiet> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }
    public SanPhamChiTietDTO getSanPhamChiTietById(Long id) {

        return repository.findSanPhamChiTietById(id);
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

    public SanPhamChiTiet findById(Long id) {
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
            o.setTen(newSPCT.getTen());
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
            o.setAnh(newSPCT.getAnh());

            o.setKichCo(KichCo.builder().id(newSPCT.getKichCo().getId()).build());
            o.setMauSac(MauSac.builder().id(newSPCT.getMauSac().getId()).build());
            o.setDeGiay(DeGiay.builder().id(newSPCT.getDeGiay().getId()).build());
            o.setChatLieu(ChatLieu.builder().id(newSPCT.getChatLieu().getId()).build());
            o.setCoGiay(CoGiay.builder().id(newSPCT.getCoGiay().getId()).build());
            o.setNhaSanXuat(NhaSanXuat.builder().id(newSPCT.getNhaSanXuat().getId()).build());

            return repository.save(o);
        }).orElse(null);
    }

    public SanPhamChiTiet updateSL(Long id,Integer sl) {
        Optional<SanPhamChiTiet> optional = repository.findById(id);
        return optional.map(o -> {
            o.setSoLuong(sl);
            return repository.save(o);
        }).orElse(null);
    }

    public Boolean existingById(Long id) {
        return repository.existsById(id);
    }

    public Boolean existingByMa(String ma) {
        return repository.findByMa(ma).size() > 0;
    }

    public List<SanPhamChiTiet> saveToDatabase(List<SanPhamChiTiet> sanPhamChiTiets) {
        for (SanPhamChiTiet sanPhamChiTiet : sanPhamChiTiets) {
            Optional<SanPhamChiTiet> existingSanPhamChiTiet = repository.findByKichCoAndMauSacAndDeGiayAndChatLieuAndTenAndCoGiay(
                    sanPhamChiTiet.getKichCo(),
                    sanPhamChiTiet.getMauSac(),
                    sanPhamChiTiet.getDeGiay(),
                    sanPhamChiTiet.getChatLieu(),
                    sanPhamChiTiet.getTen(),
                    sanPhamChiTiet.getCoGiay()
            );

            if (existingSanPhamChiTiet.isPresent()) {
                SanPhamChiTiet existing = existingSanPhamChiTiet.get();
                existing.setSoLuong(existing.getSoLuong() + sanPhamChiTiet.getSoLuong());
                repository.save(existing);
            } else {
                repository.save(sanPhamChiTiet);
            }
        }
        return repository.findAll();
    }

    public int countBySanPhamId(Long sanPhamId) {
        return repository.countBySanPhamId(sanPhamId);
    }

    public List<SanPhamChiTiet> findBySanPhamId(Long sanPhamId) {
        return repository.findBySanPhamId(sanPhamId);
    }

    public Page<SanPhamChiTiet> paginationBySanPhamId(Long sanPhamId, int pageNo) {
        Pageable pageable = PageRequest.of(pageNo - 1, 10);
        return repository.findBySanPhamId(sanPhamId, pageable);
    }

    public List<SanPhamChiTiet> filterAndSearchSanPhamChiTiet(Long sanPhamId, String keyword, Long coGiayId, Long deGiayId, Long chatLieuId, Long kichCoId, Double minPrice, Double maxPrice){
        return repository.filterAndSearchSPCT(sanPhamId, keyword, coGiayId, deGiayId, chatLieuId, kichCoId, minPrice, maxPrice);
    }

    public Page<SanPhamChiTiet> filterAndSearchSanPhamChiTiet(Long sanPhamId, String keyword, Long coGiayId, Long deGiayId, Long chatLieuId, Long kichCoId, Double minPrice, Double maxPrice, Integer pageNo) {
        List list = repository.filterAndSearchSPCT(sanPhamId, keyword, coGiayId, deGiayId, chatLieuId, kichCoId, minPrice, maxPrice);

        Pageable pageable = PageRequest.of(pageNo - 1, 10);

        int start = (int) pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), list.size());

        list = list.subList(start, end);

        return new PageImpl<>(list, pageable, filterAndSearchSanPhamChiTiet(sanPhamId, keyword, coGiayId,deGiayId,chatLieuId,kichCoId,minPrice,maxPrice).size());
    }



    public SanPhamChiTiet getSPByBarcode(String Barcode) {
        return repository.findSPByBarcode(Barcode);
    }

    public Page<SanPhamChiTiet> searchBlaBla(Long idChatLieu, Long idCoGiay, Long idDeGiay,
                                               Long idKichCo, Long idMauSac, Long idThuongHieu,
                                               String keyword, Double giaBanMin, Double giaBanMax,
                                               Pageable pageable) {
        return repository.findByBlaBla(idChatLieu, idCoGiay, idDeGiay, idKichCo,
                idMauSac, idThuongHieu, keyword, giaBanMin, giaBanMax, pageable);
    }
    public Page<SanPhamChiTiet> findByBlaBlaWithDeduplication(
            Long idChatLieu,
            Long idCoGiay,
            Long idDeGiay,
            Long idKichCo,
            Long idMauSac,
            Long idThuongHieu,
            String keyword,
            Double giaBanMin,
            Double giaBanMax,
            Pageable pageable) {

        // Lấy dữ liệu mà không phân trang
        List<SanPhamChiTiet> allResults = repository.findByBlaBla1(
                idChatLieu, idCoGiay, idDeGiay, idKichCo, idMauSac, idThuongHieu,
                keyword, giaBanMin, giaBanMax, Pageable.unpaged()
        ).getContent();

        // Loại bỏ các sản phẩm trùng lặp dựa trên id của SanPham
        Map<Long, SanPhamChiTiet> uniqueProducts = allResults.stream()
                .collect(Collectors.toMap(
                        sp -> sp.getSanPham().getId(), // Lấy id của SanPham
                        Function.identity(), // Giá trị của map là chính đối tượng SanPhamChiTiet
                        (existing, replacement) -> existing  // Chọn đối tượng mới nếu trùng lặp
                ));


        // Chuyển đổi danh sách kết quả sang danh sách duy nhất
        List<SanPhamChiTiet> uniqueResults = new ArrayList<>(uniqueProducts.values());

        // Phân trang kết quả duy nhất
        int start = (int) pageable.getOffset();
        int end = Math.min(start + pageable.getPageSize(), uniqueResults.size());
        List<SanPhamChiTiet> pagedResults = uniqueResults.subList(start, end);

        // Tạo Page để trả về kết quả phân trang
        return new PageImpl<>(pagedResults, pageable, uniqueResults.size());
    }



}
