package com.java.po;

import java.util.List;

public class BuyCar {
	private int bc_id;
	private Goods goods;
	private User user;
	private int buyNum;
	public int getBc_id() {
		return bc_id;
	}
	public void setBc_id(int bc_id) {
		this.bc_id = bc_id;
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
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	@Override
	public String toString() {
		return "BuyCar [bc_id=" + bc_id + ", goods=" + goods + ", user=" + user
				+ ", buyNum=" + buyNum + "]";
	}
	
}
