package com.java.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.java.po.Category;
import com.java.po.Goods;

public interface GoodsService {
	//查询所有水源
	public List<Goods> findAll() throws Exception;
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
}
