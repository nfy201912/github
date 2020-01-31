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
}
