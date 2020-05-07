package com.yxw.xiaoshuospring.services.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.dao.BookDao;
import com.yxw.xiaoshuospring.dao.ZhangjieDao;
import com.yxw.xiaoshuospring.pojo.Zhangjie;
import com.yxw.xiaoshuospring.services.IZhangjieServices;
import com.yxw.xiaoshuospring.utils.Pages;
import com.yxw.xiaoshuospring.utils.PathUtils;

@Service("zhangjieServicesImpl")
public class ZhangjieServicesImpl implements IZhangjieServices {
	@Autowired
	ZhangjieDao zhangjieDao;
	@Autowired
	BookDao bookDao;

	@Override
	public HashMap<String, Object> selectZhangjie(Integer book_id, Integer indexPage) {
		// TODO 查询章节
		if(indexPage==null) {
			indexPage=1;
		}
		Integer count=zhangjieDao.selectZhangjieCount(book_id);
		Pages page=new Pages(count);
		page.setIndexPage(indexPage);
		RowBounds rb=new RowBounds(page.getBeginRow(),page.getPageSize());
		List<Zhangjie> zhangjieList=zhangjieDao.selectZhangjie(book_id, rb);
		String bookName=bookDao.selectBookById(book_id).getName();
		int len=0;
		for(Zhangjie zhangjie : zhangjieList) {
			zhangjie.setBookName(bookName);
			len=PathUtils.firstChineseIndex(zhangjie.getNeirong());
			zhangjie.setNeirong(zhangjie.getNeirong().substring(len,len+20)+"......");
		}
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("zhangjieList", zhangjieList);
		hm.put("page",page);
		return hm;
	}

	@Override
	public Integer insertZhangjie(Zhangjie zhangjie) {
		// TODO 添加章节
		return zhangjieDao.insertZhangjie(zhangjie);
	}

	@Override
	public Integer deleteZhangjie(Integer id) {
		// TODO 删除章节
		return zhangjieDao.deleteZhangjie(id);
	}

	@Override
	public Zhangjie selectZhangjieById(Integer id) {
		// TODO 根据id查询章节
		Zhangjie zhangjie=zhangjieDao.selectZhangjieById(id);
		String bookName=bookDao.selectBookById(zhangjie.getBook_id()).getName();
		zhangjie.setBookName(bookName);
		return zhangjie;
	}

	@Override
	public Integer updateZhangjie(Zhangjie zhangjie) {
		// TODO 修改章节
		return zhangjieDao.updateZhangjie(zhangjie);
	}

	@Override
	public List<Zhangjie> selectZhangjieNoPage(Integer book_id) {
		// TODO 不分页查询章节
		return zhangjieDao.selectZhangjieNoPage(book_id);
	}

}
