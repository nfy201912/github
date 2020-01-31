package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.p;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	    		@RequestParam("g_price")double price,@RequestParam("category")int c){
		 	Goods good = new Goods();
	        if (!file.isEmpty()) {
	            try {
	                // getOriginalFilename()是包含源文件后缀的全名
	                String filePath = request.getServletContext().getRealPath("/")+UPLOAD_DIRECTORY+file.getOriginalFilename();
	       
	                File saveDir = new File(filePath);
	                if (!saveDir.getParentFile().exists())
	                    saveDir.getParentFile().mkdirs();
	                file.transferTo(saveDir);
	                Category category = new Category();
	                category.setC_id(c);;
	                good.setCategory(category);
	               good.setG_imgUrl(File.separator+UPLOAD_DIRECTORY+file.getOriginalFilename());
	               good.setG_name(name);
	               good.setG_price(price);
	               goodsService.add(good);
	                return "success";
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return "上传失败";
	 
	    }

	
}
