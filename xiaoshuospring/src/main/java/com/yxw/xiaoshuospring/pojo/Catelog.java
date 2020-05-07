package com.yxw.xiaoshuospring.pojo;

public class Catelog {
	private Integer id;//主键
	private String name;//分类名称
	
	
	public Catelog() {
		super();
	}


	public Catelog(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "Catelog [ id=" + id + ", name=" + name + "]";
	}
	
	
	
}
