package com.java.po;

import java.util.List;

public class Brand {
	private int b_id;
	private String b_name;
	private List<Goods> goods;
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	@Override
	public String toString() {
		return "Brand [b_id=" + b_id + ", b_name=" + b_name + ", goods="
				+ goods + "]";
	}
	
}
