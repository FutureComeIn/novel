package com.yxw.xiaoshuospring.services;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.yxw.xiaoshuospring.pojo.Book;



public interface IBookServices {
		//带条件查询所有图书
		public HashMap<String,Object> queryBooks(Book book,Integer indexPage); 
		
		//添加图书
		public Integer insertBook(HttpServletRequest request, MultipartFile mpfile,Book book); 
		
		//根据id查询图书
		public Book queryBookById(Integer id); 
		//修改图书
		public Integer updateBook(Book book); 
		//修改了图书附件
		public Integer updateBookFujian(HttpServletRequest request, MultipartFile mpfile,Book book); 
		//删除图书
		public Integer deleteBook(Integer id);
		
		//试读图书
		public HashMap<String,Object> bookShidu(Integer book_id);

}
