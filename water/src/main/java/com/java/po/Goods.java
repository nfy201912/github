package com.java.po;

public class Goods {
	private int g_id;
	private String g_name;
	private double g_price;
	private String g_imgUrl;
	private Category category;//类别
	private Brand brand;//品牌
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
	public double getG_price() {
		return g_price;
	}
	public void setG_price(double g_price) {
		this.g_price = g_price;
	}
	public String getG_imgUrl() {
		return g_imgUrl;
	}
	public void setG_imgUrl(String g_imgUrl) {
		this.g_imgUrl = g_imgUrl;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	@Override
	public String toString() {
		return "Goods [g_id=" + g_id + ", g_name=" + g_name + ", g_price="
				+ g_price + ", g_imgUrl=" + g_imgUrl + ", category=" + category
				+ ", brand=" + brand + "]";
	}
	
}
