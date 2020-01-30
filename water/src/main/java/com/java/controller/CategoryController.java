package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.po.Category;
import com.java.service.CategoryService;

@Controller
@RequestMapping("/category")
@SessionAttributes(value={})
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/findCategory")
	@ResponseBody
	public List<Category> findCategory() throws Exception{
		
		return categoryService.findAll();
	} 
}
