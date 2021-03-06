package com.java.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@ResponseBody
	public Object findAll(Order order,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime) throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date st = null;
		Date et = null;
		if(!"".equals(startTime)){
			 st = sdf.parse(startTime);
		}
		if(!"".equals(endTime)){
			et = sdf.parse(endTime);
		}
		if("".equals(order.getO_number())){
			order.setO_number(null);
		}
		if("".equals(order.getO_status())){
			order.setO_status(null);
		}
		List<Order> orders = orderService.findAll(order,st,et);
		jsonMap.put("rows",orders);
		jsonMap.put("total",orders.size());
		return jsonMap;
	}
	@RequestMapping("/findAllByUser")
	public ModelAndView findAll(User user,ModelAndView mv){
		Order order = new Order();
		order.setUser(user);
		try {
			mv.addObject("orders",orderService.findAll(order,null,null));
			mv.setViewName("normal/Order");
			
		} catch (Exception e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/orderSure")//下单支付
	public Object add(@RequestParam("list")String list,@RequestParam("totalPrice")double totalPrice,
			@RequestParam("u_id")int u_id,ModelAndView mv) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
	    //使用jackson将json转为List<Order>  
	    JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class, Order.class);	     
	    List<Order> orders =  (List<Order>)mapper.readValue(list, jt);
	    orders = orderService.add(orders,u_id);
	    mv.addObject("orders",orders);
	    mv.addObject("totalPrice",totalPrice);
		mv.setViewName("normal/Pay");
		return mv;
	}
	@RequestMapping("/pay")//点击立即支付
	public Object pay(Order order,ModelAndView mv) throws Exception{
		order = orderService.load(order);
		List<Order> list = new ArrayList<Order>();
		list.add(order);
		mv.addObject("orders",list);
		mv.addObject("totalPrice",order.getO_totalPrice());
		mv.setViewName("normal/Pay");
		return mv;
	}
	@RequestMapping("/updatePay")//确认付款
	public ModelAndView update(@RequestParam("o_status")String status,@RequestParam("array[]")int[] array,ModelAndView mv){
		try {
			mv.addObject("orders",orderService.updatePay(status,array));
			mv.setViewName("normal/BuyCar_Three");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error");
		}
		return mv;
	}
	@RequestMapping("/updateOne")//用户操作订单状态
	@ResponseBody
	public String updateOne(Order order){
		try {
			orderService.updateOne(order);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	@RequestMapping("/deliver")
	@ResponseBody
	public String deliver(){//一键发货
		try {
			orderService.updateDl();
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
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
	@RequestMapping("/edit")
	@ResponseBody
	public String edit(Order order){
		try {
			orderService.edit(order);
		} catch (Exception e) {
			e.printStackTrace();
			return "修改失败";
		}
		return "success";
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
	@RequestMapping("/loadById")
	@ResponseBody
	public Order loadById(Order order) throws Exception{
		
		return orderService.load(order);
	}
	
}
