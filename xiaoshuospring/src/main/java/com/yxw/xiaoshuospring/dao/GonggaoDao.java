package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Gonggao;


@Service
public interface GonggaoDao {
	//在首页只显示4条公告
	@Select("select * from gonggao order by id desc limit 4")
	public List<Gonggao> queryGonggao(); 
	@Select("select * from gonggao where id=#{id}")
	public Gonggao queryGonggaoById(Integer id); 
	
	
	@Select("select count(*) from gonggao")
	public Integer queryGonggaoCount(); 
	@Select("select * from gonggao order by id desc")
	public List<Gonggao> queryGonggao_ht(RowBounds rb); 
	
	@Insert("insert into gonggao values(0,#{title},#{content},#{sendtime})")
	public Integer insertGonggao(Gonggao gonggao);
	
	@Delete("delete from gonggao where id=#{id}")
	public Integer deleteGonggao(Integer id);
}
