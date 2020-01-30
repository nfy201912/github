package com.java.service;

import java.util.List;

import com.java.po.Category;

public interface CategoryService {
	//查询所有种类
	public List<Category> findAll() throws Exception;
}
