package com.yxw.xiaoshuospring.utils;

public class Pages {
	
	//总记录数
	private Integer rowCount;
	//总页数
	private Integer pageCount;
	//每页大小
	private Integer pageSize;
	//当前页
	private Integer indexPage;
	//开始行
	private Integer beginRow;
	//结束行
	private Integer endRow;
	
	public Pages() {
		
	}
	public Pages(Integer rowCount) {
		this.rowCount = rowCount;
		this.pageSize = 3;
		this.indexPage = 1;
	}
	
	public Integer getRowCount() {
		return rowCount;
	}

	public Integer getPageCount() {
		return getRowCount() % getPageSize() == 0 ? getRowCount() / getPageSize() : getRowCount() / getPageSize() + 1;
	}

	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getIndexPage() {
		return indexPage;
	}
	public void setIndexPage(Integer indexPage) {
		this.indexPage = indexPage;
	}

	public Integer getBeginRow() {
		return (getIndexPage() - 1) * getPageSize();
	}

	public Integer getEndRow() {
		return  getIndexPage() * getPageSize()-1;
	}
	@Override
	public String toString() {
		return "Pages [rowCount=" + rowCount + ", pageCount=" + pageCount + ", pageSize=" + pageSize + ", indexPage="
				+ indexPage + ", beginRow=" + beginRow + ", endRow=" + endRow + "]";
	}
	
	
}
