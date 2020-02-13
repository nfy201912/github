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
	public void add(Goods goods) throws Exception {
		goodsMapper.add(goods);
		
	}
	@Override
	public void delete(int[] array) throws Exception {
		goodsMapper.delete(array);
		
	}
	@Override
	public void edit(Goods goods) throws Exception {
		goodsMapper.edit(goods);
		
	}
	@Override
	public Goods findByName(Goods goods) throws Exception {
		
		return goodsMapper.findByName(goods);
	}
	@Override
	public Goods load(int g_id) throws Exception {
		
		return goodsMapper.load(g_id);
	}
	@Override
	public List<Goods> findAll(Goods good) throws Exception {
		
		return goodsMapper.findAll(good);
	}
	@Override
	public List<Goods> findPage(Goods good,int startPage, int pageSize) throws Exception {
		String b_name = null;
		if(good.getBrand()!=null){
			b_name = good.getBrand().getB_name();
		}
		int count = goodsMapper.findAll(good).size();//总记录数
		int startCount = pageSize*(startPage-1); //查询页
		return goodsMapper.findPage(b_name,good.getG_name(),startCount, pageSize);
	}

}
