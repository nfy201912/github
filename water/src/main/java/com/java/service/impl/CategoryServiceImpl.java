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

	@Override
	public String add(Category category) throws Exception {
		if(this.findByName(category)!=null){
			return "该名称种类已存在";
		}
		categoryMapper.add(category);
		return "success";
	}

	@Override
	public void delete(int[] array) throws Exception {
		categoryMapper.delete(array);
		
	}

	@Override
	public String edit(Category category) throws Exception {
		if(this.findByName(category)!=null){
			return "该名称种类已存在";
		}
		categoryMapper.edit(category);
		return "success";
		
	}

	@Override
	public Category load(int c_id) throws Exception {
		
		return categoryMapper.load(c_id);
	}

	@Override
	public Category findByName(Category category) throws Exception {
		
		return categoryMapper.findByName(category);
	}
}
