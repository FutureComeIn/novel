<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript">
  		function adminLogin(){
			window.parent.location="../../login.jsp"; //在父窗口打开界面，而不是新开一个界面
		}
  	</script>
  </head>
  
  <body>
        <div class="foot_pic">
        	<img src="../../img/foot1.gif"/>
        </div>
		<div class="left foot_msg">
			长江文学  打开新世界<br/>
			电话：88888888  传真：8888-1234567 --<a target="_blank" href="javascript:;" onclick="adminLogin()">管理登录</a>
		</div>
  </body>
</html>
