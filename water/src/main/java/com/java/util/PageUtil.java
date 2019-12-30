package com.java.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil<E> {
	//首页
	private int firstPage = 1;
	//当前页码
	private int currentPage;
	//每页显示多少条记录
	private int pageSize;
	//上一页
	private int previousPage;
	//下一页
	private int nextPage;
	//总页数
	private int totalPage;
	//起始值
	private int startIndex;
	//结束值
	private int endIndex;
	//总记录数
	private int record;
	//使用集合存储数据
	private List<E> list = new ArrayList<E>();

	//构造方法  
	public PageUtil(int currentPage,int pageSize,int record){   //2    3     10
		this.currentPage = currentPage;		//当前页码
		this.pageSize = pageSize;			//每页显示的记录数
		this.record = record;				//总计录数
	}

	//首页
	public int getFirstPage() {
		return firstPage;
	}

	//当前页码(已经使用构造方法赋有了值)
	public int getCurrentPage() {
		return currentPage;
	}
	
	//每面显示的记录数(已经使用构造方法赋有了值)
	public int getPageSize() {
		return pageSize;
	}
	
	//上一页
	public int getPreviousPage() {
		//当前页码 - 1 < 1 ? 1 : 当前页码 - 1
		previousPage = currentPage - 1 < 1 ? 1 : currentPage - 1;
		return previousPage;
	}

	//下一页
	public int getNextPage() {
		//当前页码 + 1 > 总页数 ？总页 : 当前页码 + 1
		nextPage = currentPage + 1 > this.getTotalPage() ?  this.getTotalPage() : currentPage + 1;
		return nextPage;
	}

	//总页数
	public int getTotalPage() {
		//(总记录数 - 1) / 每页的记录数 + 1
		totalPage = (record -1) / pageSize + 1;
		return totalPage;
	}

	//起始值
	public int getStartIndex() {
		// (当前页码 - 1) * 每页的记录数 +1
		startIndex = (currentPage -1) * pageSize + 1;
		return startIndex;
	}

	//结束值
	public int getEndIndex() {
		// 当前页码 * 每页的记录数
		endIndex = currentPage * pageSize;
		return endIndex;
	}

	//总计录数
	public int getRecord() {
		return record;
	}
	

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}
	
}
