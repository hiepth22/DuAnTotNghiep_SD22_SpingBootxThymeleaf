package com.poly.sneaker.api;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.entity.MauSac;
import com.poly.sneaker.sevice.ChatLieuService;
import com.poly.sneaker.sevice.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api/mau-sac")
public class MauSacAPI {

    @Autowired
    private MauSacService mauSacService;

    @GetMapping("/all")
    public ResponseEntity<List<MauSac>> getAllChatLieu() {
        List<MauSac> mauSacs = mauSacService.getAll();
        return ResponseEntity.ok(mauSacs);
    }

}
