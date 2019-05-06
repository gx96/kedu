package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.AddressMapper;
import com.gaoxuan.kedu.pojo.Address;
import com.gaoxuan.kedu.pojo.AddressExample;
import com.gaoxuan.kedu.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    AddressMapper addressMapper;

    @Override
    public void add(Address address) {
        addressMapper.insert(address);
    }

    @Override
    public void delete(int id) {
        addressMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Address address) {
        addressMapper.updateByPrimaryKey(address);
    }

    @Override
    public List<Address> list(int id) {
        AddressExample example = new AddressExample();
        List<Address> result = addressMapper.selectByExample(example);
        return result;
    }

    @Override
    public Address getById(int id) {
        return addressMapper.selectByPrimaryKey(id);
    }

    @Override
    public Address getByUid(int uid) {
        AddressExample example=new AddressExample();
        example.createCriteria().andUidEqualTo(uid).andStartEqualTo(1);
        List<Address> result=addressMapper.selectByExample(example);
        if(result.isEmpty()){
            return null;
        }
        return result.get(0);
    }

    @Override
    public void updateDefault(int uid) {
        addressMapper.updateDefault(uid);
    }

}
