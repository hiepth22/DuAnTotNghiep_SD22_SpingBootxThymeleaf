package com.poly.sneaker.controller.SanPham;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.CoGiay;
import com.poly.sneaker.entity.DeGiay;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.entity.NhaSanXuat;
import com.poly.sneaker.entity.SanPham;
import com.poly.sneaker.entity.SanPhamChiTiet;
import com.poly.sneaker.entity.ThuongHieu;
import com.poly.sneaker.sevice.ChatLieuService;
import com.poly.sneaker.sevice.CoGiayService;
import com.poly.sneaker.sevice.DeGiayService;
import com.poly.sneaker.sevice.KichCoService;
import com.poly.sneaker.sevice.MauSacService;
import com.poly.sneaker.sevice.NhaSanXuatService;
import com.poly.sneaker.sevice.SanPhamChiTietService;
import com.poly.sneaker.sevice.SanPhamService;
import com.poly.sneaker.sevice.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin/san-pham-chi-tiet")
public class SanPhamChiTietController {

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

    @Autowired
    private ThuongHieuService thuongHieuService;


    @GetMapping("/add")
    public String addSanPhamChiTiet(
                                    Model model){

        List<SanPham> sanPhams = sanPhamService.getSanPham();
        List<DeGiay> deGiays = deGiayService.getDeGiay();
        List<NhaSanXuat> nhaSanXuats = nhaSanXuatService.getNSX();
        List<ChatLieu> chatLieus = chatLieuService.getChatLieu();
        List<CoGiay> coGiays = coGiayService.getCoGiay();
        List<MauSac> mauSacs = mauSacService.getMauSac();
        List<KichCo> kichCos = kichCoService.getKichCo();
        List<ThuongHieu> thuongHieus = thuongHieuService.getThuongHieu();

        model.addAttribute("sanPhams", sanPhams);
        model.addAttribute("deGiays", deGiays);
        model.addAttribute("nhaSanXuats", nhaSanXuats);
        model.addAttribute("chatLieus", chatLieus);
        model.addAttribute("coGiays", coGiays);
        model.addAttribute("mauSacs", mauSacs);
        model.addAttribute("kichCos", kichCos);
        model.addAttribute("thuongHieus", thuongHieus);

        return "admin/SanPham/sanPhamAddPage";
    }

}
