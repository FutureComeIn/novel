package com.yxw.xiaoshuospring.pojo;

public class Liuyan {
	private Integer id;//主键
	private String content;//内容
	private String shijian;//时间
	private Integer user_id;//用户ID
	private String userName; //留言用户名
	
	public Liuyan() {
		super();
	}

	public Liuyan(Integer id, String content, String shijian,
			Integer userId) {
		super();
		this.id = id;
		this.content = content;
		this.shijian = shijian;
		user_id = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer userId) {
		user_id = userId;
	}
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Liuyan [content=" + content + ", id=" + id + ", shijian="
				+ shijian +  ", user_id=" + user_id + "]";
	}
}
