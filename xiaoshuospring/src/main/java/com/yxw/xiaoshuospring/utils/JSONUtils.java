package com.yxw.xiaoshuospring.utils;


import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONUtils {

	
	public static String toJSON(Object obj) {
		
		String json = null;
		ObjectMapper om = new ObjectMapper();
		try {
			json = om.writeValueAsString(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
}
