package com.poly.sneaker.controller.SanPham;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.sevice.ChatLieuService;
import com.poly.sneaker.sevice.CoGiayService;
import com.poly.sneaker.sevice.DeGiayService;
import com.poly.sneaker.sevice.KichCoService;
import com.poly.sneaker.sevice.MauSacService;
import com.poly.sneaker.sevice.NhaSanXuatService;
import com.poly.sneaker.sevice.SanPhamChiTietService;
import com.poly.sneaker.sevice.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class SanPhamController {

    @Autowired
    private SanPhamService service;

    @Autowired
    private SanPhamChiTietService SPCTservice;

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

    @GetMapping("/san-pham")
    public String hienThiSanPham(Model model,
                                 @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                 @Param("keyword") String keyword) {
        Page<SanPham> sanPhams = this.sanPhamService.pagination(pageNo);
        Map<Long, Integer> soLuongMap = new HashMap<>();

        for (SanPham sanPham : sanPhams) {
            int soLuong = SPCTservice.countBySanPhamId(sanPham.getId());
            soLuongMap.put(sanPham.getId(), soLuong);
        }

        if (keyword != null){
            sanPhams = this.sanPhamService.searchSanPham(keyword, pageNo);
            model.addAttribute("keyword", keyword);
        }

        model.addAttribute("totalPage",sanPhams.getTotalPages());
        model.addAttribute("currentPage",pageNo);
        model.addAttribute("sanPhams", sanPhams);
        model.addAttribute("soLuongMap", soLuongMap);

        model.addAttribute("hasResultSP", sanPhams.getTotalElements() > 0);

        return "/admin/SanPham/sanPhamPage";
    }



//    @GetMapping("/san-pham/{sanPhamId}")
//    public String hienThiSanPhamChiTiet(@PathVariable("sanPhamId") Long sanPhamId,
//                                        Model model,
//                                        @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo) {
//        Page<SanPhamChiTiet> sanPhamChiTiets = SPCTservice.paginationBySanPhamId(sanPhamId, pageNo);
//        List<DeGiay> deGiays = deGiayService.getAll();
//        List<ChatLieu> chatLieus = chatLieuService.getAll();
//        List<CoGiay> coGiays = coGiayService.getAll();
//        List<KichCo> kichCos = kichCoService.getAll();
//
//        model.addAttribute("deGiays", deGiays);
//        model.addAttribute("chatLieus", chatLieus);
//        model.addAttribute("coGiays", coGiays);
//        model.addAttribute("kichCos", kichCos);
//        model.addAttribute("totalPage",sanPhamChiTiets.getTotalPages());
//        model.addAttribute("currentPage",pageNo);
//        model.addAttribute("sanPhamChiTiets", sanPhamChiTiets);
//        model.addAttribute("sanPhamId", sanPhamId);
//        return "/admin/SanPham/sanPhamChiTietPage";
//    }

    @GetMapping("/san-pham/{sanPhamId}")
    public String hienThiSanPhamChiTiet(@PathVariable("sanPhamId") Long sanPhamId,
                                        @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                        @RequestParam(name = "keyword", required = false) String keyword,
                                        @RequestParam(name = "coGiay", required = false) Long coGiayId,
                                        @RequestParam(name = "deGiay", required = false) Long deGiayId,
                                        @RequestParam(name = "chatLieu", required = false) Long chatLieuId,
                                        @RequestParam(name = "kichCo", required = false) Long kichCoId,
                                        @RequestParam(name = "minPrice", required = false) Double minPrice,
                                        @RequestParam(name = "maxPrice", required = false) Double maxPrice,
                                        Model model) {

        Page<SanPhamChiTiet> sanPhamChiTiets = this.SPCTservice.filterAndSearchSanPhamChiTiet(sanPhamId, keyword, coGiayId, deGiayId, chatLieuId, kichCoId, minPrice, maxPrice, pageNo);

        List<DeGiay> deGiays = deGiayService.getAll();
        List<ChatLieu> chatLieus = chatLieuService.getAll();
        List<CoGiay> coGiays = coGiayService.getAll();
        List<KichCo> kichCos = kichCoService.getAll();

        model.addAttribute("deGiays", deGiays);
        model.addAttribute("chatLieus", chatLieus);
        model.addAttribute("coGiays", coGiays);
        model.addAttribute("kichCos", kichCos);
        model.addAttribute("totalPage", sanPhamChiTiets.getTotalPages());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("sanPhamChiTiets", sanPhamChiTiets);
        model.addAttribute("sanPhamId", sanPhamId);

        model.addAttribute("keyword", keyword);
        model.addAttribute("coGiayId", coGiayId);
        model.addAttribute("deGiayId", deGiayId);
        model.addAttribute("chatLieuId", chatLieuId);
        model.addAttribute("kichCoId", kichCoId);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);

        model.addAttribute("hasResults", sanPhamChiTiets.getTotalElements() > 0);

        return "/admin/SanPham/sanPhamChiTietPage";
    }





    @GetMapping("/san-pham/{sanPhamId}/update/{id}")
    public String updateSanPhamChiTiet(@PathVariable("sanPhamId") Long sanPhamId, @PathVariable("id") Long id, Model model) {
        SanPhamChiTiet sanPhamChiTiet = SPCTservice.findById(id);
        List<SanPham> sanPhams = sanPhamService.getAll();
        List<DeGiay> deGiays = deGiayService.getAll();
        List<NhaSanXuat> nhaSanXuats = nhaSanXuatService.getAll();
        List<ChatLieu> chatLieus = chatLieuService.getAll();
        List<CoGiay> coGiays = coGiayService.getAll();
        List<MauSac> mauSacs = mauSacService.getAll();
        List<KichCo> kichCos = kichCoService.getAll();
        model.addAttribute("sanPhamChiTiet", sanPhamChiTiet);
        model.addAttribute("sanPhams", sanPhams);
        model.addAttribute("deGiays", deGiays);
        model.addAttribute("nhaSanXuats", nhaSanXuats);
        model.addAttribute("chatLieus", chatLieus);
        model.addAttribute("coGiays", coGiays);
        model.addAttribute("mauSacs", mauSacs);
        model.addAttribute("kichCos", kichCos);
        model.addAttribute("sanPhamId", sanPhamId);

        return "admin/SanPham/sanPhamChiTietUpdatePage";
    }

    @PostMapping("/san-pham/{sanPhamId}/update/{id}")
    public String processUpdateSanPhamChiTiet(@PathVariable("sanPhamId") Long sanPhamId,
                                              @PathVariable("id") Long id,
                                              @ModelAttribute("sanPhamChiTiet") SanPhamChiTiet sanPhamChiTiet) {
        SanPhamChiTiet sanPhamChiTietUpdate = SPCTservice.update(id, sanPhamChiTiet);
        return "redirect:/admin/san-pham/" + sanPhamId;
    }
}