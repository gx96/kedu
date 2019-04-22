package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.service.WeixinPayService;
import com.gaoxuan.kedu.util.HttpClient;
import com.github.wxpay.sdk.WXPayUtil;
import com.sun.deploy.net.HttpUtils;
import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
@Service
public class WeixinPayServiceImpl implements WeixinPayService {
    @Value("${appid}")
    private String appid;

    @Value("${partner}")
    private String partner;

    @Value("${partnerkey}")
    private String partnerkey;

    @Override
    public Map createNative(String out_trade_no, String total_fee) {
         String appid="wxd898fcb01713c658";
         String mch_id="1527491898";
         String signkey="69177DFF398837C6B02787954526C961";
//        步骤如下
//        1.正式请求地址修改，增加/sandboxnew/
//        2.按正式流程做sign
//        3.用正式sign，额外调用 https://api.mch.weixin.qq.com/sandboxnew/pay/getsignkey 获得sandbox_signkey
//        4.用sandbox_signkey 替换用户自己的key，再做sign签名
//        5.用第二次生成的sign来掉起支付
//        6.发起支付的瞬间就会有回掉通知
        //1.参数封装
        Map<String,String> param=new HashMap<>();
        param.put("appid",appid);//公众账号ID
        param.put("mch_id",mch_id);//商户号
        param.put("nonce_str", WXPayUtil.generateNonceStr());//随机字符串
        param.put("body","zz");//商品描述
        param.put("out_trade_no",out_trade_no);//商户订单号
        param.put("total_fee",total_fee);//标价金额（分）
        param.put("spbill_create_ip","127.0.0.1");//终端IP
        param.put("notify_url","http://www.itcast.cn");//通知地址
        param.put("trade_type","NATIVE");//交易类型
        try {
            String xmlParam = WXPayUtil.generateSignedXml(param,signkey);
            System.out.println("请求的参数："+xmlParam);
            HttpClient keyHttpClient=new HttpClient("https://api.mch.weixin.qq.com/sandboxnew/pay/getsignkey");
            keyHttpClient.setHttps(true);
            keyHttpClient.setXmlParam(xmlParam);
            keyHttpClient.post();
            String keyXML=keyHttpClient.getContent();
            Map<String, String> keyMapResult = WXPayUtil.xmlToMap(keyXML);
            System.out.println("微信返回的结果"+keyMapResult);
            String key=keyMapResult.get("sandbox_signkey");

            xmlParam = WXPayUtil.generateSignedXml(param,key);
            //2.发送请求
            HttpClient httpClient=new HttpClient("https://api.mch.weixin.qq.com/sandboxnew/pay/micropay");
            httpClient.setHttps(true);
            httpClient.setXmlParam(xmlParam);
            httpClient.post();

            //3.获取结果
            String xmlResult=httpClient.getContent();
            Map<String, String> mapResult = WXPayUtil.xmlToMap(xmlResult);
            System.out.println("微信返回的结果"+mapResult);
            Map<String,String> map=new HashMap<>();
            map.put("code_url",mapResult.get("code_url"));//生成支付二维码的链接
            map.put("out_trade_no",out_trade_no);
            map.put("total_fee",total_fee);

            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return new HashMap();
        }
        finally{
            System.out.println(param.size());
        }
    }
}
