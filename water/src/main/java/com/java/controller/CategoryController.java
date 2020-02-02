package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.po.Category;
import com.java.service.CategoryService;
import com.java.service.GoodsService;

@Controller
@RequestMapping("/category")
@SessionAttributes(value={})
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public Object findAll() throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		List<Category> list =categoryService.findAll();
		jsonMap.put("rows",list);
		jsonMap.put("total",list.size());
		return jsonMap;
	} 
	
	@RequestMapping("/findCategory")
	@ResponseBody
	public List<Category> findCategory() throws Exception{
		return categoryService.findAll() ;
	}
}
