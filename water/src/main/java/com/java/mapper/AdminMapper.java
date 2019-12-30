package com.java.mapper;

import java.util.List;

import com.java.po.Admin;

public interface AdminMapper {
	//管理员登入
	public Admin login(Admin admin)throws Exception;
	//添加管理员
	public void insert(Admin admin) throws Exception;
	//查询所有管理员
	public List<Admin>  findUsers()throws Exception;
	
	//删除管理员
	public void delete(int[] array) throws Exception;
	//根据id查询amdin
	public Admin loadById(int aid) throws Exception;
	//查询名称是否唯一
	public List<Admin> unique(Admin admin) throws Exception;
	//更新amdin信息
	public void update(Admin admin) throws Exception;
}
