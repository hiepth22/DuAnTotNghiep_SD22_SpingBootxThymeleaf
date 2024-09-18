package com.poly.sneaker.sevice;

import com.poly.sneaker.entity.ChatLieu;
import com.poly.sneaker.repository.ChatLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ChatLieuService {
    @Autowired
    private ChatLieuRepository repository;

    public List<ChatLieu> getAll() {
        return repository.getAll();
    }

    public ChatLieu add(ChatLieu chatLieu) {
        chatLieu.setNgayTao(new Date());
        chatLieu.setNgayCapNhat(null);
        chatLieu.setNguoiTao("admin");
        return repository.save(chatLieu);
    }

    public ChatLieu finById(Long id) {
        Optional<ChatLieu> optional = repository.findById(id);
        return optional.map(o -> o).orElse(null);
    }

    public ChatLieu deleteById(Long id) {
        Optional<ChatLieu> optional = repository.findById(id);
        return optional.map(o -> {
            repository.delete(o);
            return o;
        }).orElse(null);
    }

    public ChatLieu update(Long id, ChatLieu newChatLieu) {
        Optional<ChatLieu> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTen(newChatLieu.getTen());
//            o.setNgayTao(newChatLieu.getNgayTao());
            o.setNgayCapNhat(newChatLieu.getNgayCapNhat());
//            o.setNguoiTao(newChatLieu.getNguoiTao());
            o.setNguoiCapNhat(newChatLieu.getNguoiCapNhat());
            o.setTrangThai(newChatLieu.getTrangThai());

            return repository.save(o);
        }).orElse(null);
    }

    public ChatLieu updateTrangThai(Long id) {
        Optional<ChatLieu> optional = repository.findById(id);
        return optional.map(o -> {
            o.setTrangThai(0);
            return repository.save(o);
        }).orElse(null);
    }

    public Boolean existingById(Long id) {
        return repository.existsById(id);
    }

    public Boolean existingByTen(String ten) {
        return repository.findByTen(ten).size() > 0;
    }


    public List<ChatLieu> getChatLieu(){
        return repository.getChatLieu();
    }
}
