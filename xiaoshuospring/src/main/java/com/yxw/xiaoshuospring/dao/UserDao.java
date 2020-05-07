package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Admin;
import com.yxw.xiaoshuospring.pojo.User;
import com.yxw.xiaoshuospring.utils.SqlUtils;

@Service
public interface UserDao {
	@Select("select *from users where loginname=#{loginname} and loginpw=#{loginpw}")
	public User userLogin(User user);
	@Select("select *from users where loginname=#{loginname}")
	public User checkLoginName(String loginname);
	@Select("select *from users where userId=#{userId}")
	public User selectUserById(Integer userId);  //根据id查询用户
	
	@Insert("insert into users values(0,#{loginname},#{loginpw},#{sex},#{age},#{tel},#{email},0,#{registerTime},'N')")
	public Integer addUser(User user);
	@SelectProvider(type=SqlUtils.class,method="selectCountUser")
	public Integer selectUserCount(User user);
	@SelectProvider(type=SqlUtils.class,method="selectUser")
	public List<User> selectUser(User user,RowBounds rb);
	@Update("update users set del='Y' where userId=#{userId}")
	public Integer UpdateUserDel(Integer userId);
	@UpdateProvider(type=SqlUtils.class,method="updateUser")
	public Integer updateUser(User user);
	
	@Update("update users set dianquan=dianquan+#{dianquan} where userId=#{userId}")
	public Integer updateDianquan(User user);
	@Update("update users set dianquan=dianquan-#{dianquan} where userId=#{userId}")
	public Integer loadBook(User user);
	
	
	//-------------------------------------------------管理员部分
	@Select("select *from admin where userName=#{userName} and userPw=#{userPw}")
	public Admin selectAdmin(Admin admin);
	@Update("update admin set userPw=#{userPw} where userName=#{userName}")
	public Integer updateAdminPw(Admin admin);
	
}
