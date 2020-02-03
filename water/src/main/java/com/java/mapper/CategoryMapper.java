package com.java.mapper;

import java.util.List;

import com.java.po.Category;

public interface CategoryMapper {
	//查询所有种类
	public List<Category> findAll() throws Exception;
	//添加种类
	public void add(Category category)throws Exception;
	//删除种类
	public void delete(int[] array)throws Exception;
	//修改种类
	public void edit(Category category)throws Exception;
	//加载种类
	public Category load(int c_id)throws Exception;
	//名称查询
	public Category findByName(Category category) throws Exception;
}
