package com.yxw.xiaoshuospring.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxw.xiaoshuospring.dao.BookDao;
import com.yxw.xiaoshuospring.dao.CatelogDao;
import com.yxw.xiaoshuospring.pojo.Catelog;
import com.yxw.xiaoshuospring.services.ICatelogServices;

@Service("catelogServicesImpl")
public class CatelogServicesImpl implements ICatelogServices {
	@Autowired
	CatelogDao catelogDao;
	@Autowired
	BookDao bookDao;

	@Override
	public List<Catelog> queryCatelog() {
		// TODO 遍历图书类目
		return catelogDao.queryCatelog();
	}
	
	@Transactional(rollbackFor=Exception.class)  //当产生异常时进行回滚
	@Override
	public Integer deleteCatelog(Integer id) {
		// TODO 删除类目
		Integer count=bookDao.deleteBookByCatelog_id(id);
		count=catelogDao.deleteCatelog(id);
		return count;
	}

	@Override
	public Integer insertCatelog(String name) {
		// TODO 添加类目
		return catelogDao.insertCatelog(name);
	}

	@Override
	public Integer updateCatelog(Catelog catelog) {
		// TODO 修改类目
		return catelogDao.updateCatelog(catelog);
	}

	@Override
	public Catelog queryCatelogName(Integer id) {
		// TODO 根据id查询类目
		return catelogDao.queryCatelogName(id);
	}

}
