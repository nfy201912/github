package com.java.mapper;

import java.util.List;

import com.java.po.Brand;

public interface BrandMapper {
		//查询所有品牌
		public List<Brand> findAll() throws Exception;
		//添加品牌
		public void add(Brand brand)throws Exception;
		//删除品牌
		public void delete(int[] array)throws Exception;
		//修改品牌
		public void edit(Brand brand)throws Exception;
		//加载品牌
		public Brand load(int b_id)throws Exception;
		//名称查询
		public Brand findByName(Brand brand) throws Exception;
}
