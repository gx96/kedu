package com.gaoxuan.kedu.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.gaoxuan.kedu.pojo.*;
import com.gaoxuan.kedu.service.*;
import com.gaoxuan.kedu.util.AlipayConfig;
import com.github.pagehelper.PageHelper;
import comparator.*;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("")
public class ForeController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@Autowired
	ProductImageService productImageService;
	@Autowired
	PropertyValueService propertyValueService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderItemService orderItemService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	RecommendService recommendService;
	@Autowired
	WeixinPayService weixinPayService;
	@Autowired
	AlipayService alipayService;
	@Autowired
	AddressService addressService;
	@RequestMapping("forehome")
	public String home(Model model, HttpSession session) {
		List<Category> cs = categoryService.list();
		productService.fill(cs);
		productService.fillByRow(cs);
		model.addAttribute("cs", cs);
		User user = (User) session.getAttribute("user");

		//推荐
		if (user != null) {
			List<Recommend> r = recommendService.get(user.getId());//先根据当前用户的id把该id的所有搜索记录查出来
			if (r.size() == 0) {
				return "fore/home";
			}
			String[] str = new String[5];//放置搜索记录的数组，只查最近的5个
			for (int i = 0; i < r.size(); i++) {
				str[i] = r.get(i).getName();//添加搜索记录
			}
			List<Product> rp = productService.selectByName(str);//放置根据搜索记录查询出来的商品
			if (rp.size() == 0) {//如果最近五次都没有
				return "fore/home";
			}
			//把该商品的同类型商品搜索出来,将类型id保存在HashSet中，去重。
			HashSet<Integer> hashSet = new HashSet<>();
			for (Product product : rp) {
				hashSet.add(product.getCid());
			}
			//根据分类名搜索商品，并打乱。
			List<Product> productList = new ArrayList<>();
			for (Integer integer : hashSet) {
				productList.addAll(productService.list(integer));
			}
			Collections.shuffle(productList);
			for (int i = 0; i < str.length; i++) {
				//设置product的图片，先根据id在productImage中找到对应的图片，再把第一张图片找到，并设置到product中。
				productList.get(i).setFirstProductImage(productImageService.selectByPID(productList.get(i).getId()));
			}
			System.out.println(productList.size());
			model.addAttribute("rp", productList);//将集合发给前端
		}
		return "fore/home";
	}

	@RequestMapping("foreregister")
	public String register(Model model, User user) {
		String name = user.getName();
		name = HtmlUtils.htmlEscape(name);
		user.setName(name);
		boolean exist = userService.isExist(name);

		if (exist) {
			String m = "用户名已被使用";
			model.addAttribute("msg", m);
			model.addAttribute("user", null);
			return "fore/register";
		}
		userService.add(user);

		return "redirect:RegisterSuccess1";
	}

	@RequestMapping("RegisterSuccess1")
	public String RegisterSuccess1(Model model, HttpSession session) {

		return "fore/registerSuccess";
	}

	@RequestMapping("forelogin")
	public String login(@RequestParam("name") String name, @RequestParam("password") String password, Model model,
						HttpSession session) {
		name = HtmlUtils.htmlEscape(name);
		User user = userService.get(name, password);
		if (null == user) {
			model.addAttribute("msg", "用户名或密码错误，请重新输入");
			return "fore/login";
		}
		session.setAttribute("user", user);
		return "redirect:forehome";
	}

	@RequestMapping("forelogout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:forehome";
	}

	//显示商品信息信息
	@RequestMapping("foreproduct")
	public String product(int pid, Model model) {
		Product p = productService.get(pid);

		List<ProductImage> productSingleImages = productImageService.list(p.getId(), ProductImageService.type_single);
		List<ProductImage> productDetailImages = productImageService.list(p.getId(), ProductImageService.type_detail);
		p.setProductSingleImages(productSingleImages);
		p.setProductDetailImages(productDetailImages);

		List<PropertyValue> pvs = propertyValueService.list(p.getId());
		List<Review> reviews = reviewService.list(p.getId());
		productService.setSaleAndReviewNumber(p);
		model.addAttribute("reviews", reviews);
		model.addAttribute("p", p);
		model.addAttribute("pvs", pvs);

		//如果库存为0，通知前台。
		if (p.getStock() == 0) {
			model.addAttribute("stockFlag", "zero");
		}
		return "fore/product";
	}

	@RequestMapping("forecheckLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null != user)
			return "success";
		return "fail";
	}

	@RequestMapping("foreloginAjax")
	@ResponseBody
	public String loginAjax(@RequestParam("name") String name, @RequestParam("password") String password,
							HttpSession session) {
		name = HtmlUtils.htmlEscape(name);
		User user = userService.get(name, password);

		if (null == user) {
			return "fail";
		}
		session.setAttribute("user", user);
		return "success";
	}

	@RequestMapping("forecategory")
	public String category(int cid, String sort, Model model) {
		Category c = categoryService.get(cid);
		productService.fill(c);
		productService.setSaleAndReviewNumber(c.getProducts());

		if (null != sort) {
			switch (sort) {
				case "review":
					Collections.sort(c.getProducts(), new ProductReviewComparator());
					break;
				case "date":
					Collections.sort(c.getProducts(), new ProductDateComparator());
					break;

				case "saleCount":
					Collections.sort(c.getProducts(), new ProductSaleCountComparator());
					break;

				case "price":
					Collections.sort(c.getProducts(), new ProductPriceComparator());
					break;

				case "all":
					Collections.sort(c.getProducts(), new ProductAllComparator());
					break;
			}
		}

		model.addAttribute("c", c);
		return "fore/category";
	}

	@RequestMapping("foresearch")
	public String search(String keyword, Model model, HttpSession session) {

		PageHelper.offsetPage(0, 20);
		List<Product> ps = productService.search(keyword);
		User user = (User) session.getAttribute("user");
		Recommend recommend = new Recommend();
		recommend.setName(keyword);
		if (user != null) {
			recommend.setUid(user.getId());
		} else {
			recommend.setUid(0);
		}
		recommendService.add(recommend);
		productService.setSaleAndReviewNumber(ps);
		model.addAttribute("ps", ps);
		return "fore/searchResult";
	}

	//买一个
	@RequestMapping("forebuyone")
	public String buyone(int pid, int num, HttpSession session) {
		Product p = productService.get(pid);
		int oiid = 0;

		User user = (User) session.getAttribute("user");
		boolean found = false;
		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
				oi.setNumber(oi.getNumber() + num);
				orderItemService.update(oi);
				found = true;
				oiid = oi.getId();
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUid(user.getId());
			oi.setNumber(num);
			oi.setPid(pid);
			orderItemService.add(oi);
			oiid = oi.getId();
		}
		return "redirect:forebuy?oiid=" + oiid;
	}

	//购物车购买
	@RequestMapping("forebuy")
	public String buy(Model model, String[] oiid, HttpSession session) {
		List<OrderItem> ois = new ArrayList<>();
		float total = 0;
		for (String strid : oiid) {
			int id = Integer.parseInt(strid);
			OrderItem oi = orderItemService.get(id);
			total += oi.getProduct().getPromotePrice() * oi.getNumber();
			ois.add(oi);
		}

		session.setAttribute("ois", ois);
		//查找默认地址
		User user = (User) session.getAttribute("user");
		Address address = addressService.getByUid(user.getId());
		model.addAttribute("address", address);

		model.addAttribute("total", total);
		return "fore/buy";
	}

	//支付中途中断，在我的订单中会调用这个，按订单号查询该订单中所有订单项
	@RequestMapping("forebuyagain")
	public String buyagain(Model model, int oid, float total, HttpSession session) {
		List<OrderItem> ois = orderItemService.listByOid(oid);
		//查找默认地址
		User user = (User) session.getAttribute("user");
		Address address = addressService.getByUid(user.getId());
		model.addAttribute("address", address);
//        for (OrderItem oi : ois) {
//            OrderItem oi1=orderItemService.get(oi.getId());
//            ois.add(oi1);
//    }
//        for(String strid:ois.)
//        for (String strid : oiid) {
//            int id = Integer.parseInt(strid);
//            OrderItem oi = orderItemService.get(id);
//            total += oi.getProduct().getPromotePrice() * oi.getNumber();
//            ois.add(oi);
//        }

		session.setAttribute("ois", ois);
		model.addAttribute("total", total);
		model.addAttribute("orderCode", orderService.get(oid).getOrderCode());
		return "fore/buy";
	}

	@RequestMapping("foreaddCart")
	@ResponseBody
	public String addCart(int pid, int num, Model model, HttpSession session) {
		Product p = productService.get(pid);
		User user = (User) session.getAttribute("user");
		boolean found = false;

		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
				oi.setNumber(oi.getNumber() + num);
				orderItemService.update(oi);
				found = true;
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUid(user.getId());
			oi.setNumber(num);
			oi.setPid(pid);
			orderItemService.add(oi);
		}
		return "success";
	}

	@RequestMapping("forecart")
	public String cart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		model.addAttribute("ois", ois);
		return "fore/cart";
	}

	@RequestMapping("forechangeOrderItem")
	@ResponseBody
	public String changeOrderItem(Model model, HttpSession session, int pid, int number) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";

		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == pid) {
				oi.setNumber(number);
				orderItemService.update(oi);
				break;
			}

		}
		return "success";
	}

	@RequestMapping("foredeleteOrderItem")
	@ResponseBody
	public String deleteOrderItem(Model model, HttpSession session, int oiid) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";
		orderItemService.delete(oiid);
		return "success";
	}

	//创建订单
	@RequestMapping("forecreateOrder")
	@ResponseBody
	public String createOrder(Model model, Order order, String orderCode, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
		String oCode;
		String total_fee;
		//如果是已有订单，但没有完成支付的
		if (orderCode.length() > 10) {
			float total = 0;
			oCode = orderCode;
			System.out.println(oCode + "11");
			for (OrderItem oi : ois) {
				total += oi.getProduct().getPromotePrice() * oi.getNumber();
			}
			total_fee = total + "";
		} else {//没有订单，直接生成新的
			oCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
			System.out.println(oCode + "12");
			//只要订单生成就先减少库存。
			for (OrderItem oi : ois) {
				Product product = oi.getProduct();//得到该订单项中的商品
				product.setStock(product.getStock() - oi.getNumber());//更新库存，商品库存减去订单项中购买的数量
				productService.update(product);//更新商品信息
			}
			//        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
			order.setOrderCode(oCode);//订单号
			order.setCreateDate(new Date());
			order.setUid(user.getId());
			order.setStatus(OrderService.waitPay);
			total_fee = orderService.add(order, ois) + "";
		}

		//微信接口
		//Map map=weixinPayService.createNative(idWorker.nextId()+"","1");
		//支付宝接口
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		String subject = "kedu";//不能用中文
		alipayRequest.setBizContent("{\"out_trade_no\":\"" + oCode + "\","
				+ "\"total_amount\":\"" + total_fee + "\","
				+ "\"subject\":\"" + subject + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求
		System.out.println(alipayRequest);
		String result = null;
		System.out.println(total_fee);
		System.out.println(oCode);
		try {
			result = alipayClient.pageExecute(alipayRequest).getBody();
			System.out.println(result);
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}
		return result;
//        float total = orderService.add(order, ois);
////        return "redirect:forealipay?oid=" + order.getId() + "&total=" + total+"&valueurl="+map.get("code_url")+"&total_fee="+map.get("total_fee");
//        return "redirect:forealipay?oid=" + order.getId() + "&total=" + total;
	}

	@RequestMapping("forealipay")
	public String alipay(Model model, HttpServletRequest request) {

		model.addAttribute("wechat", request.getAttribute("WeChat"));
		return "fore/alipay";
	}

	@RequestMapping("forepayed")
//    public String payed(int oid, float total, Model model) {
	public String payed(String out_trade_no, Model model, String timestamp, String total_amount) {
		Order order = orderService.getByid(out_trade_no);
		order.setStatus(OrderService.waitDelivery);
		order.setPayDate(new Date());
		orderService.update(order);
		model.addAttribute("o", order);
		model.addAttribute("total_amount", total_amount);
//        Order order = orderService.get(oid);
//        order.setStatus(OrderService.waitDelivery);
//        order.setPayDate(new Date());
//        orderService.update(order);
//        model.addAttribute("o", order);
		return "fore/payed";
	}

	@RequestMapping("forebought")
	public String bought(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> os = orderService.list(user.getId(), OrderService.delete);
		orderItemService.fill(os);
		model.addAttribute("os", os);
		return "fore/bought";
	}

	@RequestMapping("foreconfirmPay")
	public String confirmPay(Model model, int oid) {
		Order o = orderService.get(oid);
		orderItemService.fill(o);
		model.addAttribute("o", o);
		return "fore/confirmPay";
	}

	@RequestMapping("foreorderConfirmed")
	public String orderConfirmed(Model model, int oid) {
		Order o = orderService.get(oid);
		o.setStatus(OrderService.waitReview);
		o.setConfirmDate(new Date());
		orderService.update(o);
		return "fore/orderConfirmed";
	}

	@RequestMapping("foredeleteOrder")
	@ResponseBody
	public String deleteOrder(Model model, int oid) {
		Order o = orderService.get(oid);
		o.setStatus(OrderService.delete);
		orderService.update(o);
		return "success";
	}

	@RequestMapping("forereview")
	public String review(Model model, int oid) {
		Order o = orderService.get(oid);
		orderItemService.fill(o);
		Product p = o.getOrderItems().get(0).getProduct();
		List<Review> reviews = reviewService.list(p.getId());
		productService.setSaleAndReviewNumber(p);
		model.addAttribute("p", p);
		model.addAttribute("o", o);
		model.addAttribute("reviews", reviews);
		return "fore/reviewSuccess";
	}

	@RequestMapping("foredoreview")
	public String doreview(Model model, HttpSession session, @RequestParam("oid") int oid, @RequestParam("pid") int pid, String content) {
		Order o = orderService.get(oid);
		o.setStatus(OrderService.finish);
		orderService.update(o);

		Product p = productService.get(pid);
		content = HtmlUtils.htmlEscape(content);

		User user = (User) session.getAttribute("user");
		Review review = new Review();
		review.setContent(content);
		review.setPid(pid);
		review.setCreateDate(new Date());
		review.setUid(user.getId());
		reviewService.add(review);

		return "redirect:forereview?oid=" + oid + "&showonly=true";
	}

	//查看地址
	@RequestMapping("foreAddress")
	public String foreAddress(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Address> as = addressService.list(user.getId());
		model.addAttribute("as", as);
		return "fore/Address";
	}

	//删除地址
	@RequestMapping("foreAddressDelete")
	public String foreAddressDelete(int id) {
		addressService.delete(id);
		return "forward:foreAddress";
	}

	//显示更新地址界面
	@RequestMapping("foreAddressUpdate")
	public String foreAddressUpdate(Model model, HttpSession session, int id) {
		Address address = addressService.getById(id);
		model.addAttribute("addressUpdate", address);
		model.addAttribute("flag", "flag");
		return "forward:foreAddress";
	}

	//更新地址
	@RequestMapping("foreAddressUpdateAfter")
	public String foreAddressUpdateAfter(Model model, Address address) {
		addressService.update(address);
		model.addAttribute("addressUpdate", null);
		return "redirect:foreAddress";
	}

	//设置默认地址
	@RequestMapping("foreAddressDefault")
	public String foreAddressDefault(Model model, int id, int uid) {
		Address address = addressService.getById(id);
		addressService.updateDefault(uid);
		address.setStart(1);
		addressService.update(address);
		return "redirect:foreAddress";
	}

	//添加地址
	@RequestMapping("foreAddressAdd")
	public String foreAddressAdd(Model model, HttpServletRequest request) {
		Address address = new Address();
		address.setName(request.getParameter("name"));
		address.setArea(request.getParameter("area"));
		address.setAddress(request.getParameter("address"));
		address.setPostal(request.getParameter("postal"));
		address.setPhone(request.getParameter("phone"));
		address.setStart(0);
		address.setUid(Integer.parseInt(request.getParameter("uid")));
		addressService.add(address);
		return "redirect:foreAddress";
	}

	//取消订单
	@RequestMapping("cancelOrderLink")
	public String cancelOrderLink(int oid, String status) {
		List<OrderItem> ois = orderItemService.listByOid(oid);
		for (OrderItem oi : ois) {
			Product product = productService.get(oi.getPid());//获取订单项对应的商品
			product.setStock(product.getStock() + oi.getNumber());//还原库存
			productService.update(product);//更新商品
			orderItemService.delete(oi.getId());//删除订单项
		}
		orderService.delete(oid);//删除订单
		return "forward:forebought";
	}
}