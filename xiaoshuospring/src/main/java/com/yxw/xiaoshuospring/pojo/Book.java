package com.yxw.xiaoshuospring.pojo;

public class Book {
	private Integer id ;//主键
	private Integer catelog_id;//所属类别
	private String catelogName; //类别名称
	private String name;//小说名称
	private String zuozhe;//小说作者
	private Integer dianquan ;//所需点券
	private String jieshao;//小说介绍 
	private String fujian;//附件路径
	private String fabushijian;//发布时间
	
	
	
	public Book() {
		super();
	}

	public Book(Integer id, Integer catelog_id,String catelogName, String name, String zuozhe, Integer dianquan, String jieshao,
			String fujian, String fabushijian) {
		super();
		this.id = id;
		this.catelog_id = catelog_id;
		this.catelogName=catelogName;
		this.name = name;
		this.zuozhe = zuozhe;
		this.dianquan = dianquan;
		this.jieshao = jieshao;
		this.fujian = fujian;
		this.fabushijian = fabushijian;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCatelog_id() {
		return catelog_id;
	}

	public void setCatelog_id(Integer catelog_id) {
		this.catelog_id = catelog_id;
	}

	public String getCatelogName() {
		return catelogName;
	}

	public void setCatelogName(String catelogName) {
		this.catelogName = catelogName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZuozhe() {
		return zuozhe;
	}

	public void setZuozhe(String zuozhe) {
		this.zuozhe = zuozhe;
	}

	public Integer getDianquan() {
		return dianquan;
	}

	public void setDianquan(Integer dianquan) {
		this.dianquan = dianquan;
	}

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getFabushijian() {
		return fabushijian;
	}

	public void setFabushijian(String fabushijian) {
		this.fabushijian = fabushijian;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", catelog_id=" + catelog_id + ", catelogName=" + catelogName + ", name=" + name
				+ ", zuozhe=" + zuozhe + ", dianquan=" + dianquan + ", jieshao=" + jieshao + ", fujian=" + fujian
				+ ", fabushijian=" + fabushijian + "]";
	}

	
	

	
}
