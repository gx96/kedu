package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.PropertyMapper;
import com.gaoxuan.kedu.pojo.Category;
import com.gaoxuan.kedu.pojo.Product;
import com.gaoxuan.kedu.pojo.Property;
import com.gaoxuan.kedu.pojo.PropertyExample;
import com.gaoxuan.kedu.service.CategoryService;
import com.gaoxuan.kedu.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import java.util.List;
 
@Service
public class PropertyServiceImpl implements PropertyService {
    @Autowired
    PropertyMapper propertyMapper;
 
    @Override
    public void add(Property p) {
        propertyMapper.insert(p);
    }
 
    @Override
    public void delete(int id) {
        propertyMapper.deleteByPrimaryKey(id);
    }
 
    @Override
    public void update(Property p) {
        propertyMapper.updateByPrimaryKeySelective(p);
    }
 
    @Override
    public Property get(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }
 
    @Override
    public List list(int cid) {
        PropertyExample example =new PropertyExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        return propertyMapper.selectByExample(example);
    }
 
}