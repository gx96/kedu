package com.gaoxuan.kedu.service;

import com.gaoxuan.kedu.pojo.Product;
import com.gaoxuan.kedu.pojo.PropertyValue;
 
import java.util.List;
 
public interface PropertyValueService {
    void init(Product p);
    void update(PropertyValue pv);
 
    PropertyValue get(int ptid, int pid);
    List<PropertyValue> list(int pid);
}