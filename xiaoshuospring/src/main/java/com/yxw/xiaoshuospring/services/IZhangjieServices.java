package com.yxw.xiaoshuospring.services;

import java.util.HashMap;
import java.util.List;

import com.yxw.xiaoshuospring.pojo.Zhangjie;

public interface IZhangjieServices {
	public HashMap<String,Object> selectZhangjie(Integer book_id,Integer indexPage);
	
	public List<Zhangjie> selectZhangjieNoPage(Integer book_id); //不分页查询
	
	public Integer insertZhangjie(Zhangjie zhangjie);
	
	public Integer deleteZhangjie(Integer id);
	public Zhangjie selectZhangjieById(Integer id);
	public Integer updateZhangjie(Zhangjie zhangjie);
}
