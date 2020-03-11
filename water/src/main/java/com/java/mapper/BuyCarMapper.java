package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.po.BuyCar;

public interface BuyCarMapper {
	public List<BuyCar> findAll(@Param("u_id")int u_id) throws Exception;
	public BuyCar findByGidandUid(BuyCar buyCar) throws Exception;
	public void update(BuyCar buyCar) throws Exception;
	public void add(List<BuyCar> buyCars) throws Exception;
	public void del(@Param("array")int[] bc_id,@Param("u_id")int u_id) throws Exception;
	public BuyCar findByID(BuyCar buyCar) throws Exception;
}
