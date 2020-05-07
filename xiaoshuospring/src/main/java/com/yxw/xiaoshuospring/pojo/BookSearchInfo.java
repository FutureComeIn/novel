package com.yxw.xiaoshuospring.pojo;

public class BookSearchInfo {
	private String name;
	private String author;
	private int catelog_id;
	
	public BookSearchInfo() {
		super();
	}

	public BookSearchInfo(String name, String author,int catelog_id) {
		super();
		this.name = name;
		this.author = author;
		this.catelog_id=catelog_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	

	public int getCatelog_id() {
		return catelog_id;
	}

	public void setCatelog_id(int catelogId) {
		catelog_id = catelogId;
	}

	@Override
	public String toString() {
		return "BookSearchInfo [author=" + author + ", catelog_id="
				+ catelog_id + ", name=" + name + "]";
	}

	
	
	
	
	

}
