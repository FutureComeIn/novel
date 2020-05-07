package com.yxw.xiaoshuospring.pojo;

public class User {
	private Integer userId;//用户ID  主键
	private String loginname;//登陆名
	private String loginpw;//登陆密码
	private String sex;//性别
	private Integer age;//年龄
	private String tel;//电话
	private String email;//邮箱
	private Integer dianquan;//点券值
	private String registerTime; //注册时间
	private String del;//是否删除
	
	public User() {
		super();
	}

	public User(Integer userId, String loginname, String loginpw, String sex, Integer age, String tel, String email,
			Integer dianquan, String registerTime,String del) {
		super();
		this.userId = userId;
		this.loginname = loginname;
		this.loginpw = loginpw;
		this.sex = sex;
		this.age = age;
		this.tel = tel;
		this.email = email;
		this.dianquan = dianquan;
		this.registerTime = registerTime;
		this.del = del;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpw() {
		return loginpw;
	}

	public void setLoginpw(String loginpw) {
		this.loginpw = loginpw;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getDianquan() {
		return dianquan;
	}

	public void setDianquan(Integer dianquan) {
		this.dianquan = dianquan;
	}
	
	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", loginname=" + loginname + ", loginpw=" + loginpw + ", sex=" + sex
				+ ", age=" + age + ", tel=" + tel + ", email=" + email + ", dianquan=" + dianquan + ", registerTime="
				+ registerTime + ", del=" + del + "]";
	}


	
	
	
	
}
