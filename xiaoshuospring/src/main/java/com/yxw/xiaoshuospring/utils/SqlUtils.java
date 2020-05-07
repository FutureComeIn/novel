package com.yxw.xiaoshuospring.utils;

import org.apache.ibatis.jdbc.SQL;

import com.yxw.xiaoshuospring.pojo.Book;
import com.yxw.xiaoshuospring.pojo.Chongzhi;
import com.yxw.xiaoshuospring.pojo.Liuyan;
import com.yxw.xiaoshuospring.pojo.User;

public class SqlUtils {
	//--------------------------------------------------------- TODO 书籍sql
	
	//方法中的关键字是区分大小写的  SQL SELECT WHERE
    //该方法会根据传递过来的map中的参数内容  动态构建sql语句
	 public String selectCountBook(Book book) {
	        return new SQL() {
	            {
	                SELECT("count(*)");
	                FROM("book");
	                if(book.getName()!=null&&!"".equals(book.getName())) {
	                	 WHERE("name like #{name}");
	                }
	                if(book.getZuozhe()!= null&&!"".equals(book.getZuozhe())){
	                	WHERE("zuozhe like #{zuozhe}");
	                }
	                if(book.getCatelog_id()!=null) {
	                	WHERE("catelog_id=#{catelog_id}");
	                }
	            }
	            
	        }.toString();
	}	
    public String selectBook(Book book) {
        return new SQL() {
            {
                SELECT("*");
                FROM("book");
                if(book.getName()!=null&&!"".equals(book.getName())) {
               	 	WHERE("name like #{name}");
                }
                if(book.getZuozhe()!= null&&!"".equals(book.getZuozhe())){
                	WHERE("zuozhe like #{zuozhe}");
                }
                if(book.getCatelog_id()!=null) {
                	WHERE("catelog_id=#{catelog_id}");
                }
            }
            
        }.toString()+" order by id";
    }
    public String updateBook(Book book) {
        return new SQL() {
            {
            	UPDATE("book");
            	if (book.getCatelog_id()!=null) {
                    SET("catelog_id=#{catelog_id}");
                }
                if (book.getName()!=null&&!"".equals(book.getName())) {
                    SET("name=#{name}");
                }
                if (book.getZuozhe()!=null&&!"".equals(book.getZuozhe())) {
                    SET("zuozhe=#{zuozhe}");
                }
                if (book.getDianquan()!=null) {
                    SET("dianquan=#{dianquan}");
                }
                if (book.getJieshao()!=null&&!"".equals(book.getJieshao())) {
                    SET("jieshao=#{jieshao}");
                }
                if (book.getFujian()!=null&&!"".equals(book.getFujian())) {
                    SET("fujian=#{fujian}");
                }
                WHERE("id=#{id}");
            }
        }.toString();
    }
    
   //--------------------------------------------------------- TODO 用户sql
    public String selectCountUser(User user) {
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("users");
                if(user.getLoginname()!=null&&!"".equals(user.getLoginname())) {
                	 WHERE("loginname like #{loginname}");
                }
                if(user.getRegisterTime()!= null&&!"".equals(user.getRegisterTime())){
                	WHERE("registerTime=#{registerTime}");
                }
                if(user.getDianquan()!=null) {
                	WHERE("dianquan<#{dianquan}");
                }
                if(user.getDel()!=null) {
                	WHERE("del=#{del}");
                }else {
                	WHERE("del='N'");
                }
            }
            
        }.toString();
    }	
	public String selectUser(User user) {
	    return new SQL() {
	        {
	            SELECT("*");
	            FROM("users");
                if(user.getLoginname()!=null&&!"".equals(user.getLoginname())) {
                	 WHERE("loginname like #{loginname}");
                }
                if(user.getRegisterTime()!= null&&!"".equals(user.getRegisterTime())){
                	WHERE("registerTime=#{registerTime}");
                }
                if(user.getDianquan()!=null) {
                	WHERE("dianquan<#{dianquan}");
                }
                if(user.getDel()!=null) {
                	WHERE("del=#{del}");
                }else {
                	WHERE("del='N'");
                }
	        }
	    }.toString()+" order by userId";
	}
	public String updateUser(User user) {
        return new SQL() {
            {
            	UPDATE("users");
            	if (user.getLoginname()!=null&&!"".equals(user.getLoginname())) {
                    SET("loginname=#{loginname}");
                }
            	if (user.getLoginpw()!=null&&!"".equals(user.getLoginpw())) {
                    SET("loginpw=#{loginpw}");
                }
            	if (user.getSex()!=null&&!"".equals(user.getSex())) {
                    SET("sex=#{sex}");
                }
            	if (user.getAge()!=null) {
                    SET("age=#{age}");
                }
            	if (user.getTel()!=null&&!"".equals(user.getTel())) {
                    SET("tel=#{tel}");
                }
            	if (user.getEmail()!=null&&!"".equals(user.getEmail())) {
                    SET("email=#{email}");
                }
            	if (user.getDianquan()!=null) {
                    SET("dianquan=#{dianquan}");
                }
            	if (user.getDel()!=null&&!"".equals(user.getDel())) {
                    SET("del=#{del}");
                }
                WHERE("userId=#{userId}");
            }
        }.toString();
    }
	
	//--------------------------------------------------------- TODO 留言sql
	public String selectCountLiuyan(Liuyan liuyan) {
	        return new SQL() {
	            {
	                SELECT("count(*)");
	                FROM("liuyan");
	                if(liuyan.getUser_id()!=null) {
	                	 WHERE("user_id=#{user_id}");
	                }
	            }
	            
	        }.toString();
	 }	
	 public String selectLiuyan(Liuyan liuyan) { 
	        return new SQL() {
	            {
	                SELECT("*");
	                FROM("liuyan");
	                if(liuyan.getUser_id()!=null) {
	                	 WHERE("user_id=#{user_id}");
	                }
	            }
	        }.toString()+" order by id desc";
	 }
	 
	//--------------------------------------------------------- TODO 充值sql
	 public String selectCountChongzhi(Chongzhi chongzhi) {
	        return new SQL() {
	            {
	                SELECT("count(*)");
	                FROM("chongzhi");
	                if(chongzhi.getUser_id()!=null) {
	                	 WHERE("user_id=#{user_id}");
	                }
	                if(chongzhi.getZhuangtai()!=null&&!"".equals(chongzhi.getZhuangtai())) {
	                	WHERE("zhuangtai=#{zhuangtai}");
	                }else {
	                	WHERE("zhuangtai='N'");
	                }
	            }
	        }.toString();
	 }
	 public String selectChongzhi(Chongzhi chongzhi) {
	        return new SQL() {
	            {
	                SELECT("*");
	                FROM("chongzhi");
	                if(chongzhi.getUser_id()!=null) {
	                	 WHERE("user_id=#{user_id}");
	                }
	                if(chongzhi.getZhuangtai()!=null&&!"".equals(chongzhi.getZhuangtai())) {
	                	WHERE("zhuangtai=#{zhuangtai}");
	                }else {
	                	WHERE("zhuangtai='N'");
	                }
	            }
	        }.toString()+" order by id desc";
	 }
}
