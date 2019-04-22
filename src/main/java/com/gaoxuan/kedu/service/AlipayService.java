package com.gaoxuan.kedu.service;

import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface AlipayService {
    Map createNative(String out_trade_no, String total_fee);
}
