package com.yxw.xiaoshuospring.controls;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yxw.xiaoshuospring.annotation.MonitorRequest;
import com.yxw.xiaoshuospring.pojo.Book;
import com.yxw.xiaoshuospring.pojo.Catelog;
import com.yxw.xiaoshuospring.pojo.Gonggao;
import com.yxw.xiaoshuospring.pojo.Zhangjie;
import com.yxw.xiaoshuospring.services.IBookServices;
import com.yxw.xiaoshuospring.services.ICatelogServices;
import com.yxw.xiaoshuospring.services.IGonggaoServices;
import com.yxw.xiaoshuospring.services.IZhangjieServices;

@Controller
// @RequestMapping("/src/page/welcome/")
public class BookControls {
	
	@Resource(name="bookServicesImpl")
	IBookServices book_services;
	@Resource(name="catelogServicesImpl")
	ICatelogServices catelog_services;
	@Resource(name="gonggaoServicesImpl")
	IGonggaoServices gonggao_services;
	@Resource(name="zhangjieServicesImpl")
	IZhangjieServices zhangjie_services;

	String message="";
	String path="";

	//------------------------------------------------------------------- TODO 前台部分
	@RequestMapping("/showBooks.do")
	public String showBooks(HttpServletRequest request,Book searchBook,Integer indexPage) {
		if(searchBook.getName()!=null) {
			searchBook.setName("%"+searchBook.getName()+"%");
		}
		if(searchBook.getZuozhe()!=null) {
			searchBook.setZuozhe("%"+searchBook.getZuozhe()+"%");
		}
		
		HashMap<String,Object> hm=book_services.queryBooks(searchBook, indexPage);
		List<Catelog> clist=catelog_services.queryCatelog();
		List<Gonggao> glist=gonggao_services.queryGonggao();
		
		//添加后再出去 % %后显示在搜索框上
		if(searchBook.getName()!=null&&!"".equals(searchBook.getName())) {
			searchBook.setName(searchBook.getName().substring(1,searchBook.getName().length()-1));
		}
		if(searchBook.getZuozhe()!=null&&!"".equals(searchBook.getZuozhe())) {
			searchBook.setZuozhe(searchBook.getZuozhe().substring(1,searchBook.getZuozhe().length()-1));
		}
		request.setAttribute("bookList", hm.get("blist"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("searchBook", searchBook);
		request.setAttribute("catelogList", clist);
		request.setAttribute("gonggaoList", glist);
		return "qiantai/index";
	}
	//根据id查询图书
	@RequestMapping("/showBookById.do")
	public String showBookById(HttpServletRequest request,Integer id) {
		Book book=book_services.queryBookById(id);
		List<Catelog> clist=catelog_services.queryCatelog();
		List<Gonggao> glist=gonggao_services.queryGonggao();
		List<Zhangjie> zjlist=zhangjie_services.selectZhangjieNoPage(id);
		request.setAttribute("catelogList", clist);
		request.setAttribute("gonggaoList", glist);
		request.setAttribute("zhangjieList", zjlist);
		request.setAttribute("book", book);
		return "qiantai/book/bookDetail";
	}
	//试读图书
	@RequestMapping("/readBook.do")
	public String readBook(HttpServletRequest request,Integer id) {
		HashMap<String,Object> hm=book_services.bookShidu(id);
		request.setAttribute("zhangjie", hm.get("zhangjie"));
		request.setAttribute("zhangjieList", hm.get("zhangjieList"));
		return "qiantai/book/readBook";
	}
	
	
	//------------------------------------------------------------------- TODO 后台部分
	@MonitorRequest(returnAddress="admin/book/bookAdd")
	@RequestMapping("/showCatelogs.do")
	public String showCatelogs(HttpServletRequest request) {
		List<Catelog> clist=catelog_services.queryCatelog();
		request.setAttribute("catelogList", clist);
		return "admin/book/bookAdd";
	}
	@MonitorRequest(returnAddress="admin/book/bookMana")
	@RequestMapping("/showBooks_ht.do")
	public String showBooks_ht(HttpServletRequest request,Book searchBook,Integer indexPage) {
		if(searchBook.getName()!=null) {
			searchBook.setName("%"+searchBook.getName()+"%");
		}
		if(searchBook.getZuozhe()!=null) {
			searchBook.setZuozhe("%"+searchBook.getZuozhe()+"%");
		}
		
		HashMap<String,Object> hm=book_services.queryBooks(searchBook, indexPage);
		List<Catelog> clist=catelog_services.queryCatelog();
		
		//添加后再出去 % %后显示在搜索框上
		if(searchBook.getName()!=null&&!"".equals(searchBook.getName())) {
			searchBook.setName(searchBook.getName().substring(1,searchBook.getName().length()-1));
		}
		if(searchBook.getZuozhe()!=null&&!"".equals(searchBook.getZuozhe())) {
			searchBook.setZuozhe(searchBook.getZuozhe().substring(1,searchBook.getZuozhe().length()-1));
		}
		request.setAttribute("bookList", hm.get("blist"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("searchBook", searchBook);
		request.setAttribute("catelogList", clist);
		return "admin/book/bookMana";
	}
	
	/**
	 * 进行文件上传需要主动绑定参数(即jsp文件上传界面<input type="file" name="upload"/>的upload)
	 * 参数解析：MultipartFile upload的值为（如下：）
	 * org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5d87498a
	 * @return
	 */ 
	@RequestMapping("/addBook.do")
	public String addBook(HttpServletRequest request,Book book,@RequestParam("upload")MultipartFile upload) {
		/*
		System.out.println("UserControls="+upload);
		org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@8eb24ab
		*/
		System.out.println("UserControls="+upload);
		Integer count=book_services.insertBook(request,upload,book);
		if(count>0) {
			message="添加成功...";
			path="showBooks_ht.do";
		}else {
			message="添加失败...";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@MonitorRequest(returnAddress="admin/book/bookUpdate")
	@RequestMapping("/selectBookById.do")
	public String selectBookById(HttpServletRequest request,Integer bookid) {
		Book book=book_services.queryBookById(bookid);
		List<Catelog> clist=catelog_services.queryCatelog();
		request.setAttribute("catelogList", clist);
		request.setAttribute("book", book);
		return "admin/book/bookUpdate";
	}
	@RequestMapping("/updateBook.do")
	public String updateBook(HttpServletRequest request,Book book) {
		Integer count=book_services.updateBook(book);
		if(count>0) {
			message="修改成功...";
			path="showBooks_ht.do";
		}else {
			message="修改失败...";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	/**
	 * 修改附件及其他信息
	 * @param request
	 * @param book
	 * @return
	 */
	@RequestMapping("/updateBookFujian.do")
	public String updateBookFujian(HttpServletRequest request,Book book,@RequestParam("upload")MultipartFile upload) {
		Integer count=book_services.updateBookFujian(request,upload,book);
		if(count>0) {
			message="修改成功...";
			path="showBooks_ht.do";
		}else {
			message="修改失败...";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@RequestMapping("/deleteBook.do")
	public String deleteBook(HttpServletRequest request,Integer id) {
		Integer count=book_services.deleteBook(id);
		if(count>0) {
			message="删除成功...";
			path="showBooks_ht.do";
		}else {
			message="删除失败...";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@SuppressWarnings("resource")
	@RequestMapping("/loadBook.do")
	public String loadBook(HttpServletRequest request,HttpServletResponse response,Integer id) {
		String userAgent = request.getHeader("User-Agent");
		String name =book_services.queryBookById(id).getName();
		
		/* 设置响应的方式为下载
		 response.setHeader("content-Disposition",
		 					"attachment;filename="+new String(name.getBytes("UTF-8"),"ISO-8859-1")+".txt"); 
		 */
		String url = request.getSession().getServletContext().getRealPath("/upload/" + name + ".txt");
		//request.getServletContext().getRealPath("/")+dirName+"/";
		
		// 针对不同浏览器的不同处理方式
		try {
			if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
					name = java.net.URLEncoder.encode(name, "UTF-8");
			} else {
				name = new String(name.getBytes("UTF-8"), "ISO-8859-1");// 非IE浏览器的处理：
			}
			response.setHeader("Content-disposition", String.format("attachment; filename=\"%s\"", name + ".txt"));
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			File file = new File(url); // 获取文件 （附件所在绝对路径）
			// 创建文件输入流
			FileInputStream fipt = new FileInputStream(file);
			byte[] b = new byte[1024*1024];  
			fipt.read(b);
			ServletOutputStream sopt = response.getOutputStream();
			sopt.write(b);
			sopt.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//------------------------------------------------------------------- TODO 章节部分
	@MonitorRequest(returnAddress="admin/zhang/zhangMana")
	@RequestMapping("/showZhangjie.do")
	public String showZhangjie(HttpServletRequest request,Integer book_id,Integer indexPage) {
		HashMap<String,Object> hm=zhangjie_services.selectZhangjie(book_id, indexPage);
		request.setAttribute("zhangjieList", hm.get("zhangjieList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("book_id",book_id);
		return "admin/zhang/zhangMana";
	}
	@MonitorRequest(returnAddress="admin/zhang/zhangMana")
	@RequestMapping("/insertZhangjie.do")
	public String insertZhangjie(HttpServletRequest request,Zhangjie zhangjie) {
		Integer count=zhangjie_services.insertZhangjie(zhangjie);
		if(count>0) {
			message="yes";
		}else {
			message="no";
		}
		HashMap<String,Object> hm=zhangjie_services.selectZhangjie(zhangjie.getBook_id(),1);
		request.setAttribute("zhangjieList", hm.get("zhangjieList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("book_id",zhangjie.getBook_id());
		request.setAttribute("message", message);
		return "admin/zhang/zhangMana";
	}
	@MonitorRequest(returnAddress="admin/zhang/zhangUpdate")
	@RequestMapping("/showZhangjieById.do")
	public String showZhangjieById(HttpServletRequest request,Integer id) {
		Zhangjie zhangjie=zhangjie_services.selectZhangjieById(id);
		request.setAttribute("zhangjie",zhangjie);
		return "admin/zhang/zhangUpdate";
	}
	@MonitorRequest(returnAddress="admin/zhang/zhangMana")
	@RequestMapping("/updateZhangjie.do")
	public String updateZhangjie(HttpServletRequest request,Zhangjie zhangjie) {
		Integer count=zhangjie_services.updateZhangjie(zhangjie);
		if(count>0) {
			message="yes";
		}else {
			message="no";
		}
		HashMap<String,Object> hm=zhangjie_services.selectZhangjie(zhangjie.getBook_id(),1);
		request.setAttribute("zhangjieList", hm.get("zhangjieList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("book_id",zhangjie.getBook_id());
		request.setAttribute("message", message);
		return "admin/zhang/zhangMana";
	}
	@MonitorRequest(returnAddress="admin/zhang/bookDetail")
	@RequestMapping("/showZhangjieDetail.do")
	public String showZhangjieDetail(HttpServletRequest request,Integer id,Integer book_id) {
		Zhangjie zhangjie=zhangjie_services.selectZhangjieById(id);
		request.setAttribute("zhangjie",zhangjie);
		request.setAttribute("book_id",book_id);
		return "admin/zhang/zhangDetail";
	}
	@RequestMapping("/showZhangjieDetail_qt.do")
	public String showZhangjieDetail_qt(HttpServletRequest request,Integer id,Integer book_id) {
		Zhangjie zhangjie=zhangjie_services.selectZhangjieById(id);
		List<Zhangjie> zhangjieList=zhangjie_services.selectZhangjieNoPage(book_id);
		request.setAttribute("zhangjie",zhangjie);
		request.setAttribute("zhangjieList",zhangjieList);
		return "qiantai/book/readBook";
	}
	@MonitorRequest(returnAddress="admin/zhang/zhangMana")
	@RequestMapping("/deleteZhangjie.do")
	public String deleteZhangjie(HttpServletRequest request,Integer id,Integer book_id) {
		Integer count=zhangjie_services.deleteZhangjie(id);
		if(count>0) {
			message="yes";
		}else {
			message="no";
		}
		HashMap<String,Object> hm=zhangjie_services.selectZhangjie(book_id,1);
		request.setAttribute("zhangjieList", hm.get("zhangjieList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("book_id",book_id);
		request.setAttribute("message", message);
		return "admin/zhang/zhangMana";
	}
	//------------------------------------------------------------------- TODO 类别部分
	@MonitorRequest(returnAddress="admin/catelog/catelogMana")
	@RequestMapping("/showCatelog.do")
	public String showCatelog(HttpServletRequest request) {
		List<Catelog> catelogList=catelog_services.queryCatelog();
		request.setAttribute("catelogList",catelogList);
		return "admin/catelog/catelogMana";
	}
	@RequestMapping("/insertCatelog.do")
	public String insertCatelog(HttpServletRequest request,String name) {
		Integer count=catelog_services.insertCatelog(name);
		if(count>0) {
			message="更新成功";
			path="showCatelog.do";
		}else {
			message="更新失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@MonitorRequest(returnAddress="admin/catelog/catelogUpdate")
	@RequestMapping("/showCatelogName.do")
	public String showCatelogName(HttpServletRequest request,Integer id) {
		Catelog catelog=catelog_services.queryCatelogName(id);
		request.setAttribute("catelog",catelog);
		return "admin/catelog/catelogUpdate";
	}
	@RequestMapping("/updateCatelog.do")
	public String updateCatelog(HttpServletRequest request,Catelog catelog) {
		Integer count=catelog_services.updateCatelog(catelog);
		if(count>0) {
			message="更新成功";
			path="showCatelog.do";
		}else {
			message="更新失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	
	//@RequestMapping(value="deleteCatelog") 这样写，在访问的时候即为：http://localhost:8080/deleteCatelog
	@RequestMapping("/deleteCatelog.do")
	public String deleteCatelog(HttpServletRequest request,Integer id) {
		Integer count=catelog_services.deleteCatelog(id);
		if(count>0) {
			message="更新成功";
			path="showCatelog.do";
		}else {
			message="更新失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
}
