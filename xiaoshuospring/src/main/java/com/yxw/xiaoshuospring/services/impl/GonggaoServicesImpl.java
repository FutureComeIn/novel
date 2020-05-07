package com.yxw.xiaoshuospring.services.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.dao.GonggaoDao;
import com.yxw.xiaoshuospring.pojo.Gonggao;
import com.yxw.xiaoshuospring.services.IGonggaoServices;
import com.yxw.xiaoshuospring.utils.Pages;

@Service("gonggaoServicesImpl")
public class GonggaoServicesImpl implements IGonggaoServices {
	@Autowired
	GonggaoDao gdao;

	@Override
	public List<Gonggao> queryGonggao() {
		// TODO 遍历公告
		return gdao.queryGonggao();
	}

	@Override
	public HashMap<String, Object> queryGonggao_ht(Integer indexPage) {
		// TODO 遍历公告--后台
		if(indexPage==null) {
			indexPage=1;
		}
		Integer count=gdao.queryGonggaoCount();
		Pages page=new Pages(count);
		page.setIndexPage(indexPage);
		RowBounds rb=new RowBounds(page.getBeginRow(),page.getPageSize());
		List<Gonggao> glist=gdao.queryGonggao_ht(rb);
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("gonggaoList", glist);
		hm.put("page", page);
		return hm;
	}

	@Override
	public Integer insertGonggao(Gonggao gonggao) {
		// TODO 添加公告
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		gonggao.setSendtime(sdf.format(new Date()));
		return gdao.insertGonggao(gonggao);
	}

	@Override
	public Integer deleteGonggao(Integer id) {
		// TODO Auto-generated method stub
		return gdao.deleteGonggao(id);
	}

}
