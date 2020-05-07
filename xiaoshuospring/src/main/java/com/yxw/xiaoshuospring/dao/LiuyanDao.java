package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Liuyan;
import com.yxw.xiaoshuospring.utils.SqlUtils;

@Service
public interface LiuyanDao {
	@Delete("delete from liuyan where user_id=#{user_id}")
	public Integer deleteByUserid(Integer user_id);
	
	@Insert("insert into liuyan values(0,#{content},#{shijian},#{user_id})")
	public Integer insertLiuyan(Liuyan liuyan);
	
	@SelectProvider(type=SqlUtils.class,method="selectCountLiuyan")
	public Integer selectCountLiuyan(Liuyan liuyan);
	@SelectProvider(type=SqlUtils.class,method="selectLiuyan")
	public List<Liuyan> selectLiuyan(RowBounds rb,Liuyan liuyan);
	
}
