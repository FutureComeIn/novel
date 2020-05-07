package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Book;
import com.yxw.xiaoshuospring.utils.SqlUtils;

@Service
public interface BookDao {
		//查询总行数
		@SelectProvider(type=SqlUtils.class,method="selectCountBook")
		public Integer selectCountBook(Book book);
	
		//带条件查询所有书籍
		//增改删也有对应的@InsertProvider、@UpdateProvider、@DeleteProvider
		@SelectProvider(type=SqlUtils.class,method="selectBook")
		public List<Book> queryBook(Book book,RowBounds rb); 
		
		//添加图书
		@Insert("insert into book values(0,#{catelog_id},#{name},#{zuozhe},#{dianquan},#{jieshao},#{fujian},#{fabushijian})")
		public Integer insertBook(Book book);
		
		//根据id查询图书
		@Select("select *from book where id=#{id}")
		public Book selectBookById(Integer id);
		//修改图书
		@UpdateProvider(type=SqlUtils.class,method="updateBook")
		public Integer UpdateBook(Book book);
		
		//根据id删除图书
		@Delete("delete from book where id=#{id}")
		public Integer deleteBookById(Integer id);
		
		//根据id删除图书
		@Delete("delete from book where catelog_id=#{catelog_id}")
		public Integer deleteBookByCatelog_id(Integer id);
}
