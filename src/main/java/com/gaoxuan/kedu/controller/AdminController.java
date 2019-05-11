package com.gaoxuan.kedu.controller;

import com.gaoxuan.kedu.pojo.Admin;
import com.gaoxuan.kedu.service.AdminService;
import com.gaoxuan.kedu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
public class AdminController {

	@Autowired
	AdminService adminService;
	@Autowired
	OrderService orderService;

	@RequestMapping("adminlogin")
	public String login(Model model, HttpSession session,
						@RequestParam("name") String name, @RequestParam("password") String password) {

		Admin admin = adminService.get(name, password);
		if (admin == null) {
			model.addAttribute("msg", "用户名或密码错误，请重新输入");
			return "admin/adminLogin";
		}
		session.setAttribute("admin", admin);
		return "forward:/admin_category_list";
	}

	@RequestMapping("adminLoginPage")
	public String loginPage(Model model) {

		return "admin/adminLogin";
	}

	@RequestMapping("admin_statistics_list")
	public String admin_statistics_list(){
		List os=orderService.listByMonth(5);
		System.out.println(os.size());
		return "admin/listStatistics";
	}
}
