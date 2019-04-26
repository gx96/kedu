package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.AdminMapper;
import com.gaoxuan.kedu.pojo.Admin;
import com.gaoxuan.kedu.pojo.AdminExample;
import com.gaoxuan.kedu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin get(int id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public Admin get(String name, String password) {
        AdminExample adminExample=new AdminExample();
        adminExample.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<Admin> result=adminMapper.selectByExample(adminExample);
        if(result.isEmpty()){
            return null;
        }
        return result.get(0);
    }
}
