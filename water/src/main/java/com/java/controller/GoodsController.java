package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.po.Goods;
import com.java.service.GoodsService;
@Controller
@RequestMapping("/goods")
@SessionAttributes(value={})
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public Object findAll() throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		List<Goods> goods = goodsService.findAll();
		for(Goods g: goods){
			System.out.println(g);
		}
		jsonMap.put("rows",goods);
		jsonMap.put("total",goods.size());
		return jsonMap;
	}
}
