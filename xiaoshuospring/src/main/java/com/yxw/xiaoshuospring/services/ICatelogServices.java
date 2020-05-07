package com.yxw.xiaoshuospring.services;

import java.util.List;

import com.yxw.xiaoshuospring.pojo.Catelog;

public interface ICatelogServices {
	//查询所有图书类目
	public List<Catelog> queryCatelog(); 
	
	public Integer deleteCatelog(Integer id);
	public Integer insertCatelog(String name);
	public Catelog queryCatelogName(Integer id);
	public Integer updateCatelog(Catelog catelog);
}
