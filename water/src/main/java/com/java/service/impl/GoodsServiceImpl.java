package com.java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.CategoryMapper;
import com.java.mapper.GoodsMapper;
import com.java.po.Category;
import com.java.po.Goods;
import com.java.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Override
	public List<Goods> findAll() throws Exception {
		
		return goodsMapper.findAll();
	}
	@Override
	public void add(Goods goods) throws Exception {
		goodsMapper.add(goods);
		
	}

}