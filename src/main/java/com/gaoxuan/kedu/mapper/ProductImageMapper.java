package com.gaoxuan.kedu.mapper;

import com.gaoxuan.kedu.pojo.ProductImage;
import com.gaoxuan.kedu.pojo.ProductImageExample;
import java.util.List;

public interface ProductImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductImage record);

    int insertSelective(ProductImage record);

    List<ProductImage> selectByExample(ProductImageExample example);

    ProductImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductImage record);

    int updateByPrimaryKey(ProductImage record);
    ProductImage selectByPID(int  pid);
}