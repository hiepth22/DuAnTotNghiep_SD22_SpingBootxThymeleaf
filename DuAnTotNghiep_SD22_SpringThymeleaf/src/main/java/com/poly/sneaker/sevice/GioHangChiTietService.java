package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.GioHangChiTiet;
import com.poly.sneaker.entity.HoaDon;
import com.poly.sneaker.repository.GioHangChiTietRepository;
import com.poly.sneaker.repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GioHangChiTietService {

    @Autowired
    GioHangRepository gioHangRepository;

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;


}
