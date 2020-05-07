package com.yxw.xiaoshuospring.pojo;

import java.util.List;

public class BookData {
	private List<Book> blist;
	private int pageNum;  //页数
	
	public BookData() {
		super();
	}

	public BookData(List<Book> blist, int pageNum) {
		super();
		this.blist = blist;
		this.pageNum = pageNum;
	}

	public List<Book> getBlist() {
		return blist;
	}

	public void setBlist(List<Book> blist) {
		this.blist = blist;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "BookData [blist=" + blist + ", pageNum=" + pageNum + "]";
	}
	
	
	
	

}
