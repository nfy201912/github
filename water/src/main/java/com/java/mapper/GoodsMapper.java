package com.java.mapper;

import java.util.List;

import com.java.po.Goods;

public interface GoodsMapper {
	//查询所有水源
	public List<Goods> findAll() throws Exception;
	//添加水源
	public void add(Goods goods) throws Exception;
}