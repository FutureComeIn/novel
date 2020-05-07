package com.yxw.xiaoshuospring.services;

import java.util.HashMap;

import com.yxw.xiaoshuospring.pojo.Chongzhi;

public interface IChongzhiServices {
	public Integer insertChongzhi(Chongzhi chongzhi); 
	public HashMap<String,Object> selectChongzhi(Chongzhi chongzhi,Integer indexPage);
	
	public Integer shenhe(Chongzhi chongzhi);
	public Integer deleteChongzhiById(Integer id); 
}
