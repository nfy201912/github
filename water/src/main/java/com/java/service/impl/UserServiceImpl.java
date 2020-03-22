package com.java.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
	
	public User find(User user) throws Exception {//用户登入,注册、添加(用户名是否重复)
		User u = new User();
		u.setU_username(user.getU_username());
		
		if(userMapper.find(u)==null){//登入时检验
			
			u.setU_username("账号错误");
			return u;
		}
		if(user.getU_password()!=null){//登入
			user.setU_password(MD5Util.md5Password(user.getU_password()));
			u.setU_password(user.getU_password());
			if(userMapper.find(u)==null){
				u.setU_username("密码错误");
				return u;
			}
		}
			
			
			u = userMapper.find(u);
		
		return u;
	
	}

	public boolean activeFind(User user) throws Exception {
		User u = new User();
		u=userMapper.activeFind(user);
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
		user.setU_status(false);
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
	public List<User> findAll(User user) throws Exception {
		
		return userMapper.findAll(user);
	}

	@Override
	public void delete(int[] array) throws Exception {
		userMapper.delete(array);
		
	}

	@Override
	public void add(User user) throws Exception {
		user.setU_activeCode("byHand");
		user.setU_createTime(new Timestamp(System.currentTimeMillis()));//获取当前系统时间
		userMapper.add(user);
		
	}

	@Override
	public void addUsers(List<User> users) throws Exception {
		userMapper.addUsers(users);
		
	}

	@Override
	public String update(User user) {
		try {
			
			if(user.getU_password()!=null){
				String pwd = userMapper.loadByID(user).getU_password();
				if(!pwd.equals(user.getU_password())){//密码是否有改动
					user.setU_password(MD5Util.md5Password(user.getU_password()));//密码加密
				}				
			}
			userMapper.update(user);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}

	@Override
	public User loadByID(User user) throws Exception {
		
		return userMapper.loadByID(user);
	}

	@Override
	public User validateEmail(User user) throws Exception {
		return userMapper.validateEmail(user);
	}

	@Override
	public void updateValidateCode(User user) throws Exception {
		String code = String.format("%04d",new Random().nextInt(9999));//四位验证码
		String emailMsg = "这是您的验证码:"+code+"，请注意查收(有效时长为60s)。";
		SendJMail.sendMail(user.getU_email(),emailMsg);
		user.setU_sendTime(new Timestamp(new Date().getTime()));
		user.setU_validate(code);
		userMapper.updateValidateCode(user);
		
	}

	@Override
	public void updatePWD(User user) throws Exception {
		user.setU_password(MD5Util.md5Password(user.getU_password()));//加密
		userMapper.updatePWD(user);
		
	}

	

	

}
