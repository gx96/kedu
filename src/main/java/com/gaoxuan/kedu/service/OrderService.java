package com.gaoxuan.kedu.service;

import com.gaoxuan.kedu.pojo.Order;
import com.gaoxuan.kedu.pojo.OrderItem;

import java.util.List;
 
public interface OrderService {
 
    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";
 
    void add(Order c);
 
    void delete(int id);
    void update(Order c);
    Order get(int id);
    Order getByid(String orderCode);
    List list();
    float add(Order c,List<OrderItem> ois);
    List list(int uid, String excludedStatus);

	//按月查出所有已支付订单
	List listByMonth(int month);
	List list(String startDate, String endDate);
}