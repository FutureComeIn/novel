<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台首页</title>
    <style>
		body
		{
		  scrollbar-base-color:#C0D586;
		  scrollbar-arrow-color:#FFFFFF;
		  scrollbar-shadow-color:DEEFC6;
		}
	</style>
  </head>
 				 <!-- 先上下分块，然后下面部分再左右分块-->
  <frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
	  <frame src="/admin/top.jsp" name="topFrame" scrolling="no">
	  <frameset cols="180,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
	    <frame src="/admin/menu.jsp" noresize name="menu" scrolling="yes">
	    <frame src="/admin/index/sysPro.jsp" noresize name="main" scrolling="yes">
	  </frameset>

  </frameset>
  <noframes>
	  <body>您的浏览器不支持框架！</body>
  </noframes>
</html>
