package com.yxw.xiaoshuospring.services;

import java.util.HashMap;
import java.util.List;

import com.yxw.xiaoshuospring.pojo.Gonggao;

public interface IGonggaoServices {
	//查询所有公告
	public List<Gonggao> queryGonggao(); 
	
	//查询所有公告——后台
	public HashMap<String,Object> queryGonggao_ht(Integer indexPage); 
	
	public Integer insertGonggao(Gonggao gonggao);
	
	public Integer deleteGonggao(Integer id);
}
