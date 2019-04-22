package com.gaoxuan.kedu.mapper;

import com.gaoxuan.kedu.pojo.Order;
import com.gaoxuan.kedu.pojo.OrderExample;
import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer id);
    Order selectByOrderCode(String id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}