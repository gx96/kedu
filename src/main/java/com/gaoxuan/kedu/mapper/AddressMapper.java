package com.gaoxuan.kedu.mapper;

import com.gaoxuan.kedu.pojo.Address;
import com.gaoxuan.kedu.pojo.AddressExample;
import java.util.List;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    List<Address> selectByExample(AddressExample example);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    int updateDefault(Integer uid);
}