package com.poly.sneaker.controller.PhieuGiamGia;

import com.poly.sneaker.entity.PhieuGiamGia;
import com.poly.sneaker.sevice.PhieuGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
@RequestMapping("/admin")

public class PhieuGiamGiaController {

    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;


    @GetMapping("/phieu-giam-gia")
    public String HienThi(Model model) {
        model.addAttribute("lstPgg", phieuGiamGiaService.getall());
        return "admin/PhieuGiamGia/PhieuGiamGiaIndext";

    }

//    @GetMapping("/search-phieu-giam-gia")
//    public String search(
//            @RequestParam(name = "keyword", required = false) String keyword,
//            @RequestParam(name = "trangThai") Optional<Integer> trangThai,
//            @RequestParam(name = "hinhThucGiam") Optional<Integer> hinhThucGiam,
//            @RequestParam(name = "page_index", required = false) Integer page_index,
//            @RequestParam(name = "page_size", required = false) Integer page_size,
//            @RequestParam(name = "startDate", required = false) Date startDate,
//            @RequestParam(name = "endDate", required = false) Date endDate,
//            Model model
//    ) {
//
//        if (page_index == null || page_index < 1) {
//            page_index = 1;
//        }
//        if (page_size == null || page_size < 1) {
//            page_size = 7;
//        }
//
//        List<PhieuGiamGiaDTO> results = phieuGiamGiaService.loc(keyword, trangThai, hinhThucGiam,
//                (page_index - 1) * page_size, page_size,startDate,endDate);
//
//        List<PhieuGiamGia> lstPgg = new ArrayList<>();
//        for (PhieuGiamGiaDTO pgg : results) {
//            lstPgg.add(new PhieuGiamGia(pgg.getId(),
//                    pgg.getTen(),
//                    pgg.getMa(),
//                    pgg.getSoLuong(),
//                    pgg.getHinhThucGiam(),
//                    pgg.getGiaTriGiam(),
//                    pgg.getDonToiThieu(),
//                    pgg.getGiamToiDa(),
//                    pgg.getNgayBatDau(),
//                    pgg.getNgayKetThuc(),
//                    pgg.getNgayTao(),
//                    pgg.getNgayCapNhat(),
//                    pgg.getNguoiTao(),
//                    pgg.getNguoiCapNhat(),
//                    pgg.getTrangThai()
//
//                    ));
//        }
//
//        model.addAttribute("pgg", lstPgg);
//
//        int totalRows = 0;
//        if (results != null && !results.isEmpty()) {
//            totalRows = results.get(0).getTotalRow();
//        }
//        int totalPages = (int) Math.ceil((double) totalRows / page_size);
//
//        model.addAttribute("totalPage1", totalPages);
//        model.addAttribute("TotalPage", totalRows);
//        model.addAttribute("CurrentPage", page_index);
//
//        return "admin/PhieuGiamGia/PhieuGiamGia";
//    }


    @GetMapping("/addPhieuGiamGia")
    public String PhieuGiamGiaAdd(Model model) {
        model.addAttribute("phieuGiamGia", new PhieuGiamGia());
        return "admin/PhieuGiamGia/PhieuGiamGiaAdd";
    }

    @PostMapping("/SavePhieuGiamGia")
    public String addPhieuGiamGia(@Valid @ModelAttribute("phieuGiamGia") PhieuGiamGia pgg, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
//            PhieuGiamGia pggnew = new PhieuGiamGia();
//            pgg.setMa("VC"+  phieuGiamGiaService.getall().size() );

            return "redirect:/admin/phieu-giam-gia";
        }
//        pgg.setMa(generateMaPhieuGiamGia());
        pgg.setMa(pgg.getMa());
        pgg.setSoLuong(pgg.getSoLuong());
        pgg.setHinhThucGiam(pgg.getHinhThucGiam());
        pgg.setDonToiThieu(pgg.getDonToiThieu());
        pgg.setGiaTriGiam(pgg.getGiaTriGiam());
        pgg.setGiamToiDa(pgg.getGiamToiDa());
        pgg.setNgayBatDau(pgg.getNgayBatDau());
        pgg.setNgayKetThuc(pgg.getNgayKetThuc());

        LocalDate now = LocalDate.now();
        if (now.isBefore(pgg.getNgayBatDau())) {
            pgg.setTrangThai(2); // Chưa diễn ra
        } else if (now.isAfter(pgg.getNgayKetThuc())) {
            pgg.setTrangThai(1); // Ngừng hoạt động
        } else {
            pgg.setTrangThai(0); // Hoạt động
        }

        phieuGiamGiaService.Add(pgg);
        return "redirect:/admin/phieu-giam-gia";
    }


    @GetMapping("/UpdatePhieuGiamGia/{id}")
    public String showEmployeeDetail(@PathVariable("id") Long id, Model model) {
        PhieuGiamGia pgg = phieuGiamGiaService.findById(id);
        model.addAttribute("pgg", pgg);
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }

    @PostMapping("/savePhieuGiamGia/{id}")
    public String updatePhieuGiamGia(@PathVariable("id") Long id, @Valid @ModelAttribute("pgg") PhieuGiamGia pgg, BindingResult result) {
        System.out.println(pgg);
        if (result.hasErrors()) {
            return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
        }
        PhieuGiamGia updatedPgg = phieuGiamGiaService.update(id, pgg);
        if (updatedPgg != null) {
            return "redirect:/admin/phieu-giam-gia";
        }
        return "admin/PhieuGiamGia/PhieuGiamGiaUpdate";
    }

    @PostMapping("/phieu-giam-gia/{id}/delete")
    public ResponseEntity<String> deleteTrangThai(@PathVariable("id") Long id, @RequestBody Map<String, Integer> requestBody) {
        Integer trangThai = requestBody.get("trangThai");

        try {
            phieuGiamGiaService.updateTrangThai(id, trangThai);
            return ResponseEntity.ok("Cập nhật trạng thái phiếu giảm giá thành công");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái phiếu giảm ");
        }
    }


}