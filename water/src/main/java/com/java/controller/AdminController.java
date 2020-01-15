package com.java.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.java.po.Admin;
import com.java.service.AdminService;

@Controller
@RequestMapping(value={"/admin"})
@SessionAttributes(value={"admin"})
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping(value={"/login"},produces="text/html;charset=utf-8")
	@ResponseBody
	public String login(Admin admin,Model m){
		String info = "";
		try {
			Admin adm = new Admin();
			adm = adminService.login(admin,(int)1);
			
			if(adm.getAdm_name().equals(admin.getAdm_name())){//如果名称不变则成功
				m.addAttribute("admin",adm);
				info="SUCCESS";
			}else{
				info = adm.getAdm_name();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}
	@RequestMapping(value={"/checkName"},produces="text/html;charset=utf-8")
	@ResponseBody
	public String checkName(@RequestParam("adm_name") String name){
		Admin admin = new Admin();
		admin.setAdm_name(name);
			try {
				if(adminService.login(admin,(int)2)!=null){
				
					return "用户已存在";
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
		
		return "";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String register(Admin admin){
		if(admin!=null){
			try {
				if(adminService.insert(admin)){
					return "success";
				}
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		
		return "error";
	}
	
	@RequestMapping("/findUsers")
	public ModelAndView findUsers(ModelAndView mv){
		try {
			mv.addObject("admins", adminService.findUsers());
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.setViewName("/admin/user/listuser");
		return mv; 
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public Object findAll() throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
			List<Admin> admins = adminService.findUsers();
			jsonMap.put("rows", admins);
			jsonMap.put("total",admins.size());
			Object	jsonObject = JSONObject.toJSON(jsonMap);
			return jsonObject;
		
	}
	
	
	@RequestMapping("/loadById")
	public ModelAndView loadById(@RequestParam("aid") int aid,ModelAndView mv){
		mv.setViewName("/admin/user/edituser");
		try {
			Admin adm = adminService.loadById(aid);
			
			mv.addObject("adm",adm);
			
			return mv;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value={"/edit"},produces="text/html;charset=utf-8")
	@ResponseBody
	public String edit(Admin admin,HttpServletResponse res) throws IOException{
		
		String info = "";
		try {
			info = adminService.unique(admin);
			if(info.equals("更新成功")){
				adminService.update(admin);
				System.out.println(info);
				
			}else{
				System.out.println(info);
				
			}
		} catch (Exception e1) {
			
			e1.printStackTrace();
		}
		
		return info;
		
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestParam("array[]") int[] array,@RequestParam("id") int id){
		
		for(int ids:array){
			
			if(id==ids){
				
				return false;
			}	
		}
		try {
			
			adminService.delete(array);
			return true;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session,SessionStatus sessionStatus){
	
		session.removeAttribute("admin");
		session.invalidate();
		sessionStatus.setComplete();
		
		return "/login";
	}
}








