package com.poly.sneaker.controller.ClienController;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.repository.HoaDonRepository;
import com.poly.sneaker.repository.SanPhamChiTietRepository;
import com.poly.sneaker.repository.SanPhamRepository;
import com.poly.sneaker.sevice.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class ClienController {
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private SanPhamService service;
    @Autowired
    private SanPhamChiTietRepository repo;
    @Autowired
    private SanPhamChiTietService SPCTservice;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private DeGiayService deGiayService;

    @Autowired
    private NhaSanXuatService nhaSanXuatService;

    @Autowired
    private ChatLieuService chatLieuService;

    @Autowired
    private CoGiayService coGiayService;

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private KichCoService kichCoService;

    @GetMapping("/Client")
    public String hienThiSanPham(Model model) {
        List<SanPhamChiTiet> sanPhams = SPCTservice.getAll();
        model.addAttribute("sanPhams", sanPhams);
        return "client/viewClient";
    }
    @GetMapping("/shop")
    public String hienThiSanPhamall(Model model) {
        List<SanPhamChiTiet> sanPhams = SPCTservice.getAll();
        model.addAttribute("sanPhams", sanPhams);
        return "client/shop";
    }
    @GetMapping("/san-pham/{sanPhamId}")
    public String hienThiSanPham (@PathVariable Long sanPhamId ,Model model) {
        SanPhamChiTiet sanPhamChiTiet = SPCTservice.findById1(sanPhamId);
        model.addAttribute("sanPhams", sanPhamChiTiet);
        return "client/SanPhamChiTiet";
    }

    @GetMapping("/sanphamchitietclien/{sanPhamId}")
    @ResponseBody
    public ResponseEntity<?> getProductDetails(@PathVariable Long sanPhamId) {
        SanPhamChiTiet sanPhamChiTiet = SPCTservice.findById1(sanPhamId);
        if (sanPhamChiTiet != null) {
            return ResponseEntity.ok(sanPhamChiTiet);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/sanphamchitietclienkc/{sanPhamId}")
    @ResponseBody
    public ResponseEntity<List<String>> getKichCo(@PathVariable Long sanPhamId) {
        List<String> kichCoList = repo.findKichCoBySanPhamId(sanPhamId);

        if (!kichCoList.isEmpty()) {
            return ResponseEntity.ok(kichCoList);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/sanphamchitietclientanh/{sanPhamId}")
    @ResponseBody
    public ResponseEntity<List<String>> getanh(@PathVariable Long sanPhamId) {
        List<String> kichCoList = repo.findanhBySanPhamId(sanPhamId);
        Set<String> uniqueKichCoSet = new HashSet<>(kichCoList);

        // Chuyển Set trở lại thành List nếu cần
        List<String> uniqueKichCoList = new ArrayList<>(uniqueKichCoSet);

        // In ra danh sách kết quả
        System.out.println(uniqueKichCoList);
        if (!kichCoList.isEmpty()) {
            return ResponseEntity.ok(uniqueKichCoList);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/kichco/{idSanPham}/{anh}")
    public ResponseEntity<List<String>> getDetails(
            @PathVariable Long idSanPham,
            @PathVariable String anh

    ) {
        List<String> details = repo.findKichCoBySanPhamIdAndImageName(idSanPham, anh);
        return ResponseEntity.ok(details);
    }

    @GetMapping("/sanphamchitietclientanhspct/{anh}/{idSanPham}")
    @ResponseBody
    public ResponseEntity<List<Long>> getanhspct(@PathVariable Long anh,
    @PathVariable Long idSanPham) {
        List<Long> list = repo.findIdsByAnhContaining(anh,idSanPham);

        if (!list.isEmpty()) {
            return ResponseEntity.ok(list);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/gia-ban/{idSanPham}/{ten}/{anh}")
    @ResponseBody
    public List<Double> getGiaBan(
            @PathVariable Long idSanPham,
            @PathVariable String ten,
            @PathVariable String anh) {
        return repo.findGiaBan(idSanPham, ten, anh);
    }
    @GetMapping("/SLton/{idSanPham}/{anh}/{size}")
    @ResponseBody
    public List<Integer> getSL(
            @PathVariable Long idSanPham,
            @PathVariable String size,
            @PathVariable String anh) {
        return repo.findSoLuong(idSanPham, anh,size );
    }


    @GetMapping("/san-pham-moi-nhat")
    public ResponseEntity<?> getTop12NewestProducts() {
        Pageable pageable = PageRequest.of(0, 12);
        List<SanPhamChiTiet> spmn = repo.findTop12NamesByNgayTaoDesc(pageable);
        return ResponseEntity.ok(spmn);
    }
    @GetMapping("/san-pham-ban-chay")
    public ResponseEntity<?> getTop12spbanchay() {
        Pageable pageable = PageRequest.of(0, 12);
        List<SanPhamBanChayDTO> spmn = hoaDonRepository.getSanPhamBanChayNhat(pageable);
        return ResponseEntity.ok(spmn);
    }


}
