package com.java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.UserMapper;
import com.java.po.User;
import com.java.service.UserService;
import com.java.util.MD5Util;
import com.java.util.SendJMail;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	public User find(User user) throws Exception {
		User u = new User();
		//加密
		
	if(user.getU_password()!=null){
		user.setU_password(MD5Util.md5Password(user.getU_password()));
		
	}
		u.setU_username(user.getU_username());
		
		if(userMapper.find(u)==null){
			
			u.setU_username("账号错误");
			return u;
		}
			u.setU_password(user.getU_password());
		if(userMapper.find(u)==null){
			u.setU_username("密码错误");
			return u;
		}
			
			u = userMapper.find(user);
		
		return u;
	
	}

	public boolean activeFind(User user) throws Exception {
		User u = new User();
		u=userMapper.activeFind(user);
		System.out.println(u);
		if(u!=null){
			u.setU_status(true);
			userMapper.statusUpdate(u);
			return true;
		}
		return false ;
	}

	public boolean register(User user) throws Exception {
		if(user ==null){
			throw new RuntimeException("对象是空的");
		}
		
		String password = user.getU_password();
		//把密码加密之后返回一个加密代码
		String md5password = MD5Util.md5Password(password);
		
		user.setU_password(md5password);
		try {
			userMapper.register(user);
			//给用户发送一份邮件            emailMsg：内容
			String emailMsg = "用户注册成功，点击<a href='http://localhost:8080/user/acvtiveCode?active=" + user.getU_activeCode() + "'>激活</a>用户";
			SendJMail.sendMail(user.getU_email(), emailMsg);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("用户注册失败");
		}
		return true;
	}

	@Override
	public List<User> findAll() throws Exception {
		
		return userMapper.findAll();
	}

	@Override
	public void delete(int[] array) throws Exception {
		userMapper.delete(array);
		
	}

	

}
