package com.poly.sneaker.controller.ClienController;

import com.poly.sneaker.entity.KhachHang;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThongTinKhachHangController {

    @GetMapping("/thong-tin-don-hang")
    public String hienThiGiohang(HttpSession session) {

        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            return "client/GiaoDienKhachHangDangMua";
        }
        return "redirect:/login";
    }

    @GetMapping("/thong-tin-don-hang/{id}")
    public String detail(HttpSession session) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            return "client/HoaDonChiTietKhachHang";
        }
        return "redirect:/login";
    }

    @GetMapping("/thong-tin-tai-khoan")
    public String taiKhoan(HttpSession session) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            return "client/thongTinKhachHang";
        }
        return "redirect:/login";
    }


}
