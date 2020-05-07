<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>顶部</title>
	
    <script language="javascript">
		
		function logout(){
		   if(confirm("确定要退出本系统吗??")){
		   	   //为什么是  window.parent.location,父窗口引用
		   	   window.parent.location="../exitAdmin.do";
		   }
		}
    </script>
  </head>
  
  <body bgColor='#ffffff' style="margin: 0;padding: 0">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" style="background: url(../img/bg2.jpg);" >
	  <tr>
	    <td valign="top" width='30%' height="63" style="font-size:24px; font-weight: bold;">&nbsp;&nbsp;长江文学后台管理系统</td>
	    <td width='50%' align="right">
	    	<table width="450" border="0" cellspacing="0" cellpadding="0">
		      <tr>
			      <td align="right" height="26" style="padding-right:10px;line-height:26px;font-size:17px">
			        	<font style="font-size:16px; font-weight: bold;">
			        	    您好：${sessionScope.admin.userName }&nbsp;&nbsp;&nbsp;&nbsp;
			        	</font>
			        	<!--  [<a href="" target="_blank">网站主页</a>]-->
			        	
			        	[<a href="#" onclick="logout()">注销退出</a>]
			      </td>
	          </tr>
	        </table>
	    </td>
	  </tr>
	</table>
  </body>
</html>
