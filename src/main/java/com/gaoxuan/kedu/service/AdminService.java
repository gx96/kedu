package com.gaoxuan.kedu.service;

import com.gaoxuan.kedu.pojo.Admin;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
    Admin get(int id);
    Admin get(String name,String password);
}
