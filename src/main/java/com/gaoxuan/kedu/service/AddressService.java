package com.gaoxuan.kedu.service;

import com.gaoxuan.kedu.pojo.Address;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AddressService {
    void add(Address address);
    void delete(int id);
    void update(Address address);
    List<Address> list(int uid);
    Address getById(int id);
    Address getByUid(int uid);
    void updateDefault(int uid);

}
