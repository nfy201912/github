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
	//用户修改
	public void update(User user) throws Exception;
	//用户查询
	public User loadByID(User user) throws Exception;
	//验证(修改密码)
	public User validateEmail(User user) throws Exception;
	//更新验证码(修改密码)
	public void updateValidateCode(User user) throws Exception;
	//修改密码
	public void updatePWD(User user) throws Exception;
	
}
