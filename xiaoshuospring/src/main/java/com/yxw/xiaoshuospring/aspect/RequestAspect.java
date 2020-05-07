package com.yxw.xiaoshuospring.aspect;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yxw.xiaoshuospring.annotation.MonitorRequest;
import com.yxw.xiaoshuospring.pojo.Admin;

/**
 * 此类为一个切面类，主要作用就是对接口的请求进行拦截 拦截的方式，只需要在指定接口方法上面加上@MonitorRequest注解即可
 *
 * @author guguoyu
 * @version 1.0
 * @since 2018/10/28
 */
@Aspect
@Component
public class RequestAspect{

	// 使用org.slf4j.Logger,这是spring实现日志的方法
	private final static Logger logger = LoggerFactory.getLogger(RequestAspect.class);

	/**
	 * 表示在执行被@MonitorRequest注解修饰的方法之前 会执行doBefore()方法
	 *
	 * @param joinPoint 连接点，就是被拦截点
	 */
	@Before(value = "@annotation(com.yxw.xiaoshuospring.annotation.MonitorRequest)")
	public void doBefore(JoinPoint joinPoint) {
		// 获取到请求的属性 (org.apache.catalina.connector.RequestFacade@11abeec7)
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		// 获取到请求对象 (org.apache.catalina.connector.RequestFacade@11abeec7)
		HttpServletRequest request = attributes.getRequest();
		HttpServletResponse response=attributes.getResponse();
		
		//logger.info("") 作用：在控制台打印内容
		
		logger.info("url=" + request.getRequestURL()); //根据请求对象拿到访问的地址：http://localhost:8080/test
		
		logger.info("method=" + request.getMethod()); // 获取请求的方法，是Get还是Post请求
	
		logger.info("ip=" + request.getRemoteAddr()); // ip：获取到访问 0:0:0:0:0:0:0:1
		
		logger.info("class=" + joinPoint.getSignature().getDeclaringTypeName() + "and method name="
				+ joinPoint.getSignature().getName()); // 获取被拦截的类名和方法名
	
		logger.info("参数=" + joinPoint.getArgs().toString()); 	// 参数
		try {
			System.out.println("ip="+getIpAddress(request));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			Admin admin=(Admin) request.getSession().getAttribute("admin");
			
	        String clsStr = joinPoint.getSignature().getDeclaringTypeName(); // 获取被拦截的类名
			String methodStr = joinPoint.getSignature().getName(); // 获取被拦截的方法名
			String returnAddress = "";
			@SuppressWarnings("rawtypes")
			Class targetClass = Class.forName(clsStr);
			Method[] methods = targetClass.getMethods(); // 拿到该class下的所有方法
			for (Method method : methods) {
				if (method.getName().equals(methodStr)) {
					MonitorRequest monitor = method.getAnnotation(MonitorRequest.class); // 获得注解类对象
					if (monitor.returnAddress() != null) {
						// 获得操作内容
						returnAddress = monitor.returnAddress();
					}
					break;
				}
			}
			//System.out.println("add="+returnAddress.substring(0,5));  //前面是开始位置，后面是长度
			if(admin==null) {
		    	   if("admin".equals(returnAddress.substring(0,5))) {
		    		   request.getRequestDispatcher("login.jsp").forward(request,response);
		    	   }
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	 public final static String getIpAddress(HttpServletRequest request) throws IOException {
	        // 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址
	        String ip = request.getHeader("X-Forwarded-For");
	        if (logger.isInfoEnabled()) {
	            logger.info("getIpAddress(HttpServletRequest) - X-Forwarded-For - String ip=" + ip);
	        }

	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	                ip = request.getHeader("Proxy-Client-IP");
	                if (logger.isInfoEnabled()) {
	                    logger.info("getIpAddress(HttpServletRequest) - Proxy-Client-IP - String ip=" + ip);
	                }
	            }
	            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	                ip = request.getHeader("WL-Proxy-Client-IP");
	                if (logger.isInfoEnabled()) {
	                    logger.info("getIpAddress(HttpServletRequest) - WL-Proxy-Client-IP - String ip=" + ip);
	                }
	            }
	            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	                ip = request.getHeader("HTTP_CLIENT_IP");
	                if (logger.isInfoEnabled()) {
	                    logger.info("getIpAddress(HttpServletRequest) - HTTP_CLIENT_IP - String ip=" + ip);
	                }
	            }
	            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	                if (logger.isInfoEnabled()) {
	                    logger.info("getIpAddress(HttpServletRequest) - HTTP_X_FORWARDED_FOR - String ip=" + ip);
	                }
	            }
	            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	                ip = request.getRemoteAddr();
	                if (logger.isInfoEnabled()) {
	                    logger.info("getIpAddress(HttpServletRequest) - getRemoteAddr - String ip=" + ip);
	                }
	            }
	        } else if (ip.length() > 15) {
	            String[] ips = ip.split(",");
	            for (int index = 0; index < ips.length; index++) {
	                String strIp = (String) ips[index];
	                if (!("unknown".equalsIgnoreCase(strIp))) {
	                    ip = strIp;
	                    break;
	                }
	            }
	        }
	        return ip;
	    }

}
