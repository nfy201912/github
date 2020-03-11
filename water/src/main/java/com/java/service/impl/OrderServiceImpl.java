package com.java.service.impl;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.BuyCarMapper;
import com.java.mapper.OrderMapper;
import com.java.po.Order;
import com.java.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {
	private static final String JYGB = "交易关闭";
	private static final String YZF = "已支付";
	private static final String WFK = "未付款";
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private BuyCarMapper buyCarMapper;
	@Override
	public List<Order> findAll(Order order) throws Exception {
		
		return orderMapper.findAll(order);
	}

	@Override
	public void add(List<Order> order,int u_id) throws Exception {
		String date;
		String uuid;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");//年月日格式
	    int hashCodeV;
	    int i=0;
	    int[] g_id = new int[order.size()];
		for(Order o: order ){
			if(i<g_id.length){
				g_id[i] = o.getGoods().getG_id();
				i++;
			}
			hashCodeV = UUID.randomUUID().toString().hashCode();
		    if(hashCodeV < 0) {//有可能是负数  
		        hashCodeV = - hashCodeV;  
		    }  
		    uuid  = String.format("%012d", hashCodeV).substring(4,8); 
			date = sdf.format(new Date())+uuid;
			o.setO_createTime(new Timestamp(new Date().getTime()));
			o.setO_status(WFK);
			o.setO_number(date);
		}
		orderMapper.add(order);
		buyCarMapper.del(g_id, u_id);
	}

	@Override
	public void delete(int[] array) throws Exception {
		orderMapper.delete(array);
		
	}

	@Override
	public void update(Order order) throws Exception {
		orderMapper.update(order);
		
	}

	@Override
	public Order load(Order order) throws Exception {
		
		return orderMapper.load(order);
	}

	@Override
	public Order findByNumber(Order order) throws Exception {
		
		return orderMapper.findByNumber(order);
	}

	
}
