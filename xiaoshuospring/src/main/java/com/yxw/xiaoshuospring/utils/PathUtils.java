package com.yxw.xiaoshuospring.utils;

import java.io.File;
import java.lang.Character.UnicodeBlock;

import javax.servlet.http.HttpServletRequest;

public class PathUtils {

	public static String datapath; //文件夹名+图片名(存储在数据库的img字段)
	
	/**
	 * 参数解析：fileName是上传的图片的原始名称,作用是提供 后缀
	 * 		dirName:文件夹名(一般是传 upload 过来)
	 * 		request: request.getServletContext().getRealPath("/")->得到工程所在的绝对路径
	 *        		  F:\new_eclipsework_maven\springbootbbs2\src\main\webapp 
	 * @return 返回的是图片上传后存放的绝对路径
	 */
	public static String getPath(HttpServletRequest request,String dirName,String fileName) {
		String path = request.getServletContext().getRealPath("/")+dirName+"/";
		/*
		 * System.out.println("PathUtils="+path);
		   F:\new_eclipsework_maven\insuranceSpring\src\main\webapp upload/  
		*/
		
		File file = new File(path); //创建文件夹upload
		if(!file.exists()) {
			file.mkdir();
		}
		
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		//String datastr = sdf.format(new Date());
	    //String fix = fileName.substring(fileName.lastIndexOf("."),fileName.length());
	    
	    //String fname = datastr + fix; 		//小说名：时间戳+后缀
	    datapath = dirName+ "/" + fileName; 	//数据库文件列的字段：文件夹名+小说名
		return path + fileName;				//图片上传后存放的绝对路径
	}	
	/**
	 * 字符串中文第一次出现的位置
	 * @param str
	 * @return
	 */
	public static int firstChineseIndex(String str) {
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            UnicodeBlock ub = UnicodeBlock.of(c);
            // 第一次出现中文的索引
            if (ub == UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
                    || ub == UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
                    || ub == UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
                    || ub == UnicodeBlock.GENERAL_PUNCTUATION
                    || ub == UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
                    || ub == UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
                return i;
            }
        }
        return str.length();
    }

}


