package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Zhangjie;

@Service
public interface ZhangjieDao {
	@Select("select count(*) from zhang where book_id=#{book_id}")
	public Integer selectZhangjieCount(Integer book_id);
	@Select("select *from zhang where book_id=#{book_id} order by id")
	public List<Zhangjie> selectZhangjie(Integer book_id,RowBounds rb);
	
	@Select("select *from zhang where book_id=#{book_id} order by id")
	public List<Zhangjie> selectZhangjieNoPage(Integer book_id);  //不分页查询
	
	@Insert("insert into zhang values(0,#{book_id},#{mingcheng },#{neirong })")
	public Integer insertZhangjie(Zhangjie zhangjie);
	@Delete("delete from zhang where id=#{id}")
	public Integer deleteZhangjie(Integer id);
	@Select("select *from zhang where id=#{id}")
	public Zhangjie selectZhangjieById(Integer id);
	@Update("update zhang set mingcheng=#{mingcheng},neirong=#{neirong} where id=#{id}")
	public Integer updateZhangjie(Zhangjie zhangjie);
	
	@Delete("delete from zhang where book_id=#{book_id}")
	public Integer deleteZhangjieByBook_id(Integer book_id);  //根据图书id删除章节
	
	@Select("select min(id) mid,z.*from zhang z where book_id=#{book_id}")
	public  Zhangjie selectMinZhang(Integer book_id);
}
