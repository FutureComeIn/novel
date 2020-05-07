package com.yxw.xiaoshuospring.controls;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yxw.xiaoshuospring.annotation.MonitorRequest;
import com.yxw.xiaoshuospring.pojo.Gonggao;
import com.yxw.xiaoshuospring.services.IGonggaoServices;

@Controller
public class GonggaoControls {
	@Resource(name="gonggaoServicesImpl")
	IGonggaoServices gonggao_services;
	
	String message="";
	String path="";
	@MonitorRequest(returnAddress="admin/gonggao/gonggaoMana")
	@RequestMapping("/showGonggao_ht.do")
	public String showGonggao_ht(HttpServletRequest request,Integer indexPage) {
		HashMap<String,Object> hm=gonggao_services.queryGonggao_ht(indexPage);
		request.setAttribute("gonggaoList", hm.get("gonggaoList"));
		request.setAttribute("page", hm.get("page"));
		return "admin/gonggao/gonggaoMana";
	}
	
	@RequestMapping("/insertGonggao.do")
	public String insertGonggao(HttpServletRequest request,Gonggao gonggao) {
		Integer count=gonggao_services.insertGonggao(gonggao);
		if(count>0) {
			message="更新成功";
			path="showGonggao_ht.do";
		}else {
			message="更新失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	@RequestMapping("/deleteGonggao.do")
	public String deleteGonggao(HttpServletRequest request,Integer id) {
		Integer count=gonggao_services.deleteGonggao(id);
		if(count>0) {
			message="更新成功";
			path="showGonggao_ht.do";
		}else {
			message="更新失败";
		}
		request.setAttribute("message", message);
		request.setAttribute("path", path);
		return "common/success";
	}
	
	@RequestMapping("/showGonggao.do")
	public String showGonggao(HttpServletRequest request,Integer indexPage) {
		HashMap<String,Object> hm=gonggao_services.queryGonggao_ht(indexPage);
		request.setAttribute("gonggaoList", hm.get("gonggaoList"));
		request.setAttribute("page", hm.get("page"));
		return "qiantai/gonggao/showGonggao";
	}
	
}
