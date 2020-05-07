<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
		<title>图书试读</title>
		<style type="text/css">
			.topmenu {background: url(../../img/topmenu_bg.gif) #d10e00 repeat-x left top; height: 33px;}
			.cbody1 {margin: 0px auto; width:70%; background-color: #ffffff;}
			.topmenu ul {font-weight: bold; margin: 0px auto; overflow: hidden;height: 35px;}
			.topmenu ul li {background: url(../../img/topmenu_bg.gif) no-repeat left bottom; float: left; margin-left:15px;}
			.topmenu ul li a {padding-right: 12px; display: block; PADDING-LEFT: 14px; float: left; color: #ffffff; LINE-height: 37px; height: 35px; text-decoration:none;}
			.topmenu ul li a:hover {background: url(../../img/topmenu_o.gif) no-repeat center bottom; color: #cccccc; text-decoration:none;}
			.topmenu ul li a.thisclass {background: url(../../img/topmenu_o.gif) no-repeat center bottom; color: #ffff00;}
		</style>
        <script language="javascript">
            //********************************************************顶部方法
             var width=document.documentElement.clientWidth;
			 var height=document.documentElement.clientHeight; //屏幕可见区域宽、高
			 function register(){
				 window.location.href="../../qiantai/userinfo/register.jsp";
			 }
			 function myInfo(){
			 	<c:if test="${sessionScope.user==null}">
			          alert("请先登录");
			          return;
			    </c:if>
			 	var url="../../qiantai/userinfo/userXinxi.jsp";
			 	var top=(height-600)/2;
			 	var left=(width-560)/2;
			 	window.open(url,"我的信息","height=600,width=560,top="+top+",left="+left+",resizable=no,location=no,status=no");
			 }
			 function chongzhi(){
			 	<c:if test="${sessionScope.user==null}">
			          alert("请先登录");
			          return;
			    </c:if>
			 	var url="../../qiantai/book/chongzhi.jsp";
			 	var top=(height-400)/2;
			 	var left=(width-700)/2;
			 	window.open(url,"我的充值","height=400,width=700,top="+top+",left="+left+",resizable=no,location=no,status=no");
			 }
			 function liuyan(){
			 	<c:if test="${sessionScope.user==null}">
			          alert("请先登录");
			          return;
			    </c:if>
			 	window.location.href="../../selectLiuyan_qt.do";
			 }
			//********************************************************顶部方法
	        function addly(){
	        	<c:if test="${sessionScope.user==null}">
		            alert("请先登录");
		            return;
	     		</c:if>
				var content=document.lyForm.content.value;
				if(content.trim()==""){
					alert("请输入内容...");
					return;
				}
				if(content.trim().length>200){
					alert("内容字数不超过200");
					return;
				}
				document.lyForm.submit();
			}
	        function myLiuyan(user_id){
	        	window.location.href="../../selectMyLiuyan.do?user_id="+user_id;
	        }
	        function skipPage(page){
   				window.location.href="../../selectLiuyan_qt.do?indexPage="+page;
		    }
       </script>
  </head>
  <body style="background:url(../../img/bookBg.jpg);">
	    <div class="topmenu cbody1">
			<ul>
				<li class="thisclass"><a href="../../showBooks.do">网站首页</a></li>
			    <li class="thisclass"><a href="#" onclick="register()">用户注册</a></li>
			    <li class="thisclass"><a href="#" onclick="myInfo()">我的信息</a></li>
			    <li class="thisclass"><a href="#" onclick="chongzhi()">点券充值</a></li>
			    <li class="thisclass"><a href="#" onclick="liuyan()">留言板</a></li>
			</ul>
		</div>
		<div style="width:70%;margin:0px auto;margin-top:10px;">
			<table width="100%" cellpadding="4" cellspacing="0">
				<tr>
					<td align="center"> <font size="5">书城留言吧</font> </td>
				</tr>
				<tr>
					<td onclick="myLiuyan('${user.userId }')"> <font size="3" style="color:blue;cursor:pointer;">我的留言</font> </td>
				</tr>
				<c:forEach items="${liuyanList}" var="liuyan">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${liuyan.userName }：${liuyan.content } -- ${liuyan.shijian }
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="center">
					  <a href="#" onclick="skipPage(1)" >首  页</a>
					  &nbsp;&nbsp;
					  <a href="#" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}'">上一页</a>
					  &nbsp;&nbsp;
					  ${page.indexPage }/${page.pageCount }
					  <a href="#" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}')">下一页</a>
					  &nbsp;&nbsp;
					  <a href="#" onclick="skipPage('${page.pageCount}')">末   页</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="width:70%;margin:0px auto;margin-top:10px;">
			<form action="../../insertLiuyan.do" name="lyForm" method="post">
				<input type="hidden" value="${user.userId }" name="user_id"/>
				<p> <b>发表留言:</b> </p>
				<textarea name="content" cols="80" rows="10"></textarea><label>不超过200字</label> 
				<p style="color:blue;cursor:pointer;" onclick="addly()"> <b>提交</b> </p>
			</form>
		</div>
  </body>
</html>
