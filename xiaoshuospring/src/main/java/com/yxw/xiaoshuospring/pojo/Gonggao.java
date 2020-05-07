package com.yxw.xiaoshuospring.pojo;

public class Gonggao {
	private Integer id;//主键ID
	private String title;//标题
	private String content;//内容 
	private String sendtime;//发布时间
	
	public Gonggao() {
		super();
	}

	public Gonggao(Integer id, String title, String content, String sendtime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.sendtime = sendtime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	@Override
	public String toString() {
		return "Gonggao [content=" + content + ", id=" + id + ", sendtime="
				+ sendtime + ", title=" + title + "]";
	}
	
	
	

}
