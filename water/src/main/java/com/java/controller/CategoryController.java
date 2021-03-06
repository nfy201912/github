package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.po.Brand;
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
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(Category category){
		try {
			
			return categoryService.add(category);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "添加失败";
		}
		
	}
	@RequestMapping("/edit")
	@ResponseBody
	public String edit(Category category){
		try {	
			return categoryService.edit(category);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "修改失败";
		}
		
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("array[]") int[] array){
		try {
			categoryService.delete(array);
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "删除失败";
		}
		
	}
	@RequestMapping("/load")
	@ResponseBody
	public Category load(@RequestParam("c_id") int c_id) throws Exception{
			
		return categoryService.load(c_id);
		
	}
	/*
	 * 品牌
	 * */
	

	@RequestMapping("/findAllb")
	@ResponseBody
	public Object findAllb() throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		List<Brand> list =categoryService.findAllb();
		jsonMap.put("rows",list);
		jsonMap.put("total",list.size());
		return jsonMap;
	} 
	
	@RequestMapping("/findBrands")
	@ResponseBody
	public List<Brand> findBrands() throws Exception{
		return categoryService.findAllb() ;
	}
	
	@RequestMapping("/addb")
	@ResponseBody
	public String addb(Brand brand){
		try {
			
			return categoryService.addb(brand);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "添加失败";
		}
		
	}
	@RequestMapping("/editb")
	@ResponseBody
	public String editb(Brand brand){
		try {	
			return categoryService.editb(brand);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "修改失败";
		}
		
	}
	@RequestMapping("/deleteb")
	@ResponseBody
	public String deleteb(@RequestParam("array[]") int[] array){
		try {
			categoryService.deleteb(array);
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "删除失败";
		}
		
	}
	@RequestMapping("/loadb")
	@ResponseBody
	public Brand loadb(@RequestParam("b_id") int b_id) throws Exception{
			
		return categoryService.loadb(b_id);
		
	}
}
