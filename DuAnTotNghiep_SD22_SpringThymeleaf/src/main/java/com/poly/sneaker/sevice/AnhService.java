package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.Anh;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.repository.AnhRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AnhService {
    @Autowired
    private AnhRepository repository;

    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    private FileStorageService fileStorageService;

    public List<Anh> getAll() {
        return repository.findAll();
    }

    public Anh add(Anh anh) {
        return repository.save(anh);
    }

    public List<Anh> addAll(List<Anh> anhList) {
        return repository.saveAll(anhList);
    }

    public Anh finById(Long id) {
        Optional<Anh> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public Anh deleteById(Long id) {
        Optional<Anh> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public Anh update(Long id, Anh newAnh) {
        Optional<Anh> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newAnh.getTen());
            o.setUrl(newAnh.getUrl());
            o.setNgayTao(newAnh.getNgayTao());
            o.setNgayCapNhat(newAnh.getNgayCapNhat());
            o.setNguoiTao(newAnh.getNguoiTao());
            o.setNguoiCapNhat(newAnh.getNguoiCapNhat());
            o.setTrangThai(newAnh.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public Anh updateTrangThai(Long id) {
        Optional<Anh> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(0);
            return repository.save(o);
        }).orElse(null);
    }

    public Boolean existingById(Long id) {
        return repository.existsById(id);
    }

    public Boolean existingByTen(String ten) {
        return repository.findByTen(ten).size() > 0;
    }

    public List<Anh> saveMultipleFiles(List<MultipartFile> files, Long sanPhamChiTietId) throws IOException {
        List<Anh> anhList = new ArrayList<>();
        for (MultipartFile file : files) {
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            if (existingByTen(fileName)) {
                continue; // Bỏ qua nếu tên ảnh đã tồn tại
            }

            String url = fileStorageService.storeFile(file);

            // Khởi tạo đối tượng SanPhamChiTiet với id đã cho
            SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();
            sanPhamChiTiet.setId(sanPhamChiTietId);

            Anh anh = Anh.builder()
                    .ten(fileName)
                    .url(url)
                    .trangThai(1)
                    .ngayTao(new Date())
                    .build();
            anhList.add(anh);
        }
        return repository.saveAll(anhList);
    }
}
