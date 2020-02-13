package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.po.Goods;

public interface GoodsMapper {
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
	public List<Goods> findPage(@Param("b_name")String b_name,@Param("g_name")String g_name,@Param("startPage")int startPage,@Param("pageSize")int pageSize) throws Exception;
}
