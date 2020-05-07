package com.yxw.xiaoshuospring.services.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.dao.LiuyanDao;
import com.yxw.xiaoshuospring.dao.UserDao;
import com.yxw.xiaoshuospring.pojo.Liuyan;
import com.yxw.xiaoshuospring.pojo.User;
import com.yxw.xiaoshuospring.services.ILiuyanServices;
import com.yxw.xiaoshuospring.utils.Pages;

@Service("liuyanServicesImpl")
public class LiuyanServicesImpl implements ILiuyanServices {
	@Autowired
	LiuyanDao liuyanDao;
	@Autowired
	UserDao userDao;

	@Override
	public HashMap<String, Object> queryLiuyan(Liuyan liuyan, Integer indexPage) {
		// TODO 遍历留言
		if(indexPage==null) {
			indexPage=1;
		}
		Integer count=liuyanDao.selectCountLiuyan(liuyan);
		Pages page=new Pages(count);
		page.setIndexPage(indexPage);
		RowBounds rb=new RowBounds(page.getBeginRow(),page.getPageSize());
		List<Liuyan> liuyanList=liuyanDao.selectLiuyan(rb, liuyan);
		for(Liuyan ly : liuyanList) {
			User user=userDao.selectUserById(ly.getUser_id());
			ly.setUserName(user.getLoginname());
		}
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("liuyanList", liuyanList);
		hm.put("page", page);
		return hm;
	}

	@Override
	public Integer insertLiuyan(Liuyan liuyan) {
		// TODO 添加留言
		String date=new SimpleDateFormat("yyyy-MM-dd  hh:MM:ss").format(new Date());
		liuyan.setShijian(date);
		return liuyanDao.insertLiuyan(liuyan);
	}

	@Override
	public Integer deleteLiuyan(Integer id) {
		// TODO 删除留言
		return liuyanDao.deleteByUserid(id);
	}

}
