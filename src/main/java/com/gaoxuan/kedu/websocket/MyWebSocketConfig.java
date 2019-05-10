//package com.gaoxuan.kedu.websocket;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
//
///**
// * Component注解告诉SpringMVC该类是一个SpringIOC容器下管理的类
// * 其实@Controller, @Service, @Repository是@Component的细化
// */
//@Component
//@EnableWebSocket
//public class MyWebSocketConfig implements WebSocketConfigurer {
//
//	@Autowired
//	MyWebSocketHandler myWebSocketHander;
//
//	private static final String LINK_URI = "websocket.do";
//	//添加websocket处理器，添加握手拦截器  拦截器先执行 然后到处理器
//	@Override
//	public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
//		webSocketHandlerRegistry.addHandler(myWebSocketHander,LINK_URI).addInterceptors(new MyHandShakeInterceptor());
//	}
//
//}
