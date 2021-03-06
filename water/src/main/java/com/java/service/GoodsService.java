package com.java.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.java.po.BuyCar;
import com.java.po.Category;
import com.java.po.Goods;

public interface GoodsService {
	//查询所有水源
	public List<Goods> findAll(Goods good) throws Exception;
	//添加水源
	public void add(Goods goods) throws Exception;
	//删除水源
	public void delete(int[] array) throws Exception;
	//修改水源
	public void edit(Goods goods) throws Exception;
	//根据名称查询水源
	public Goods findByName(Goods goods)throws Exception;
	//根据ID查询水源
	public Goods load(int g_id) throws Exception;
	//页码内容查询
	public List<Goods> findPage(Goods good,int startPage,int pageSize) throws Exception;
	/*
	 * 购物车
	 * */
	public List<BuyCar> findAll(int u_id) throws Exception;
	public BuyCar findByGid(BuyCar buyCar) throws Exception;
	public String update(BuyCar buyCar) throws Exception;
	public String add(List<BuyCar> buyCars) throws Exception;
	public String del(@Param("bc_id")int[] bc_id,@Param("u_id")int u_id) throws Exception;
	public BuyCar findByID(BuyCar buyCar) throws Exception;
}
