package com.java.service;

import java.util.List;

import com.java.po.User;

public interface UserService {
	//登入
	public User find(User user) throws Exception;
	//注册
	public boolean register(User user) throws Exception;
	//激活码查询
	public boolean activeFind(User user) throws Exception; 
	//查询所有用户
	public List<User> findAll() throws Exception;
	//删除用户
	public void delete(int[] array) throws Exception;
	
}
