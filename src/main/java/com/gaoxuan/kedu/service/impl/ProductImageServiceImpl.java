package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.ProductImageMapper;
import com.gaoxuan.kedu.pojo.ProductImage;
import com.gaoxuan.kedu.pojo.ProductImageExample;
import com.gaoxuan.kedu.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
 
@Service
public class ProductImageServiceImpl implements ProductImageService {
 
    @Autowired
    ProductImageMapper productImageMapper;
    @Override
    public void add(ProductImage pi) {
        productImageMapper.insert(pi);
    }
 
    @Override
    public void delete(int id) {
        productImageMapper.deleteByPrimaryKey(id);
    }
 
    @Override
    public void update(ProductImage pi) {
        productImageMapper.updateByPrimaryKeySelective(pi);
 
    }
 
    @Override
    public ProductImage get(int id) {
        return productImageMapper.selectByPrimaryKey(id);
    }
 
    @Override
    public List list(int pid, String type) {
        ProductImageExample example =new ProductImageExample();
        ProductImageExample.Criteria criteria = example.createCriteria()
                .andPidEqualTo(pid)
                .andTypeEqualTo(type);
        example.setOrderByClause("id asc");
        return productImageMapper.selectByExample(example);
    }
    @Override
    public ProductImage selectByPID(int pid){
        return productImageMapper.selectByPID(pid);
    }
}