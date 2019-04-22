package com.gaoxuan.kedu.service;

import java.util.Map;

/**
 * 生成订单号
 */
public interface WeixinPayService {
    Map createNative(String out_trade_no,String total_fee);
}
