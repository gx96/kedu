package com.gaoxuan.kedu.service.impl;

import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.gaoxuan.kedu.mapper.UserMapper;
import com.gaoxuan.kedu.pojo.User;
import com.gaoxuan.kedu.pojo.UserExample;
import com.gaoxuan.kedu.service.UserService;
 
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
 
    @Override
    public void add(User u) {
        userMapper.insert(u);
    }
 
    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);
    }
 
    @Override
    public void update(User u) {
        userMapper.updateByPrimaryKeySelective(u);
    }
 
    @Override
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);
    }
 
    public List<User> list(){
        UserExample example =new UserExample();
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
 
    }
    @Override
    public boolean isExist(String name) {
        UserExample example =new UserExample();
        example.createCriteria().andNameEqualTo(name);
        List<User> result= userMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;
 
    }
    @Override
    public User get(String name, String password) {
        UserExample example =new UserExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> result= userMapper.selectByExample(example);
        if(result.isEmpty())
            return null;
        return result.get(0);
    }
}