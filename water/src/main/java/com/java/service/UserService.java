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
	public List<User> findAll(User user) throws Exception;
	//删除用户
	public void delete(int[] array) throws Exception;
	//添加单个用户
	public void add(User user) throws Exception;
	//批量添加用户
	public void addUsers(List<User> users) throws Exception;
	//用户修改
	public String update(User user) throws Exception;
	//用户查询
	public User loadByID(User user) throws Exception;
}
