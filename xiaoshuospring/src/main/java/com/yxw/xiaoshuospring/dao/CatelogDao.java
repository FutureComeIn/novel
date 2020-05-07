package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Catelog;

@Service
public interface CatelogDao {
	
	@Select("select * from catelog order by id")
	public List<Catelog> queryCatelog(); 
	
	@Select("select *from catelog where id=#{id}")
	public Catelog queryCatelogName(Integer id); 
	
	@Delete("delete from catelog where id=#{id}")
	public Integer deleteCatelog(Integer id); 
	@Insert("insert into catelog values(0,#{name})")
	public Integer insertCatelog(String name); 
	@Update("update catelog set name=#{name} where id=#{id}")
	public Integer updateCatelog(Catelog catelog); 

}
