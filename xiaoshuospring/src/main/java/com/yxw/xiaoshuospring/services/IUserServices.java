package com.yxw.xiaoshuospring.services;

import java.util.HashMap;

import com.yxw.xiaoshuospring.pojo.Admin;
import com.yxw.xiaoshuospring.pojo.User;

public interface IUserServices {
	public User userLogin(User user);
	public User checkLoginName(String loginname);
	public User selectUserById(Integer userId);
	public Integer addUser(User user);
	public HashMap<String,Object> selectUser(User user,Integer indexPage);
	public Integer forbidUser(Integer userId);
	public Integer updateUser(User user);
	
	public Integer loadBook(User user);
	
	//-------------------------------------------------管理员部分
	public Admin selectAdmin(Admin admin);
	public Integer updateAdminPw(Admin admin);

}
