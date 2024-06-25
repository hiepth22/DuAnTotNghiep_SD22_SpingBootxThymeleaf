package com.poly.sneaker.api;

import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.sevice.HoaDonChiTietService;
import com.poly.sneaker.sevice.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
public class HoaDonAPI {

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;


    @GetMapping("/api/hoa-don")
    public List<HoaDon> hienThiHoaDonApi(@RequestParam(name = "tab", required = false, defaultValue = "0") int tab,
                                         @RequestParam(name = "ma", required = false) String ma,
                                         @RequestParam(name = "startDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                                         @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {

        if (ma != null && startDate != null && endDate != null) {
            return hoaDonService.findHoaDonByMaAndNgayTaoAndTrangThai(ma, startDate, endDate, tab);
        } else {
            return  hoaDonService.getAllbyTrangThai(tab);
        }

    }
}
