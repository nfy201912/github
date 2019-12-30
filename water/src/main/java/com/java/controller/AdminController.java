package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value={"/checkName"})
	@ResponseBody
	public boolean checkName(Admin admin){
			
			try {
				if(adminService.login(admin,(int)2)!=null){
				
					return false;
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
		
		return true;
	}
	
	@RequestMapping("/add")
	public String register(Admin admin){
		
		try {
			if(adminService.insert(admin)){
				return "/admin/index";
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "/admin/user/adduser";
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
			System.out.println(ids+"-------------"+id);
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
	public String exit(HttpSession session){
	
		session.removeAttribute("admin");
		
		return "adminLogin";
	}
}








