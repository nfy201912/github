package com.java.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import cn.dsna.util.images.ValidateCode;

import com.alibaba.fastjson.JSONObject;
import com.java.po.Admin;
import com.java.po.User;
import com.java.service.UserService;


@Controller
@RequestMapping("/user")
@SessionAttributes(value={"u"})
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public Object findAll(@RequestParam("u_username")String name) throws Exception{
		//String name = request.getParameter("adm_name");
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		User user = new User();
		if(name!=null&&!"".equals(name)){
			
			user.setU_username(name);
		}
		
			List<User> users = userService.findAll(user);
			jsonMap.put("rows", users);
			jsonMap.put("total",users.size());
			Object	jsonObject = JSONObject.toJSON(jsonMap);
			return jsonObject;
		
	}
	@RequestMapping("/add")
	@ResponseBody
	public String addUser(User user){
		try {
			if("success".equals(this.checkName(user))){
				userService.add(user);
				return "success";
			}
			return "账号已存在";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("array[]") int[] array){
		
		try {
			userService.delete(array);
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping(value={"/edit"})
	@ResponseBody
	public String edit(User user) throws Exception{
		
		return userService.update(user);
		
	}
	
	@RequestMapping(value={"/userLogin"},produces="text/html;charset=utf-8")
	@ResponseBody
	public String userLogin(User u,Model m,@RequestParam("rembPwd") String isR,@RequestParam("autoLogin") String autoLogin,HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(u==null){
			return "请输入账号密码";
		}
		
		//String isR = request.getParameter("rembPwd");
		String password = u.getU_password();
		User user = new User();
		user = userService.find(u);
		if(user.getU_username().equals(u.getU_username())){
	
			if(user!=null&&user.isU_status()){
				
				if (isR != null&&isR.equals("true")) {// 记住密码 复选框为勾选状态
					// 创建一个cookie
					Cookie name = new Cookie("username",user.getU_username()); // Cookie的名字是username
					name.setMaxAge(60 * 60 * 24 * 7); // 记住用户名为一个星期(cookie的存活时长为一个星期)
					name.setPath("/"); // 放到当前浏览目录下
					response.addCookie(name); // 把cookie写回到客户端

					// 记住密码
					Cookie pwd = new Cookie("password",password); // Cookie的名字是password
					pwd.setMaxAge(60 * 60 * 24 * 7); // 记住用户名为一个星期(cookie的存活时长为一个星期)
					pwd.setPath("/"); // 放到当前浏览目录下
					response.addCookie(pwd); // 把cookie写回到客户端

				} else {// 删除用户名操作
						// 获取所有的Cookie
					Cookie[] cookies = request.getCookies();
					// 循环取出每个Cookie
					for (int i = 0; i < cookies.length; i++) {
						// 判断Cookie的名字是不是 username 取消记住用户名
						if ("username".equals(cookies[i].getName())) {
							cookies[i].setMaxAge(0); // 把cookie的生命时长设置为0秒(删除Cookie)
							cookies[i].setPath("/"); // 放到当前浏览目录下
							response.addCookie(cookies[i]); // 把cookie写回到客户端
						}

						// 取消记住密码
						if ("password".equals(cookies[i].getName())) {
							cookies[i].setMaxAge(0); // 把cookie的生命时长设置为0秒(删除Cookie)
							cookies[i].setPath("/"); // 放到当前浏览目录下
							response.addCookie(cookies[i]); // 把cookie写回到客户端
						}
					}
				}
				//String autoLogin = request.getParameter("autoLogin");
				
				if (autoLogin!=null&&autoLogin.equalsIgnoreCase("true") ) {
					Cookie loginAuto = new Cookie("autoLogin", "autoLogin"); // Cookie的名字是username
					loginAuto.setMaxAge(60 * 60 * 24 * 7); // 记住用户名为一个星期(cookie的存活时长为一个星期)
					loginAuto.setPath("/"); // 放到当前浏览目录下
					response.addCookie(loginAuto); // 把cookie写回到客户端
				} else {
					// 获取所有的Cookie
					Cookie[] cookies = request.getCookies();
					// 循环取出每个Cookie
					for (int i = 0; i < cookies.length; i++) {
						// 判断Cookie的名字是不是 username 取消记住用户名
						if ("autoLogin".equals(cookies[i].getName())) {
							cookies[i].setMaxAge(0); // 把cookie的生命时长设置为0秒(删除Cookie)
							cookies[i].setPath("/"); // 放到当前浏览目录下
							response.addCookie(cookies[i]); // 把cookie写回到客户端
						}
					}
				}
				String rembPwd = request.getParameter("rembPwd");//记住密码
				if (rembPwd != null&&rembPwd.equals("true")) {
					Cookie loginAuto = new Cookie("rembPwd", "rembPwd"); // Cookie的名字是username
					loginAuto.setMaxAge(60 * 60 * 24 * 7); // 记住用户名为一个星期(cookie的存活时长为一个星期)
					loginAuto.setPath("/"); // 放到当前浏览目录下
					response.addCookie(loginAuto); // 把cookie写回到客户端
				} else {
					// 获取所有的Cookie
					Cookie[] cookies = request.getCookies();
					// 循环取出每个Cookie
					for (int i = 0; i < cookies.length; i++) {
						// 判断Cookie的名字是不是 username 取消记住用户名
						if ("rembPwd".equals(cookies[i].getName())) {
							cookies[i].setMaxAge(0); // 把cookie的生命时长设置为0秒(删除Cookie)
							cookies[i].setPath("/"); // 放到当前浏览目录下
							response.addCookie(cookies[i]); // 把cookie写回到客户端
						}
					}
				}
				m.addAttribute("u",user);
				return "SUCCESS";//成功
			}else{
				return "用户未激活";
			}
		}else{
			return user.getU_username();//返回错误信息
		}
		
	}
	
	//验证码
	@RequestMapping("/doValidateCode")
	protected void doValidateCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 参数一：图片宽度 参数二：高度 三：验证码的个数 四、验证码的颗粒多少
		ValidateCode vc = new ValidateCode(160, 40, 4, 20);

		// 把验证码存到session范围
		// String code = vc.getCode();
		request.getSession().setAttribute("code", vc.getCode());

		// 把图片写到页面
		vc.write(response.getOutputStream());
	}
	@RequestMapping("/load")
	@ResponseBody
	public User load(User user) throws Exception{
	
		return userService.loadByID(user);
	}
	//检查用户是否存在
	@RequestMapping("/checkName")
	@ResponseBody
	public String checkName(User user) throws Exception{
		
		User u = new User();
		u=userService.find(user);
		if(user.getU_username().equals(u.getU_username())){
			return "error";
		}
		return "success";
	}
	@RequestMapping("/acvtiveCode")
	public String active(@RequestParam("active") String active){
		User user = new User();
		user.setU_activeCode(active);
		
		try {
			if(userService.activeFind(user)){
				
				return "/login";
			}else{
				return "error";
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			//throw new RuntimeException("激活失败");
		}
		return "error";
	}
	
	@RequestMapping(value={"/exit"})
	public String exit(HttpSession session,SessionStatus sessionStatus){
		
		 session.removeAttribute("u");//我这里是先取出httpsession中的user属性
	     //session.invalidate();  //然后是让httpsession失效   删除所有
	     sessionStatus.setComplete();//最后是调用sessionStatus方法

		return "login";
	}
	
	@RequestMapping(value={"/validateCode"},produces="text/html;charset=utf-8")
	@ResponseBody
	public String validateCode(@RequestParam("validateCode") String validateCode,HttpServletRequest req){
		String code = req.getSession().getAttribute("code").toString();
		if(!code.equalsIgnoreCase(validateCode)){
			return "验证码错误";
		}
		
		return "success";
	}
	@RequestMapping("/register")
	@ResponseBody
	public String register(User user){
			
			user.setU_createTime(new Timestamp(new Date().getTime()));
			// 随机产生一个激活码
				String activerCoude = UUID.randomUUID().toString();
				user.setU_activeCode(activerCoude);
				
		try {
			
			userService.register(user);
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}
		
		
	}
}
