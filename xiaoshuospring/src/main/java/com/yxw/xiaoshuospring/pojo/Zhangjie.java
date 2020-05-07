package com.yxw.xiaoshuospring.pojo;

public class Zhangjie {
	private Integer id;//主键
	private Integer book_id;//所属小说ID
	private String bookName;//小说名称
	private String mingcheng;//章节名称
	private String neirong;//章节内容
	
	
	public Zhangjie() {
		super();
	}

	public Zhangjie(Integer id, Integer bookId, String bookName, String mingcheng, String neirong) {
		super();
		this.id = id;
		this.book_id = bookId;
		this.bookName = bookName;
		this.mingcheng = mingcheng;
		this.neirong = neirong;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBook_id() {
		return book_id;
	}
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setBook_id(Integer bookId) {
		book_id = bookId;
	}
	
	public String getMingcheng() {
		return mingcheng;
	}
	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}

	@Override
	public String toString() {
		return "Zhangjie [id=" + id + ", book_id=" + book_id + ", bookName=" + bookName + ", mingcheng=" + mingcheng
				+ ", neirong=" + neirong + "]";
	}
	
	

}
