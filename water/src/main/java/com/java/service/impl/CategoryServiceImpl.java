package com.java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.CategoryMapper;
import com.java.po.Category;
import com.java.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> findAll() throws Exception {
		
		return categoryMapper.findAll();
	}
}
