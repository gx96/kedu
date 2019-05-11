package com.gaoxuan.kedu.mapper;

import com.gaoxuan.kedu.pojo.OrderItem;
import com.gaoxuan.kedu.pojo.OrderItemExample;
import java.util.List;

public interface OrderItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    List<OrderItem> selectByExample(OrderItemExample example);
    List<OrderItem> selectByOid(Integer oid);

    OrderItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);

	//按月查出所有已支付订单
	List<OrderItem> selectByMonth(Integer month);
}