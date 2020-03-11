package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.po.BuyCar;
import com.java.po.Order;
import com.java.po.User;
import com.java.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	private static final String ZFB = "ZFB";
	private static final String YEZF = "YEZF";
	private static final String HDFK = "HDFK"; 
	@RequestMapping("/findAll")
	public ModelAndView findAll(User user,ModelAndView mv){
		Order order = new Order();
		order.setUser(user);
		try {
			mv.addObject("orders",orderService.findAll(order));
			mv.setViewName("normal/Order");
			
		} catch (Exception e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/orderSure")
	public Object add(@RequestParam("list")String list,@RequestParam("totalPrice")double totalPrice,
			@RequestParam("u_id")int u_id,ModelAndView mv) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
	    //使用jackson将json转为List<Order>  
	    JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class, Order.class);	     
	    List<Order> orders =  (List<Order>)mapper.readValue(list, jt);
	    orderService.add(orders,u_id);
	    mv.addObject("orders",orders);
	    mv.addObject("totalPrice",totalPrice);
		mv.setViewName("normal/Pay");
		return mv;
	}
	@RequestMapping("/pay")
	public Object pay(Order order,ModelAndView mv) throws Exception{
		
		order = orderService.load(order);
		List<Order> list = new ArrayList<Order>();
		list.add(order);
		mv.addObject("orders",list);
		mv.addObject("totalPrice",order.getO_totalPrice());
		mv.setViewName("normal/Pay");
		return mv;
	}
	@RequestMapping("/update")
	@ResponseBody
	public String update(Order order){
		try {
			orderService.update(order);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("array[]")int[] oid){
		try {
			orderService.delete(oid);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	@RequestMapping("/load")
	public ModelAndView load(Order order,ModelAndView mv){
		try {
			mv.addObject("order",orderService.load(order));
			mv.setViewName("normal/OrderDetail");
		} catch (Exception e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
	}
}
