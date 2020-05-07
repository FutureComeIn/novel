package com.yxw.xiaoshuospring.controls;

import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yxw.xiaoshuospring.annotation.MonitorRequest;
import com.yxw.xiaoshuospring.pojo.Admin;
import com.yxw.xiaoshuospring.pojo.Book;
import com.yxw.xiaoshuospring.pojo.Catelog;
import com.yxw.xiaoshuospring.pojo.Chongzhi;
import com.yxw.xiaoshuospring.pojo.Gonggao;
import com.yxw.xiaoshuospring.pojo.Liuyan;
import com.yxw.xiaoshuospring.pojo.User;
import com.yxw.xiaoshuospring.services.IBookServices;
import com.yxw.xiaoshuospring.services.ICatelogServices;
import com.yxw.xiaoshuospring.services.IChongzhiServices;
import com.yxw.xiaoshuospring.services.IGonggaoServices;
import com.yxw.xiaoshuospring.services.ILiuyanServices;
import com.yxw.xiaoshuospring.services.IUserServices;
import com.yxw.xiaoshuospring.utils.APIRequest;
import com.yxw.xiaoshuospring.utils.CodeUtil;

@Controller
public class UserControls {
	@Resource(name="userServicesImpl")
	IUserServices userServices;
	
	@Resource(name="bookServicesImpl")
	IBookServices book_services;
	@Resource(name="catelogServicesImpl")
	ICatelogServices catelog_services;
	@Resource(name="gonggaoServicesImpl")
	IGonggaoServices gonggao_services;
	@Resource(name="liuyanServicesImpl")
	ILiuyanServices liuyan_services;
	@Resource(name="chongzhiServicesImpl")
	IChongzhiServices chongzhi_services;
	
	String path=null;
	String message=null;
	
