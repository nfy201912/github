package com.java.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.po.Admin;
import com.java.po.User;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		Admin admin = (Admin)session.getAttribute("admin");
		String url = request.getRequestURI();
		
		if(url!=null){
			if(url.indexOf("login.jsp")>=0||url.indexOf("index.jsp")>=0||url.indexOf("Register.jsp")>=0){//登入、注册、首页放行
				chain.doFilter(req, res);
			}else if(user!=null&& admin!=null){
				chain.doFilter(req, res);
			}
			
			else if(url.contains("normal")||url.contains("admin")){
			 if(user!=null){//用户不为空
					if(url.contains("normal")){//访问用户部分
						chain.doFilter(req,res);
					}else{
						response.sendRedirect(request.getContextPath()+"/login.jsp");
					}
				}else{//用户为空
					if(admin!=null&&url.contains("admin")){//管理员不为空且访问管理员部分
						chain.doFilter(req, res);
					}else{
						if(url.contains("normal")){//访问用户部分
							response.sendRedirect(request.getContextPath()+"/login.jsp");
						}else{
							response.sendRedirect(request.getContextPath()+"/login.jsp");
						}
					}
				}
			
			}
			
		}			
		
	}
	@Override
	public void destroy() {
	}
}
