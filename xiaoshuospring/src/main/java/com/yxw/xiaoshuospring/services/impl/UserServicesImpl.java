package com.yxw.xiaoshuospring.services.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxw.xiaoshuospring.dao.ChongzhiDao;
import com.yxw.xiaoshuospring.dao.LiuyanDao;
import com.yxw.xiaoshuospring.dao.UserDao;
import com.yxw.xiaoshuospring.pojo.Admin;
import com.yxw.xiaoshuospring.pojo.User;
import com.yxw.xiaoshuospring.services.IUserServices;
import com.yxw.xiaoshuospring.utils.Pages;

@Service("userServicesImpl")
public class UserServicesImpl implements IUserServices {
	@Autowired
	UserDao userDao;
	@Autowired
	ChongzhiDao chongzhiDao;
	@Autowired
	LiuyanDao liuyanDao;

	@Override
	public Integer addUser(User user) {
		// TODO 添加用户
		return userDao.addUser(user);
	}
    
	@Override
	public Admin selectAdmin(Admin admin) {
		// TODO 管理员登录验证
		return userDao.selectAdmin(admin);
	}

	@Override
	public Integer updateAdminPw(Admin admin) {
		// TODO 修改管理员密码
		return userDao.updateAdminPw(admin);
	}

	@Override
	public HashMap<String, Object> selectUser(User user,Integer indexPage) {
		// TODO 查询用户
		if(indexPage==null) {
			indexPage=1;
		}
		Integer rowCount=userDao.selectUserCount(user);
		Pages page=new Pages(rowCount);
		page.setIndexPage(indexPage);
		page.setPageSize(3);
		RowBounds rb=new RowBounds(page.getBeginRow(),page.getPageSize());
		List<User> userList=userDao.selectUser(user,rb);
		
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("userList", userList);
		hm.put("page", page);
		return hm;
	}
	
	@Transactional(rollbackFor=Exception.class)  //当产生异常时进行回滚
	@Override
	public Integer forbidUser(Integer userId) {
		// TODO 对用户进行封号
		Integer count=chongzhiDao.deleteChongzhi(userId);
		count=liuyanDao.deleteByUserid(userId);
		count=userDao.UpdateUserDel(userId);
		return count;
	}
	
	@Override
	public User userLogin(User user) {
		// TODO 登录
		return userDao.userLogin(user);
	}

	@Override
	public User checkLoginName(String loginname) {
		// TODO 验证用户名是否唯一
		return userDao.checkLoginName(loginname);
	}

	@Override
	public Integer updateUser(User user) {
		// TODO 修改用户信息
		return userDao.updateUser(user);
	}

	@Override
	public Integer loadBook(User user) {
		// TODO 用户下载book
		return userDao.loadBook(user);
	}

	@Override
	public User selectUserById(Integer userId) {
		// TODO 根据id查询用户
		return userDao.selectUserById(userId);
	}
}