	//------------------------------------------------- TODO 用户部分
	@SuppressWarnings("resource")
	@RequestMapping("/userLoadBook.do")
	public String userLoadBook(HttpServletRequest request,HttpServletResponse response,Integer book_id,User user) {
		String userAgent = request.getHeader("User-Agent");
		String name =book_services.queryBookById(book_id).getName();
		userServices.loadBook(user);//减少点券数量,重新绑定session
		User newUser=userServices.selectUserById(user.getUserId());
		request.getSession().setAttribute("user", newUser);
		
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
			byte[] b = new byte[2048*1024];
			fipt.read(b);
			ServletOutputStream sopt = response.getOutputStream();
			sopt.write(b);
			sopt.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("/showYzm.do")
	public String showYzm(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> map=CodeUtil.generateCodeAndPic();//根据验证码生成类获取 验证的map(即产生一个图像验证码)
		String code=map.get("code").toString(); //获取验证码值
		request.getSession().setAttribute("code",code); //提交表单后取出，与提交的值比较
		//System.out.println(request.getSession().getId());   --18B91D0C21BE1375D3553314AF31AB34
		//将验证码BufferedImage对象写入响应流
		ServletOutputStream opt;
		try {
			opt = response.getOutputStream();
			ImageIO.write((RenderedImage)map.get("codePic"),"jpeg",opt);
			opt.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 使用ajax同步的请求方式--验证用户名是否唯一
	 * @param request
	 * @param loginname
	 * @return
	 */
	@RequestMapping(value="/checkLoginName.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String checkLoginName(HttpServletRequest request,String loginname) {
		APIRequest<String> api=new APIRequest<String>();
		User user=userServices.checkLoginName(loginname);
		if(user!=null) {
			api.setSingerData("该用户名已经存在");
			api.setIsResult(false);
		}else {
			api.setIsResult(true);
		}
		return api.toString();
	}
	/**
	 * 使用ajax同步的请求方式--验证图片验证码是否正确
	 * @param request
	 * @param yzm
	 * @return
	 */
	@RequestMapping(value="/checkYzm.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String checkYzm(HttpServletRequest request,String yzm) {
		APIRequest<String> api=new APIRequest<String>();
		String yzmCode=(String)request.getSession().getAttribute("code"); 
		if(!yzm.equals(yzmCode)) {
			api.setSingerData("验证码错误");
			api.setIsResult(false);
		}else {
			api.setIsResult(true);
		}
		return api.toString();
	}
	@RequestMapping("/exitUser.do")
	public String exitUser(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		request.setAttribute("message",null);
		request.setAttribute("path","exitAdmin.do");
		return "common/success";
	}
	@RequestMapping("/userLogin.do")
	public String userLogin(HttpServletRequest request,User user) {
		User user1=userServices.userLogin(user);
		if(user1==null) {
			message="用户名或密码错误";
			path=null;
		}else {
			message="登录成功";
			path="exitAdmin.do";  //回到首页的do
		}
		request.getSession().setAttribute("user", user1);
		request.setAttribute("message",message);
		request.setAttribute("path",path);
		return "common/success";
	}
	@RequestMapping("/addUser.do")
	public String addUser(HttpServletRequest request,User user,String age1) {
		String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		Integer age=Integer.parseInt(date.substring(0, 4))-Integer.parseInt(age1.substring(0, 4));
		user.setRegisterTime(date);
		user.setAge(age);
		Integer flag=userServices.addUser(user);
		if(flag==1) {
			message="注册成功";
			path="exitAdmin.do";
		}else {
			message="注册失败";
		}
		request.setAttribute("message",message);
		request.setAttribute("path",path);
		return "common/success";
	}
	@MonitorRequest(returnAddress="admin/user/userMana")
	@RequestMapping("/selectUser.do")
	public String selectUser(HttpServletRequest request,User searchUser,Integer indexPage) {
		if(searchUser.getLoginname()!=null) {
			searchUser.setLoginname("%"+searchUser.getLoginname()+"%");
		}
		HashMap<String,Object> hm=userServices.selectUser(searchUser, indexPage);
		//添加后再出去 % %后显示在搜索框上
		if(searchUser.getLoginname()!=null&&!"".equals(searchUser.getLoginname())) {
			searchUser.setLoginname(searchUser.getLoginname().substring(1,searchUser.getLoginname().length()-1));
		}
		
		request.setAttribute("userList", hm.get("userList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("searchUser", searchUser);
		return "admin/user/userMana";
	}
	/**
	 * 删除用户 （封号）
	 * @param request
	 * @param searchUser
	 * @param indexPage
	 * @return
	 */
	@MonitorRequest(returnAddress="admin/user/userMana")
	@RequestMapping("/deleteUser.do")
	public String deleteUser(HttpServletRequest request,Integer userId) {
		Integer count=userServices.forbidUser(userId);
		if(count>0) {
			message="ok";
			path=null;
		}else {
			message="error";
		}
		HashMap<String,Object> hm=userServices.selectUser(new User(),1);
		request.setAttribute("userList", hm.get("userList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("searchUser",null);
		request.setAttribute("message", message);
		return "admin/user/userMana";
	}
	@RequestMapping("/updateUser.do")
	public String updateUser(HttpServletRequest request,User user) {
		Integer count=userServices.updateUser(user);
		if(count>0) {
			message="修改成功";
			path="qiantai/userinfo/userXinxi.jsp";
			User user1=userServices.userLogin(user); //修改成功后重新查询，绑定到session作用域
			request.getSession().setAttribute("user", user1);
		}else {
			message="修改失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	
	//------------------------------------------------- TODO 管理员部分
	//@MonitorRequest(returnAddress="admin/index") 这个加上会很难登录，有时候会在你绑定admin之前先执行环绕
	@RequestMapping("/selectAdmin.do")
	public String selectAdmin(HttpServletRequest request,Admin admin) {
		Admin admin1=userServices.selectAdmin(admin);
		request.getSession().removeAttribute("user"); //也把用户session也干掉，让他重新登录(当进入后台时，就注销user)
		if(admin1==null) {
			message="false";
			path="login";
			request.setAttribute("adminMsg",message);
		}else {
			path="admin/index";
			request.getSession().setAttribute("admin",admin1);
		}
		return path;
	}
	@RequestMapping("/exitAdmin.do")
	public String exitAdmin(HttpServletRequest request) {
		request.getSession().removeAttribute("admin");
		//request.getSession().removeAttribute("user"); //不能干掉，因为很多do都执行了这个回到首页的do
		HashMap<String,Object> hm=book_services.queryBooks(new Book(), 1);
		List<Catelog> clist=catelog_services.queryCatelog();
		List<Gonggao> glist=gonggao_services.queryGonggao();
		request.setAttribute("bookList", hm.get("blist"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("searchBook", null);
		request.setAttribute("catelogList", clist);
		request.setAttribute("gonggaoList", glist);
		return "qiantai/index";
	}
	@MonitorRequest(returnAddress="admin/userinfo/userPw")
	@RequestMapping("/updateAdminPw.do")
	public String updatAdminPw(HttpServletRequest request,Admin admin) {
		Integer flag=userServices.updateAdminPw(admin);
		if(flag==1) {
			message="yes";
		}else {
			message="no";
		}
		request.setAttribute("updateAdminPwMsg", message);
		return "admin/userinfo/userPw";
	}
	
	//------------------------------------------------- TODO 留言部分
	@MonitorRequest(returnAddress="admin/liuyan/liuyanMana")
	@RequestMapping("/selectLiuyan.do")
	public String selectLiuyan(HttpServletRequest request,Liuyan searchLiuyan,Integer indexPage) {
		HashMap<String,Object> hm=liuyan_services.queryLiuyan(searchLiuyan, indexPage);
		request.setAttribute("liuyanList", hm.get("liuyanList"));
		request.setAttribute("page",hm.get("page"));
		request.setAttribute("searchLiuyan", searchLiuyan);
		return "admin/liuyan/liuyanMana";
	}
	@RequestMapping("/deleteLiuyan.do")
	public String deleteLiuyan(HttpServletRequest request,Integer id) {
		Integer count=liuyan_services.deleteLiuyan(id);
		if(count>0) {
			message="删除成功";
			path="selectLiuyan.do";
		}else {
			message="删除失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@RequestMapping("/selectLiuyan_qt.do")
	public String selectLiuyan_qt(HttpServletRequest request,Liuyan searchLiuyan,Integer indexPage) {
		HashMap<String,Object> hm=liuyan_services.queryLiuyan(searchLiuyan, indexPage);
		request.setAttribute("liuyanList", hm.get("liuyanList"));
		request.setAttribute("page",hm.get("page"));
		return "qiantai/liuyan/liuyan";
	}
	@RequestMapping("/insertLiuyan.do")
	public String insertLiuyan(HttpServletRequest request,Liuyan liuyan) {
		Integer count=liuyan_services.insertLiuyan(liuyan);
		if(count>0) {
			message="添加成功";
			path="selectLiuyan_qt.do";
		}else {
			message="添加失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@RequestMapping("/selectMyLiuyan.do")
	public String selectMyLiuyan(HttpServletRequest request,Liuyan liuyan,Integer indexPage) {
		HashMap<String,Object> hm=liuyan_services.queryLiuyan(liuyan, indexPage);
		request.setAttribute("liuyanList", hm.get("liuyanList"));
		request.setAttribute("page",hm.get("page"));
		return "qiantai/liuyan/liuyan";
	}
	//------------------------------------------------- TODO 充值部分
	@RequestMapping("/insertChongzhi.do")
	public String insertChongzhi(HttpServletRequest request,Chongzhi chongzhi) {
		String date=new SimpleDateFormat("yyyy-MM-dd HH:MM:ss").format(new Date());
		chongzhi.setShijian(date);
		chongzhi.setDianquan(chongzhi.getDianquan()*10); //1元=10点券
		Integer count=chongzhi_services.insertChongzhi(chongzhi);
		if(count>0) {
			message="yes";
		}else {
			message="no";
		}
		request.setAttribute("message", message);
		return "qiantai/book/chongzhi";
	}
	@MonitorRequest(returnAddress="admin/liuyan/liuyanMana")
	@RequestMapping("/selectChongzhi.do")
	public String selectChongzhi(HttpServletRequest request,Chongzhi searchChongzhi,Integer indexPage) {
		HashMap<String,Object> hm=chongzhi_services.selectChongzhi(searchChongzhi, indexPage);
		request.setAttribute("chongzhiList", hm.get("chongzhiList"));
		request.setAttribute("page", hm.get("page"));
		request.setAttribute("searchChongzhi", searchChongzhi);
		return "admin/chongzhi/chongzhiMana";
	}
	
	@RequestMapping("/shenhe.do")
	public String shenhe(HttpServletRequest request,Chongzhi chongzhi) {
		Integer count=chongzhi_services.shenhe(chongzhi);
		if(count>0) {
			message="审核成功";
			path="selectChongzhi.do";
		}else {
			message="审核失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@RequestMapping("/deleteChongzhi.do")
	public String deleteChongzhi(HttpServletRequest request,Integer id) {
		Integer count=chongzhi_services.deleteChongzhiById(id);
		if(count>0) {
			message="删除成功";
			path="selectChongzhi.do";
		}else {
			message="删除失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
}
