package com.yxw.xiaoshuospring.utils;

import java.util.List;

/**
 * 数据接口模型标准化
 * @author kerwin
 *
 */
public class APIRequest <T> implements java.io.Serializable {
	public APIRequest() {
	
	}

	// 当次请求是否成功
	private boolean isResult;
	// 当前请求响应回来的数据
	private String message;
	// 单个对象数据的返回
	private Object singerData;
	// 多个对象的数据返回
	private List<T> datas;
	
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	public boolean getIsResult() {
		return isResult;
	}
	public void setIsResult(boolean isResult) {
		this.isResult = isResult;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getSingerData() {
		return singerData;
	}
	public void setSingerData(Object singerData) {
		this.singerData = singerData;
	}
	@Override
	public String toString() {
		return JSONUtils.toJSON(this) ;
	}
	
}
