package com.poly.sneaker.controller.ClienController;

import com.poly.sneaker.dto.SanPhamBanChayDTO;
import com.poly.sneaker.dto.SanPhamChiTietDTO;
import com.poly.sneaker.entity.*;
import com.poly.sneaker.repository.*;
import com.poly.sneaker.sevice.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
public class ClienController {
    @Autowired
    private DiaChiService diaChiService;
    @Autowired
    private SanPhamChiTietRepository repo;
    @Autowired
    private SanPhamChiTietService SPCTservice;

    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Autowired
    private HoaDonChiTietRepository hdctrepo;
    @Autowired
    GioHangChiTietService  gioHangChiTietService;
    @Autowired
    private GioHangRepository ghrepo;
    @Autowired
    GiohangService giohangService;
    @Autowired
    private DiaChirepository diaChiRepository;
    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;
    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("/Client")
    public String hienThiSanPham(Model model) {
        List<SanPhamChiTiet> sanPhams = SPCTservice.getAll();
        model.addAttribute("sanPhams", sanPhams);
        return "client/viewClient";
    }
    @GetMapping("/giohangNoLogin")
    public String giohangNoLogin(Model model) {

        return "client/giohangNoLogin";
    }
    @GetMapping("/TraCuuDonHang")
    public String TraCuuDonHang(Model model) {
        return "client/TraCuuDonHang";
    }
    @GetMapping("/shop")
    public String hienThiSanPhamall(Model model) {
        List<SanPhamChiTiet> sanPhams = SPCTservice.getAll();
        Map<Long, SanPhamChiTiet> lstsp = new HashMap<>();
        for (SanPhamChiTiet spct : sanPhams) {
            Long idSanPham = spct.getSanPham().getId();
            lstsp.put(idSanPham, spct);
        }
        List<SanPhamChiTiet> uniqueSanPhams = new ArrayList<>(lstsp.values());
       
        model.addAttribute("sanPhams", uniqueSanPhams);
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
        SanPhamChiTietDTO sanPhamChiTiet = SPCTservice.getSanPhamChiTietById(sanPhamId);
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
        List<String> uniqueKichCoList = new ArrayList<>(uniqueKichCoSet);
        System.out.println(uniqueKichCoList);
        if (!kichCoList.isEmpty()) {
            return ResponseEntity.ok(uniqueKichCoList);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/kichco/{idSanPham}")
    public ResponseEntity<List<String>> getDetails(
            @PathVariable Long idSanPham,
            @RequestParam String anh

    ) {
        String decodedAnh = URLDecoder.decode(anh, StandardCharsets.UTF_8);
        System.out.println(decodedAnh);
        List<String> details = repo.findKichCoBySanPhamIdAndImageName(idSanPham, decodedAnh);
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
    @GetMapping("/gia-ban/{idSanPham}/{ten}")
    @ResponseBody
    public List<Double> getGiaBan(
            @PathVariable Long idSanPham,
            @PathVariable String ten,
            @RequestParam String anh) {
        String decodedAnh = URLDecoder.decode(anh, StandardCharsets.UTF_8);
        return repo.findGiaBan(idSanPham, ten, decodedAnh);
    }
    @GetMapping("/SLton/{idSanPham}/{size}")
    @ResponseBody
    public List<Integer> getSL(
            @PathVariable Long idSanPham,
            @PathVariable String size,
            @RequestParam String anh) {
        String decodedAnh = URLDecoder.decode(anh, StandardCharsets.UTF_8);
        return repo.findSoLuong(idSanPham, decodedAnh,size );
    }


    @GetMapping("/san-pham-moi-nhat")
    public ResponseEntity<Map<String, Object>> getTop12NewestProducts(Pageable pageable) {
        List<SanPhamChiTiet> sanPhams = SPCTservice.getAll();

        Map<Long, SanPhamChiTiet> lstsp = new HashMap<>();
        for (SanPhamChiTiet spct : sanPhams) {
            Long idSanPham = spct.getSanPham().getId();
            lstsp.put(idSanPham, spct);
        }

        List<SanPhamChiTiet> uniqueSanPhams = new ArrayList<>(lstsp.values());
        LocalDate today = LocalDate.now();
        LocalDate oneMonthAgo = today.minusMonths(1);

        List<SanPhamChiTiet> filteredSanPhams = uniqueSanPhams.stream()
                .filter(sp -> {
                    LocalDate ngayTao = convertToLocalDate(sp.getSanPham().getNgayTao());
                    return !ngayTao.isBefore(oneMonthAgo) && !ngayTao.isAfter(today);
                })
                .collect(Collectors.toList());


        Map<String, Object> response = new HashMap<>();
        response.put("sanPham", filteredSanPhams);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    private LocalDate convertToLocalDate(Date date) {
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    @GetMapping("/san-pham-ban-chay")
    public ResponseEntity<Map<String, Object>> getTop12SanPhamBanChay(Pageable pageable) {
        List<SanPhamBanChayDTO> spmn = hoaDonRepository.getSanPhamBanChayNhat(pageable);

        Map<String, Object> response = new HashMap<>();
        response.put("sanPham", spmn);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }


    @GetMapping("/detailcheckgh/{idkh}/{size}/{idsp}/{sl}")
public ResponseEntity<Map<String, Object>> detail(@PathVariable("idkh") Long idkh,
                                                  @RequestParam String anhlayve,
                                                  @PathVariable("size") String size,
                                                  @PathVariable("idsp") Long idsp,
                                                  @PathVariable("sl") Integer sl) {

    GioHang gh = giohangService.detail(idkh);
    String anh = URLDecoder.decode(anhlayve, StandardCharsets.UTF_8);
    if (gh == null) {
        GioHang ghnew = new GioHang();
        KhachHang kh = new KhachHang();
        kh.setId(idkh);
        ghnew.setKhachHang(kh);
        ghrepo.save(ghnew);

        gh = giohangService.detail(idkh);
    }


    GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
    gioHangChiTiet.setGioHang(gh);
    gioHangChiTiet.setSoLuong(sl);
    SanPhamChiTiet sp = repo.findidspct(idsp, anh, size);
    Long checkgh=ghrepo.selectIDGH(idkh);
    List<SanPhamChiTiet> checksp =gioHangChiTietRepository.findDetailsBySanPhamIdAndGioHangId(sp.getId(),checkgh);
    System.out.println(checksp);
    if(checksp.isEmpty()){
            gioHangChiTiet.setSanPhamChiTiet(sp);
            gioHangChiTietService.add(gioHangChiTiet);
    }
    else {
        Optional<GioHangChiTiet> ghct = gioHangChiTietRepository.findBySanPhamChiTietId(sp.getId());

        if (ghct.isPresent()) {
            GioHangChiTiet existingGioHangChiTiet = ghct.get();
            Integer slmoi = existingGioHangChiTiet.getSoLuong() + sl;
            gioHangChiTietService.updateSL(sp.getId(), slmoi);
        } else {
            return ResponseEntity.badRequest().body(Collections.singletonMap("error", "GioHangChiTiet not found"));
        }

    }
    Map<String, Object> response = new HashMap<>();
    response.put("giỏ_hàng", gh);
    return ResponseEntity.ok(response);
}
    @GetMapping("/san-pham-lienquan/{ten}")
    public ResponseEntity<Map<String, Object>> getSanPhamByThuongHieu(@PathVariable("ten") String ten) {
        List<SanPhamChiTiet> sanPhamList = repo.findByThuongHieu_TenThuongHieu(ten);
        Map<Long, SanPhamChiTiet> lstsp = new HashMap<>();
        for (SanPhamChiTiet spct : sanPhamList) {
            Long idSanPham = spct.getSanPham().getId();
            lstsp.put(idSanPham, spct);
        }

        List<SanPhamChiTiet> uniqueSanPhams = new ArrayList<>(lstsp.values());
        Map<String, Object> response = new HashMap<>();
        response.put("sanPham", uniqueSanPhams);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    @GetMapping("/tra-cuu-hoa-don-chi-tiet/{ma}")
    public ResponseEntity<List<HoaDonChiTiet>> getHoaDonChiTietByMa(@PathVariable String ma) {
        List<HoaDonChiTiet> hoaDonChiTietList = hdctrepo.findByMa(ma);
        if (hoaDonChiTietList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(hoaDonChiTietList, HttpStatus.OK);
    }
    @GetMapping("/tra-cuu-hoa-don/{ma}")
    public ResponseEntity<List<HoaDon>> getHoaDonByMa(@PathVariable String ma) {
        List<HoaDon> hoaDonChiTietList = hoaDonRepository.findByMa(ma);
        if (hoaDonChiTietList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(hoaDonChiTietList, HttpStatus.OK);
    }
    @GetMapping("/checksp/{size}/{idsp}")
    public ResponseEntity<SanPhamChiTiet> checksp(@PathVariable("size") String size,
                                                  @PathVariable("idsp") Long idsp,
                                                  @RequestParam String anhlayve) {

        String anh = URLDecoder.decode(anhlayve, StandardCharsets.UTF_8);
        SanPhamChiTiet sp = repo.findidspct(idsp, anh, size);
        if (sp == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(sp, HttpStatus.OK);
    }

    @PostMapping ("/update-khach-hang-client/{id}")
    public ResponseEntity<?> updateKhachHang(@PathVariable Long id, @RequestBody KhachHang updatedKhachHang) {
        KhachHang existingKhachHang = khachHangService.findById(id);

        if (existingKhachHang == null) {
            return ResponseEntity.notFound().build();
        }

        // Update the existingKhachHang with updatedKhachHang properties
        existingKhachHang.setTen(updatedKhachHang.getTen());
//        existingKhachHang.setSdt(updatedKhachHang.getSdt());
        existingKhachHang.setCccd(updatedKhachHang.getCccd());
        existingKhachHang.setNgaySinh(updatedKhachHang.getNgaySinh());
//        existingKhachHang.setEmail(updatedKhachHang.getEmail());
        existingKhachHang.setGioiTinh(updatedKhachHang.getGioiTinh());

        KhachHang updated = khachHangService.save(existingKhachHang);

        return ResponseEntity.ok(updated);
    }
    @PostMapping ("/update-khach-hang-clientmk/{id}/{mkmoi}")
    public ResponseEntity<?> updateKhachHangmk(@PathVariable Long id,
                                               @PathVariable("mkmoi") String matKhau) {
        KhachHang existingKhachHang = khachHangService.findById(id);

        if (existingKhachHang == null) {
            return ResponseEntity.notFound().build();
        }

        existingKhachHang.setMatKhau(matKhau);

        KhachHang updated = khachHangService.save(existingKhachHang);

        return ResponseEntity.ok(updated);
    }
    @GetMapping("/khach-hang-client/{id}")
    @ResponseBody
    public ResponseEntity<KhachHang> getKhachHang(@PathVariable Long id) {
        KhachHang existingKhachHang = khachHangService.findById(id);

        if (existingKhachHang != null) {
            return ResponseEntity.ok(existingKhachHang);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @PostMapping("/updatemacdinh/{id}")
    public ResponseEntity<Void> updateTrangThai(@PathVariable Long id, @RequestParam int trangThai) {
        try {
            diaChiService.updateTrangThai(id, trangThai);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    @DeleteMapping("/deletediachikh/{id}")
    public ResponseEntity<Void> deleteDiaChi(@PathVariable Long id) {
        try {
            diaChiRepository.deleteById(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace(); 
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    @PostMapping("/adddiachi")
    public ResponseEntity<DiaChi> addDiaChi(@RequestBody DiaChi diaChi) {
        try {
            LocalDateTime now = LocalDateTime.now();


            diaChi.setNgayTao(now);
            diaChi.setNgayCapNhat(now);
            DiaChi savedDiaChi = diaChiRepository.save(diaChi);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedDiaChi); // 201 Created
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/diachiid/{id}")
    public ResponseEntity<DiaChi> getDiaChi(@PathVariable Long id) {

        Optional<DiaChi> optionalDiaChi = diaChiRepository.findById(id);


        if (optionalDiaChi.isPresent()) {
            return ResponseEntity.ok(optionalDiaChi.get());
        } else {

            return ResponseEntity.notFound().build();
        }
    }



}
