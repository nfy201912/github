package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.po.User;

@Mapper
public interface UserMapper {
	//登入查询	
	public User find(User user) throws Exception;
	//注册
	public boolean register(User user) throws Exception;
	//激活码查询
	public User activeFind(User user) throws Exception; 
	//激活用户
	public boolean statusUpdate(User user) throws Exception;
	//查询所有用户
	public List<User> findAll(User user) throws Exception;
	//删除用户
	public void delete(int[] array) throws Exception;
	//添加单个用户
	public void add(User user) throws Exception;
	//批量添加用户
	public void addUsers(List<User> users) throws Exception;
}
