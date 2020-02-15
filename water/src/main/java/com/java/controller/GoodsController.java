package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.po.Brand;
import com.java.po.BuyCar;
import com.java.po.Category;
import com.java.po.Goods;
import com.java.service.GoodsService;
@Controller
@RequestMapping("/goods")
@SessionAttributes(value={"goods","brand"})
public class GoodsController {
	private static final long serialVersionUID = 1L;
	private static final String WHH = "1";//娃哈哈
	private static final String QC = "2";//雀巢
	private static final String YB = "3";//怡宝	
	private static final String QCS = "4";//屈臣氏
	private static final String NFSQ = "5";//农夫山泉
	private static final String DNYL = "6";//达能益力
	private static final String LBS = "7";//乐百氏
	private static final String BL = "8";//冰露
	@Resource
	HttpServletRequest request;
	@Autowired
	private GoodsService goodsService;
	// 上传文件存储目录                                  
	private static final String UPLOAD_DIRECTORY = "img"+File.separator;
	//
	@RequestMapping("/findAll")
	@ResponseBody
	public Object findAll(@RequestParam("g_name")String g_name,@RequestParam("c_id")int c_id) throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Goods good = new Goods();
		Category c = new Category();
		if(!"".equals(g_name)&&0!=c_id){
				good.setG_name(g_name);
				c.setC_id(c_id);
				good.setCategory(c);

		}else{
			if(!"".equals(g_name)){
				good.setG_name(g_name);
			}
			if(0!=c_id){
				c.setC_id(c_id);
				good.setCategory(c);
			}
		}
		
		List<Goods> goods = goodsService.findAll(good);
		jsonMap.put("rows",goods);
		jsonMap.put("total",goods.size());
		return jsonMap;
	}
	
	@RequestMapping("/findGoods")
	public Object findGoods(@RequestParam("b_name")String b_name,@RequestParam("g_name")String g_name,@RequestParam("startPage")int startPage,
			@RequestParam("pageSize")int pageSize) throws Exception{
		ModelAndView mv = new ModelAndView();
		Goods good = new Goods();
		Brand brand = new Brand();
		String flag = "";
		if(!"".equals(b_name)){
			if(LBS.equals(b_name)){
				brand.setB_name("乐百氏");
				flag = LBS;
			}else if(WHH.equals(b_name)){
				brand.setB_name("娃哈哈");
				flag = WHH;
			}else if(QC.equals(b_name)){
				brand.setB_name("雀巢");
				flag = QC;
			}else if(NFSQ.equals(b_name)){
				brand.setB_name("农夫山泉");
				flag = NFSQ;
			}else if(YB.equals(b_name)){
				brand.setB_name("怡宝");
				flag = YB;
			}else if(QCS.equals(b_name)){
				brand.setB_name("屈臣氏");
				flag = QCS;
			}else if(BL.equals(b_name)){
				brand.setB_name("冰露");
				flag = BL;
			}else if(DNYL.equals(b_name)){
				brand.setB_name("达能益力");
				flag = DNYL;
			}	
			good.setBrand(brand);
		}
		if(!"".equals(g_name)){
			good.setG_name(g_name);
		}
		
		mv.addObject("brand",flag);
		mv.addObject("startPage", startPage);//回传指定页码
		mv.addObject("count",goodsService.findAll(good).size());//总记录数
		mv.addObject("goods",goodsService.findPage(good,startPage, pageSize));//指定页码的商品数
		//mv.addObject("goods",goodsService.findAll(good));
		mv.setViewName("goods");
		return mv;
	}
	
	/*
	 * 添加、修改
	 * */
	@RequestMapping("/upload")
	@ResponseBody
	public Object upload(@RequestParam("himg") String img,@RequestParam("g_imgUrl") MultipartFile file,@RequestParam("g_name")String name,
			@RequestParam("g_price")double price,@RequestParam("category")int c,@RequestParam("g_id")int g_id,@RequestParam("brand")int b) throws Exception{
		Goods good = new Goods();
		Goods G = new Goods();
		Brand brand = new Brand();
		brand.setB_id(b);
		good.setBrand(brand);
		if(g_id!=0){//为0则是添加，否则是修改
			G.setG_id(g_id);
		}
		G.setG_name(name);
		G = goodsService.findByName(G);
		if(G!=null){
			return "已存在该名称水源";
		}
		if (file.isEmpty()){
			if(img==null||img.length()<1){
				return "图片文件为空或有误";
			}else{
				Category category = new Category();
				category.setC_id(c);
				good.setCategory(category);
				good.setG_imgUrl(File.separator+UPLOAD_DIRECTORY+img);
				good.setG_name(name);
				good.setG_price(price);
				good.setG_id(g_id);
				goodsService.edit(good);
				return "success";
			}
			
		}else {
			try {
				// getOriginalFilename()是包含源文件后缀的全名
				String filePath = request.getServletContext().getRealPath("/")+UPLOAD_DIRECTORY+file.getOriginalFilename();
				File saveDir = new File(filePath);
				if (!saveDir.getParentFile().exists()){
					saveDir.getParentFile().mkdirs();
					file.transferTo(saveDir);
				}
				
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
	
	/*
	 * 购物车
	 * */
	
	@RequestMapping("/loadByID")
	public Object loadByID(@RequestParam("g_id") int g_id,ModelAndView mv) throws Exception{
		mv.addObject("good",goodsService.load(g_id));
		mv.setViewName("Product");
		return mv;
	}
	
	@RequestMapping("/addc")
	@ResponseBody
	public String addc(@RequestParam("data")String Cars) throws JsonParseException, JsonMappingException, IOException{
		//jackson对象  
	    ObjectMapper mapper = new ObjectMapper();  
	    //使用jackson将json转为List<BuyCar>  
	    JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class, BuyCar.class);	     
	    List<BuyCar> buyCars =  (List<BuyCar>)mapper.readValue(Cars, jt); 
		try {
			
			goodsService.add(buyCars);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
}
