package com.yxw.xiaoshuospring.pojo;

public class Admin {
	private Integer id; //管理员ID
	private String userName; //登陆名
	private String userPw ;//密码
	
	
	public Admin() {
		super();
	}
	
	public Admin(Integer id, String userName, String userPw) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPw = userPw;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", userName=" + userName + ", userPw="
				+ userPw + "]";
	}
	
	

}
