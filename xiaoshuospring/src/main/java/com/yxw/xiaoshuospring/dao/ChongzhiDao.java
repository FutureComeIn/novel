package com.yxw.xiaoshuospring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.yxw.xiaoshuospring.pojo.Chongzhi;
import com.yxw.xiaoshuospring.utils.SqlUtils;

@Service
public interface ChongzhiDao {
	@Delete("delete from chongzhi where user_id=#{user_id}")
	public Integer deleteChongzhi(Integer user_id);
	@Delete("delete from chongzhi where id=#{id}")
	public Integer deleteChongzhiById(Integer id);
	
	@Insert("insert into chongzhi values(0,#{user_id},#{dianquan},#{fukuanfangshi},#{shijian},'N')")
	public Integer insertChongzhi(Chongzhi chongzhi);
	
	
	@SelectProvider(type=SqlUtils.class,method="selectCountChongzhi")
	public Integer selectCountChongzhi(Chongzhi chongzhi);
	@SelectProvider(type=SqlUtils.class,method="selectChongzhi")
	public List<Chongzhi> selectChongzhi(Chongzhi chongzhi,RowBounds rb);

	@Update("update chongzhi set zhuangtai='Y' where id=#{id}")
	public Integer updateZt(Integer id);
}
