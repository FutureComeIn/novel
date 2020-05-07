package com.yxw.xiaoshuospring.services;

import java.util.HashMap;

import com.yxw.xiaoshuospring.pojo.Liuyan;

public interface ILiuyanServices {
	public HashMap<String,Object> queryLiuyan(Liuyan liuyan,Integer indexPage);
	
	public Integer insertLiuyan(Liuyan liuyan);
	
	public Integer deleteLiuyan(Integer id);
	
}
