package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.po.Order;


public interface OrderMapper {
	//查询所有订单
	public List<Order> findAll(Order order) throws Exception;
	//添加订单
	public void add(List<Order> orders)throws Exception;
	//删除订单
	public void delete(int[] array)throws Exception;
	//修改订单
	public void updatePay(@Param("o_status")String status,@Param("array")int[] array)throws Exception;
	//加载订单
	public Order load(Order order)throws Exception;
	//编号查询
	public Order findByNumber(Order order) throws Exception;
	//通过订单号查询
	public List<Order> findOrders(List<String> list)throws Exception;
}
