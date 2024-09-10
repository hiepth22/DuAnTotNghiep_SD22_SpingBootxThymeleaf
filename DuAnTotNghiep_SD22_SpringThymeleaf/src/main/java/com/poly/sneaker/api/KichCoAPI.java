package com.poly.sneaker.api;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.KichCo;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.sevice.ChatLieuService;
import com.poly.sneaker.sevice.KichCoService;
import com.poly.sneaker.sevice.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api/kich-co")
public class KichCoAPI {

    @Autowired
    private KichCoService kichCoService;


    @GetMapping("/all")
    public ResponseEntity<List<KichCo>> getAllChatLieu() {
        List<KichCo> kichCos = kichCoService.getAll();
        return ResponseEntity.ok(kichCos);
    }

}
