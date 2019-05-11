package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.OrderItemMapper;
import com.gaoxuan.kedu.pojo.Order;
import com.gaoxuan.kedu.pojo.OrderItem;
import com.gaoxuan.kedu.pojo.OrderItemExample;
import com.gaoxuan.kedu.pojo.Product;
import com.gaoxuan.kedu.service.OrderItemService;
import com.gaoxuan.kedu.service.ProductService;
import com.gaoxuan.kedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
 
@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ProductService productService;
    @Autowired
	UserService userService;
 
    @Override
    public void add(OrderItem c) {
        orderItemMapper.insert(c);
    }
 
    @Override
    public void delete(int id) {
        orderItemMapper.deleteByPrimaryKey(id);
    }
 
    @Override
    public void update(OrderItem c) {
        orderItemMapper.updateByPrimaryKeySelective(c);
    }
 
    @Override
    public OrderItem get(int id) {
        OrderItem result = orderItemMapper.selectByPrimaryKey(id);
        setProduct(result);
        return result;
    }
 
    public List<OrderItem> list(){
        OrderItemExample example =new OrderItemExample();
        example.setOrderByClause("id asc");
        return orderItemMapper.selectByExample(example);
 
    }
 
    @Override
    public void fill(List<Order> os) {
        for (Order o : os) {
            fill(o);
			o.setUser(userService.get(o.getUid()));
        }
    }
 
    public void fill(Order o) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andOidEqualTo(o.getId());
        example.setOrderByClause("id asc");
        List<OrderItem> ois =orderItemMapper.selectByExample(example);
        setProduct(ois);
 
        float total = 0;
        int totalNumber = 0;
        for (OrderItem oi : ois) {
            total+=oi.getNumber()*oi.getProduct().getPromotePrice();
            totalNumber+=oi.getNumber();
        }
        o.setTotal(total);
        o.setTotalNumber(totalNumber);
        o.setOrderItems(ois);
 
    }
 
    public void setProduct(List<OrderItem> ois){
        for (OrderItem oi: ois) {
            setProduct(oi);
        }
    }
 
    private void setProduct(OrderItem oi) {
        Product p = productService.get(oi.getPid());
        oi.setProduct(p);
    }
 
    @Override
    public int getSaleCount(int pid) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andPidEqualTo(pid);
        List<OrderItem> ois =orderItemMapper.selectByExample(example);
        int result =0;
        for (OrderItem oi : ois) {
            result+=oi.getNumber();
        }
        return result;
    }
    @Override
    public List<OrderItem> listByUser(int uid) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andUidEqualTo(uid).andOidIsNull();
        List<OrderItem> result =orderItemMapper.selectByExample(example);
        setProduct(result);
        return result;
    }

    @Override
    public List<OrderItem> listByOid(int oid) {
        OrderItemExample example =new OrderItemExample();
        System.out.println(oid);
        example.createCriteria().andOidEqualTo(oid);
        System.out.println(oid);
        List<OrderItem> result =orderItemMapper.selectByExample(example);
        System.out.println(result);
        setProduct(result);
        return result;
    }
    @Override
	public List listByMonth(int month){
    	return orderItemMapper.selectByMonth(month);
	}
}