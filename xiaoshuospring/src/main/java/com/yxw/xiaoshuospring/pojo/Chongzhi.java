package com.yxw.xiaoshuospring.pojo;

public class Chongzhi {
	private Integer id;//主键
	private Integer user_id;//用户id
	private String userName;//用户名
	private Integer dianquan;//金额
	private String fukuanfangshi ; //付款方式
	private String shijian;//充值时间
	private String zhuangtai;//状态 审核  or 未审核
	
	
	public Chongzhi() {
		super();
	}
	public Chongzhi(Integer id, Integer user_id, Integer dianquan, String fukuanfangshi, String shijian,
			String zhuangtai) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.dianquan = dianquan;
		this.fukuanfangshi = fukuanfangshi;
		this.shijian = shijian;
		this.zhuangtai = zhuangtai;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getDianquan() {
		return dianquan;
	}
	public void setDianquan(Integer dianquan) {
		this.dianquan = dianquan;
	}
	public String getFukuanfangshi() {
		return fukuanfangshi;
	}
	public void setFukuanfangshi(String fukuanfangshi) {
		this.fukuanfangshi = fukuanfangshi;
	}
	public String getShijian() {
		return shijian;
	}
	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	public String getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Chongzhi [id=" + id + ", user_id=" + user_id + ", dianquan=" + dianquan + ", fukuanfangshi="
				+ fukuanfangshi + ", shijian=" + shijian + ", zhuangtai=" + zhuangtai + "]";
	}
	

}
