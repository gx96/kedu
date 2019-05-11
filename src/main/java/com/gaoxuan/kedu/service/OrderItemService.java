package com.gaoxuan.kedu.service;

import com.gaoxuan.kedu.pojo.Order;
import com.gaoxuan.kedu.pojo.OrderItem;

import java.util.List;
 
public interface OrderItemService {
      
    void add(OrderItem c);
 
    void delete(int id);
    void update(OrderItem c);
    OrderItem get(int id);
    List list();

    //按月查出所有已支付订单
 	List listByMonth(int month);
    void fill(List<Order> os);
 
    void fill(Order o);
    
    int getSaleCount(int  pid);
    
    List<OrderItem> listByUser(int uid);
    List<OrderItem> listByOid(int oid);
}