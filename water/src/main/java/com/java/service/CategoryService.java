package com.java.service;

import java.util.List;

import com.java.po.Brand;
import com.java.po.Category;

public interface CategoryService {
	//查询所有种类
	public List<Category> findAll() throws Exception;
	//添加种类
	public String add(Category category)throws Exception;
	//删除种类
	public void delete(int[] array)throws Exception;
	//修改种类
	public String edit(Category category)throws Exception;
	//加载种类
	public Category load(int c_id)throws Exception;
	//名称查询
	public Category findByName(Category category) throws Exception;
	
	/*
	 * 品牌
	 * */
	//查询所有品牌
	public List<Brand> findAllb() throws Exception;
	//添加品牌
	public String addb(Brand brand)throws Exception;
	//删除品牌
	public void deleteb(int[] array)throws Exception;
	//修改品牌
	public String editb(Brand brand)throws Exception;
	//加载品牌
	public Brand loadb(int b_id)throws Exception;
	//名称查询
	public Brand findByNameb(Brand brand) throws Exception;
}
