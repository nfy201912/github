package com.java.mapper;

import java.util.List;

import com.java.po.Category;

public interface CategoryMapper {
	//查询所有种类
	public List<Category> findAll() throws Exception;
}
