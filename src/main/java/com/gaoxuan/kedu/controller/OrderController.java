package com.gaoxuan.kedu.controller;

import com.gaoxuan.kedu.pojo.Order;
import com.gaoxuan.kedu.service.OrderItemService;
import com.gaoxuan.kedu.service.OrderService;
import com.gaoxuan.kedu.service.UserService;
import com.gaoxuan.kedu.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderItemService orderItemService;
	@Autowired
	UserService userService;

	@RequestMapping("admin_order_list")
	public String list(Model model, Page page) {
		PageHelper.offsetPage(page.getStart(), page.getCount());
		List<Order> os = orderService.list();
		int total = (int) new PageInfo<>(os).getTotal();
		page.setTotal(total);
		orderItemService.fill(os);
		model.addAttribute("os", os);
		model.addAttribute("page", page);
		return "admin/listOrder";
	}

	@RequestMapping("admin_order_delivery")
	public String delivery(Order o) throws IOException {
		o.setDeliveryDate(new Date());
		o.setStatus(OrderService.waitConfirm);
		orderService.update(o);
		return "redirect:admin_order_list";
	}

	@RequestMapping("selectOrderCode")
	public String selectOrderNumber(Model model, String orderCode,Page page) {
		PageHelper.offsetPage(page.getStart(), page.getCount());
		List<Order> orders=new ArrayList<>();
		orders.add(orderService.getByid(orderCode));
		if(orders.isEmpty()){
			model.addAttribute("orders",orders);
			return "admin/listOrder";
		}
		int total = (int) new PageInfo<>(orders).getTotal();
		page.setTotal(total);
		orderItemService.fill(orders);
		model.addAttribute("orders", orders);
		model.addAttribute("page", page);
		return "admin/listOrder";
	}
	@RequestMapping("selectOrderDate")
	public String selectOrderDate(Model model, String startDate,String endDate) {
//		PageHelper.offsetPage(page.getStart(), page.getCount());
		List<Order> orders=orderService.list(startDate,endDate);
		if(orders.isEmpty()){
			model.addAttribute("orders",orders);
			return "admin/listOrder";
		}
//		int total = (int) new PageInfo<>(orders).getTotal();
//		page.setTotal(total);
		orderItemService.fill(orders);
		model.addAttribute("orders", orders);
//		model.addAttribute("page", page);
		return "admin/listOrder";
	}
}