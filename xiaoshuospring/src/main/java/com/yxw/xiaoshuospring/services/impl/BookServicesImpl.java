package com.yxw.xiaoshuospring.services.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yxw.xiaoshuospring.dao.BookDao;
import com.yxw.xiaoshuospring.dao.CatelogDao;
import com.yxw.xiaoshuospring.dao.ZhangjieDao;
import com.yxw.xiaoshuospring.pojo.Book;
import com.yxw.xiaoshuospring.pojo.Zhangjie;
import com.yxw.xiaoshuospring.services.IBookServices;
import com.yxw.xiaoshuospring.utils.Pages;
import com.yxw.xiaoshuospring.utils.PathUtils;

@Service("bookServicesImpl")
public class BookServicesImpl implements IBookServices {
	@Autowired
	BookDao bookdao;
	@Autowired
	CatelogDao catelogDao;
	@Autowired
	ZhangjieDao zhangjieDao;

	@Override
	public HashMap<String, Object> queryBooks(Book book, Integer indexPage) {
		// TODO 遍历图书
		if(indexPage==null) {
			indexPage=1;
		}
		Integer rowCount=bookdao.selectCountBook(book);
		Pages page=new Pages(rowCount);
		page.setIndexPage(indexPage);
		RowBounds rb=new RowBounds(page.getBeginRow(),page.getPageSize());
		List<Book> booklist=bookdao.queryBook(book, rb);
		for(Book book2 : booklist) {
			String catelogName=catelogDao.queryCatelogName(book2.getCatelog_id()).getName();
			book2.setCatelogName(catelogName);
		}
		
		
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("blist",booklist);
		hm.put("page",page);
		return hm;
	}
	
	@Override
	public Integer insertBook(HttpServletRequest request, MultipartFile mpfile,Book book) {
		// TODO 添加图书
		//获得上传的小说 的 存储地方的绝对路径 (存储文件夹自己设置为 upload)
		String path = PathUtils.getPath(request, "upload", mpfile.getOriginalFilename());
		int flag=0;
		try {
			mpfile.transferTo(new File(path));
			book.setFujian(PathUtils.datapath); //赋的是--》文件夹+图片名
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
			book.setFabushijian(sdf.format(new Date()));
			bookdao.insertBook(book);
			flag=1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Book queryBookById(Integer id) {
		// TODO 根据id查询图书
		return bookdao.selectBookById(id);
	}

	@Override
	public Integer updateBook(Book book) {
		// TODO 修改图书
		return bookdao.UpdateBook(book);
	}

	@Override
	public Integer updateBookFujian(HttpServletRequest request, MultipartFile mpfile,Book book) {
		// TODO 修改了图书附件
		//获得上传的小说 的 存储地方的绝对路径 (存储文件夹自己设置为 upload)
		String path = PathUtils.getPath(request, "upload", mpfile.getOriginalFilename());
		int flag=0;
		try {
			mpfile.transferTo(new File(path));
			book.setFujian(PathUtils.datapath); //赋的是--》文件夹+图片名
			bookdao.UpdateBook(book);
			flag=1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Transactional(rollbackFor=Exception.class)  //当产生异常时进行回滚
	@Override
	public Integer deleteBook(Integer id) {
		// TODO 删除图书
		Integer count=zhangjieDao.deleteZhangjieByBook_id(id);
		count=bookdao.deleteBookById(id);
		return count;
	}

	@Override
	public HashMap<String, Object> bookShidu(Integer book_id) {
		// TODO 试读图书
		Zhangjie zhangjie=zhangjieDao.selectMinZhang(book_id);
		List<Zhangjie> zhangjieList=zhangjieDao.selectZhangjieNoPage(book_id);
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("zhangjie", zhangjie);
		hm.put("zhangjieList", zhangjieList);
		return hm;
	}

}
