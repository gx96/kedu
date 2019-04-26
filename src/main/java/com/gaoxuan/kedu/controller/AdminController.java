package com.gaoxuan.kedu.controller;

import com.gaoxuan.kedu.pojo.Admin;
import com.gaoxuan.kedu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class AdminController {

    @Autowired
    AdminService adminService;
    @RequestMapping("adminlogin")
    public String login(Model model, HttpSession session,
                        @RequestParam("name") String name,@RequestParam("password") String password){

        Admin admin=adminService.get(name,password);
        if(admin==null){
            model.addAttribute("msg","用户名或密码错误，请重新输入");
            return "admin/adminLogin";
        }
        session.setAttribute("admin",admin);
        System.out.println(admin.getName());
        return "redirect:admin_category_list";
    }
    @RequestMapping("adminLoginPage")
    public String loginPage(Model model){
        return "admin/adminLogin";
    }
}
