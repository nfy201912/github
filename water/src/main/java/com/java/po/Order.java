package com.java.po;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
/*
 * 订单
 * */
public class Order {
	private int o_id; 
	private String o_totalPrice;//订单总额
	private double o_freight;//运费
	private String o_number;//编号
	private String o_paymentMethod ;//支付方式
	private String o_address ;//收货地址
	private String o_consignee;//收货人名称
	private Timestamp o_dealTime ;//成交时间
	private Timestamp o_createTime;//创建时间
	private Timestamp o_payTime;//支付时间
	private String o_status;//状态
	private String o_cellphone;//联系号码
	private int o_amount;//商品总数
	private Goods goods;//商品
	private User user ;//用户
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getO_totalPrice() {
		return o_totalPrice;
	}
	public void setO_totalPrice(String o_totalPrice) {
		this.o_totalPrice = o_totalPrice;
	}
	public double getO_freight() {
		return o_freight;
	}
	public void setO_freight(double o_freight) {
		this.o_freight = o_freight;
	}
	public String getO_number() {
		return o_number;
	}
	public void setO_number(String o_number) {
		this.o_number = o_number;
	}
	public String getO_paymentMethod() {
		return o_paymentMethod;
	}
	public void setO_paymentMethod(String o_paymentMethod) {
		this.o_paymentMethod = o_paymentMethod;
	}
	public String getO_address() {
		return o_address;
	}
	public void setO_address(String o_address) {
		this.o_address = o_address;
	}
	public String getO_consignee() {
		return o_consignee;
	}
	public void setO_consignee(String o_consignee) {
		this.o_consignee = o_consignee;
	}
	public Timestamp getO_dealTime() {
		return o_dealTime;
	}
	public void setO_dealTime(Timestamp o_dealTime) {
		this.o_dealTime = o_dealTime;
	}
	public Timestamp getO_createTime() {
		return o_createTime;
	}
	public void setO_createTime(Timestamp o_createTime) {
		this.o_createTime = o_createTime;
	}
	public Timestamp getO_payTime() {
		return o_payTime;
	}
	public void setO_payTime(Timestamp o_payTime) {
		this.o_payTime = o_payTime;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	public String getO_cellphone() {
		return o_cellphone;
	}
	public void setO_cellphone(String o_cellphone) {
		this.o_cellphone = o_cellphone;
	}
	public int getO_amount() {
		return o_amount;
	}
	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Order [o_id=" + o_id + ", o_totalPrice=" + o_totalPrice
				+ ", o_freight=" + o_freight + ", o_number=" + o_number
				+ ", o_paymentMethod=" + o_paymentMethod + ", o_address="
				+ o_address + ", o_consignee=" + o_consignee + ", o_dealTime="
				+ o_dealTime + ", o_createTime=" + o_createTime
				+ ", o_payTime=" + o_payTime + ", o_status=" + o_status
				+ ", o_cellphone=" + o_cellphone + ", o_amount=" + o_amount
				+ ", goods=" + goods + ", user=" + user + "]";
	}
	
}
