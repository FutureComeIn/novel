package com.yxw.xiaoshuospring.services.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxw.xiaoshuospring.dao.ChongzhiDao;
import com.yxw.xiaoshuospring.dao.UserDao;
import com.yxw.xiaoshuospring.pojo.Chongzhi;
import com.yxw.xiaoshuospring.pojo.User;
import com.yxw.xiaoshuospring.services.IChongzhiServices;
import com.yxw.xiaoshuospring.utils.Pages;

@Service("chongzhiServicesImpl")
public class ChongzhiServicesImpl implements IChongzhiServices {
	@Autowired 
	ChongzhiDao chongzhiDao;
	@Autowired 
	UserDao userDao;

	@Override
	public Integer insertChongzhi(Chongzhi chongzhi) {
		// TODO 添加充值记录
		return chongzhiDao.insertChongzhi(chongzhi);
	}

	@Override
	public HashMap<String, Object> selectChongzhi(Chongzhi chongzhi, Integer indexPage) {
		// TODO 查询充值
		if(indexPage==null) {
			indexPage=1;
		}
		Integer count=chongzhiDao.selectCountChongzhi(chongzhi);
		Pages page=new Pages(count);
		page.setIndexPage(indexPage);
		RowBounds rb=new RowBounds(page.getBeginRow(),page.getPageSize());
		List<Chongzhi> czList=chongzhiDao.selectChongzhi(chongzhi, rb);
		for(Chongzhi cz : czList) {
			User user=userDao.selectUserById(cz.getUser_id());
			cz.setUserName(user.getLoginname());
		}
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("chongzhiList", czList);
		hm.put("page", page);
		return hm;
	}
	
	@Transactional(rollbackFor=Exception.class)  //当产生异常时进行回滚
	@Override
	public Integer shenhe(Chongzhi chongzhi) {
		// TODO 审核充值点券
		Integer count=chongzhiDao.updateZt(chongzhi.getId());
		User user=new User();
		user.setUserId(chongzhi.getUser_id());
		user.setDianquan(chongzhi.getDianquan());
		count=userDao.updateDianquan(user);
		return count;
	}

	@Override
	public Integer deleteChongzhiById(Integer id) {
		// TODO 根据id删除充值记录
		return chongzhiDao.deleteChongzhiById(id);
	}

}
