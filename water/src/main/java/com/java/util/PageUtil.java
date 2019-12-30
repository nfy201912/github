package com.java.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil<E> {
	//��ҳ
	private int firstPage = 1;
	//��ǰҳ��
	private int currentPage;
	//ÿҳ��ʾ��������¼
	private int pageSize;
	//��һҳ
	private int previousPage;
	//��һҳ
	private int nextPage;
	//��ҳ��
	private int totalPage;
	//��ʼֵ
	private int startIndex;
	//����ֵ
	private int endIndex;
	//�ܼ�¼��
	private int record;
	//ʹ�ü��ϴ洢����
	private List<E> list = new ArrayList<E>();

	//���췽��  
	public PageUtil(int currentPage,int pageSize,int record){   //2    3     10
		this.currentPage = currentPage;		//��ǰҳ��
		this.pageSize = pageSize;			//ÿҳ��ʾ�ļ�¼��
		this.record = record;				//�ܼ�¼��
	}

	//��ҳ
	public int getFirstPage() {
		return firstPage;
	}

	//��ǰҳ��(�Ѿ�ʹ�ù��췽��������ֵ)
	public int getCurrentPage() {
		return currentPage;
	}
	
	//ÿ����ʾ�ļ�¼��(�Ѿ�ʹ�ù��췽��������ֵ)
	public int getPageSize() {
		return pageSize;
	}
	
	//��һҳ
	public int getPreviousPage() {
		//��ǰҳ�� - 1 < 1 ? 1 : ��ǰҳ�� - 1
		previousPage = currentPage - 1 < 1 ? 1 : currentPage - 1;
		return previousPage;
	}

	//��һҳ
	public int getNextPage() {
		//��ǰҳ�� + 1 > ��ҳ�� ����ҳ : ��ǰҳ�� + 1
		nextPage = currentPage + 1 > this.getTotalPage() ?  this.getTotalPage() : currentPage + 1;
		return nextPage;
	}

	//��ҳ��
	public int getTotalPage() {
		//(�ܼ�¼�� - 1) / ÿҳ�ļ�¼�� + 1
		totalPage = (record -1) / pageSize + 1;
		return totalPage;
	}

	//��ʼֵ
	public int getStartIndex() {
		// (��ǰҳ�� - 1) * ÿҳ�ļ�¼�� +1
		startIndex = (currentPage -1) * pageSize + 1;
		return startIndex;
	}

	//����ֵ
	public int getEndIndex() {
		// ��ǰҳ�� * ÿҳ�ļ�¼��
		endIndex = currentPage * pageSize;
		return endIndex;
	}

	//�ܼ�¼��
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
