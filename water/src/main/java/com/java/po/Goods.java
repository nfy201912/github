package com.java.po;

public class Goods {
	private int g_id;
	private String g_name;
	private String g_price;
	private Category category;//类别
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_price() {
		return g_price;
	}
	public void setG_price(String g_price) {
		this.g_price = g_price;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Goods [g_id=" + g_id + ", g_name=" + g_name + ", g_price="
				+ g_price + ", category=" + category + "]";
	}
	
	
}
