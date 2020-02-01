package com.java.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.java.po.Category;
import com.java.po.Goods;
import com.java.service.GoodsService;
@Controller
@RequestMapping("/goods")
@SessionAttributes(value={})
public class GoodsController {
	@Resource
	HttpServletRequest request;
	@Autowired
	private GoodsService goodsService;
	// 上传文件存储目录                                  
	private static final String UPLOAD_DIRECTORY = "img"+File.separator;
	//
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
	@RequestMapping("/upload")
	@ResponseBody
	public Object upload(@RequestParam("g_imgUrl") MultipartFile file,@RequestParam("g_name")String name,
			@RequestParam("g_price")double price,@RequestParam("category")int c,@RequestParam("g_id")int g_id) throws Exception{
		Goods good = new Goods();
		Goods G = new Goods();
		if(g_id!=0){
			G.setG_id(g_id);
		}
		G.setG_name(name);
		G = goodsService.findByName(G);
		if(G!=null){
			return "已存在该名称水源";
		}
		if (!file.isEmpty()) {
			try {
				// getOriginalFilename()是包含源文件后缀的全名
				String filePath = request.getServletContext().getRealPath("/")+UPLOAD_DIRECTORY+file.getOriginalFilename();
				File saveDir = new File(filePath);
				if (!saveDir.getParentFile().exists()){
					saveDir.getParentFile().mkdirs();
				}
				file.transferTo(saveDir);
				Category category = new Category();
				category.setC_id(c);
				good.setCategory(category);
				good.setG_imgUrl(File.separator+UPLOAD_DIRECTORY+file.getOriginalFilename());
				good.setG_name(name);
				good.setG_price(price);
				
				if(g_id!=0){
					good.setG_id(g_id);
					goodsService.edit(good);
				}else{
					goodsService.add(good);
				}
				
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "error";

	}
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("array[]") int[] array){
		try {
			goodsService.delete(array);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}

	@RequestMapping("/load")
	@ResponseBody
	public Object load(@RequestParam("g_id") int g_id) throws Exception{
		
		return goodsService.load(g_id);
	}
}
