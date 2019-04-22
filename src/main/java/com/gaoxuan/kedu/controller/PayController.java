package com.gaoxuan.kedu.controller;

import com.gaoxuan.kedu.service.WeixinPayService;
import com.gaoxuan.kedu.util.IdWorker;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("")
public class PayController {
//    @Reference
//    private WeixinPayService weixinPayService;
    @Autowired
    WeixinPayService weixinPayService;
    @RequestMapping("createNative")
    public String createNative(Model model){
//        IdWorker idWorker=new IdWorker();
//        model.addAttribute("WeChat",weixinPayService.createNative(idWorker.nextId()+"","1"));
        return "fore/alipay";
    }
}
