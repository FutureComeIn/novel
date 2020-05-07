<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script type="text/javascript">
	        function reg(){
	                window.location.href="../../qiantai/userinfo/register.jsp";
	        }
	        //js没有trim方法
	        function trim(str){ //删除左右两端的空格 
	     　　     	return str.replace(/(^\s*)|(\s*$)/g, "");
	     　　 	}
	        function check(){
	        	if(trim(document.ThisForm.loginname.value)==""){
				 	alert("请输入用户名");
					return false;
				 }
				 if(trim(document.ThisForm.loginpw.value)==""){
				 	alert("请输入密码");
					return false;
				 }
				document.ThisForm.submit(); 
			     
			}
			function exitUser(){
				if(confirm("您确定退出登录吗?")){
					var obj1=document.getElementById("loginDiv");
					obj1.style.display="block";
					var obj2=document.getElementById("loginSuccessDiv");
					obj2.style.display="none";
					window.location.href="../../exitUser.do";
				}
			}
	</script>
  </head>
  
  <body style="font-size:32px;">
  	 <!-- 登陆的表单 -->
  	<div style="display: block" id="loginDiv">
		<form action="../../userLogin.do" name="ThisForm" method="post">
	      <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
	          <tr>
	            <td align="center" colspan="2" height="10"></td>
	          </tr>
	          <tr>
	            <td align="right" width="31%" height="30">用户名：</td>
	            <td align="left" width="69%"><input class="inputText" size="28" name="loginname" type="text" /></td>
	          </tr>
	          <tr>
	            <td align="right" height="30">密　码：</td>
	            <td align="left"><input class="inputText" type="password" size="28" name="loginpw"/></td>
	          </tr>
	          <tr>
	            <td align="center" colspan="2" height="10"></td>
	          </tr>
	          <tr>
	            <td align="center" colspan="2" height="30">
	               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	               <input type="button" value="登  录" onclick="check()" style="border:#ccc 1px solid;font-size:14px; padding-top:3px;" />
				   &nbsp;
				   <input type="button" value="注  册" onclick="reg()" style="border:#ccc 1px solid; font-size:14px; padding-top:3px;" />
	            </td>
	          </tr>
	      </table>
	    </form>
	 </div>
	
	<!-- 登陆成功后  需要显示的DIV -->
	 <div style="display: none" id="loginSuccessDiv">
	        <br/>
		     欢迎您：${user.loginname } &nbsp;&nbsp;&nbsp;&nbsp;
		    <a href="#" onclick="exitUser()">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
		    <br/><br/><br/>
	</div>
  </body>
</html>
