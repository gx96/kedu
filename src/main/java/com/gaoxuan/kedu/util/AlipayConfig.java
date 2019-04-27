package com.gaoxuan.kedu.util;
//import java.io.FileWriter;
//import java.io.IOException;

public class AlipayConfig {
    // 商户appid
    public static String APPID = "2016092600598769";
    // 支付宝私钥
    public static String RSA_PRIVATE_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDQtJG02nQyYw75jeJxYAeWSD90SJNfl5FvB7vf+ewBZ7A7z10/g08eyFtD6wa6Vdsk45EkimsPjcDOpTB2EjqQ7SY6oiDpqD/5VKevfrqw09coyBAi8vmDI2OnUMdsOgKinVYe5iJuhuAMd6KhZVJMQ1T0ohygglXQqxPhrWFC49hCESgrUXW7FXPjYfUnnqJhHbb9wFDR7H9dVH5CP53H+5EISYm7b/trGM4kSDStMx257ZJK347XSthkLVdCuYz1K8gkYSPFyt1a/yXy/iOVYBw2DcMDMAH6voYcW/xOlOxvFbO1QiyzFNCIPrqFFLFRYHqP4w1eMrjX1M6j85wrAgMBAAECggEAUbCb56IqIR7M2blDjQT9c0FMNQPDS4NUFZV9YCm+yr3/KSn9YcLP0UizEF6J/51jbYj1YswbI7dkZH4b/dscuWVZtVGIeGy2vaz5BaQhBt2kNf448rUQHNhZRUBFDoOWTHgxIV8K0yBPyhF5wpqaH+eq9SYO9nSNimOsIIVwsHEwjUDCEz325VvMz0R8s8rqx1MfCYDG5jiBXWLoxG1JvJ5KZjU8bnvsX1aP2jRTJ0gxOMhif7OwjusyPVt6IcmDDpJb49AmDgTYI2tqT4YZ65e18cAp5cM/rlVYpV8qrclOwfFIn+P+p1tbjdhRgAuU0K9Qa/Cj95eXnVIaVcl9IQKBgQD+HyvaVTH/0uX78jWvU9t0Z3FViuEuK1AAw+4ht54ASNEOJunYwulte3EidK/QHRwBjoS+LmfB9EaVW71pbIZ+LjuoBb9R8CkAMG8bzotEP6u/t73MT8ssQiT5VGo8TVN1m28iwsRXUBCU016W7ZNf7iBHkHP/fvPHuKjzXf65vQKBgQDSP3bvWS0hpRhBBeC/GRr5vS1gAWJODX0ArRO/bWPhBUDgKngOLyvKTQkzXNdzfxdiasjhcXkx5UEqoxDjIDZxQZg9R1lZI1NSZ81/WtqlrMqUr0WWmMGr/XMeQiNULKXQnKRYVJsmB4rPjeBD7CmRS5Pbs9tQsamxZu2qksMoBwKBgBFt8+UKuN4yCeIo77OxzbiDK8vRNbaj893Jknivjl+4ntYYpytd2wLOV6kkVbaxeG1G6CXfKvCrn3e5Dhm//s2CwEa69i9ZiIZhzA0dMoIg19fTc2ojAu1rL/wF5S9zokjLu2in8S2H6Us74B3794K5427lIn+gpnnJWZUvmjwFAoGBAJnp/f6gUOrFeqj3TZ14GohjFlmnCblMJIufKMrFoQ21E9ZHINZ5b9xMYwTn3Y3ep1bUB7UKpgeB5h/5ej5bcZ+dvn51whIAS1oTRZwK/e+1PCR230GtGHL5OxIWpthTSxwZ4DIN1fqUIOlq2pe+xntoUZjP5SkAttJ5IFnz0Mx3AoGBAOxNcti8t2RCfEAT1y7CFjCD6bmh9fxJbXDkYdqXM6aJKCBSajPiq2Fl1GHBTG1X4Lo0InFinpCEq7Yxvl9//HKHGRyTHXiaOW6QV53KRL4n7RGEofLhFfMJcp1CF7WRA+xpY8wowUhuiLszvBvamH+Bw+W2WT3J7eTRp0rr9ydQ";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArzywmV5zAhvMqbNRvX+UyWUSr2o9AYU/Ve2HYNPwOnZQf8DhCC5sEHv2FXnqa1jyJ9UKsa/l38Y25XDREg/ptRXFXVDzBa8IpkEISmV4gyaXy5wh+mwexBIYg51JHi9yg08EMk7vkU6N0GWD6j2j2qnKltii5sNUXyZeNNbzIxxrCbS8cyHHIZHexBadPrA9EtTGhQCVbFoJWY6mlhpL3BswygjT7BvBFN/jIENMtb5SP2y1PCNA9hCOWbnHLgb/+4nykt/fKV03phrkAUIESgcBLzlPJWWwl6NeVCD3EBCcT4MiW9fg6enZ6L4RlS6mbzMiNmHYosdM+BQCXRBFwQIDAQAB";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/kedu/forepayed";
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://localhost:8080/kedu/forepayed";
    // 加密RSA2
    public static String SIGNTYPE = "RSA2";
    // 编码
    public static String CHARSET = "utf-8";
    // 请求网关地址
    public static String URL = "https://openapi.alipaydev.com/gateway.do";
    // 返回格式
    public static String FORMAT = "json";
    // 日志记录目录
//	public static String log_path = "d://";


//	public static void logResult(String sWord) {
//		FileWriter writer = null;
//		try {
//			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
//			writer.write(sWord);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			if (writer != null) {
//				try {
//					writer.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
}
