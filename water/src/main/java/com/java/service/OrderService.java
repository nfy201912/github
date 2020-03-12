package com.java.service;

import java.util.List;

import com.java.po.Order;

public interface OrderService {
	//查询所有订单
	public List<Order> findAll(Order order) throws Exception;
	//添加订单
	public List<Order> add(List<Order> Order,int u_id)throws Exception;
	//删除订单
	public void delete(int[] array)throws Exception;
	//修改订单
	public void updatePay(String status,int[] array)throws Exception;
	//加载订单
	public Order load(Order order)throws Exception;
	//编号查询
	public Order findByNumber(Order order) throws Exception;
}
