package com.java.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.BuyCarMapper;
import com.java.mapper.CategoryMapper;
import com.java.mapper.GoodsMapper;
import com.java.po.BuyCar;
import com.java.po.Category;
import com.java.po.Goods;
import com.java.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private BuyCarMapper buyCarMapper; 
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
	/*
	 * 购物车
	 * */
	@Override
	public List<BuyCar> findAll(int u_id) throws Exception {
		
		return buyCarMapper.findAll(u_id);
	}
	@Override
	public BuyCar findByGid(BuyCar buyCar) throws Exception {
		
		return buyCarMapper.findByGidandUid(buyCar);
	}
	@Override
	public String update(BuyCar buyCar) {
		try {
			buyCarMapper.update(buyCar);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
		
	}
	@Override
	public String add(List<BuyCar> buyCars)  {
		try {
			BuyCar buyCar = new BuyCar();
			BuyCar b = new BuyCar();
			Iterator<BuyCar> it = buyCars.iterator();//迭代器
			while(it.hasNext()){
				b = it.next();
				buyCar = buyCarMapper.findByGidandUid(b);
				if(buyCar!=null){
					b.setBuyNum(buyCar.getBuyNum()+b.getBuyNum());//数量相加
					buyCarMapper.update(b);//更新数据
					it.remove();//除去已有数据
				}
			}
			if(buyCars.size()<1){
				return "success";
			}
			buyCarMapper.add(buyCars);//添加新数据
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	@Override
	public String del(int[] array,int u_id){
		try {
			buyCarMapper.del(array,u_id);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}
	@Override
	public BuyCar findByID(BuyCar buyCar) throws Exception {
		
		return buyCarMapper.findByID(buyCar);
	}
	
	

}
