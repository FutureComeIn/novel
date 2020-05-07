<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<title>更多公告</title>
		<style type="text/css">
			.topmenu {background: url(../../img/topmenu_bg.gif) #d10e00 repeat-x left top; height: 33px;}
			.cbody1 {margin: 0px auto; width:90%; background-color: #ffffff;}
			.topmenu ul {font-weight: bold; margin: 0px auto; overflow: hidden;height: 35px;}
			.topmenu ul li {background: url(../../img/topmenu_bg.gif) no-repeat left bottom; float: left; margin-left:15px;}
			.topmenu ul li a {padding-right: 12px; display: block; PADDING-LEFT: 14px; float: left; color: #ffffff; LINE-height: 37px; height: 35px; text-decoration:none;}
			.topmenu ul li a:hover {background: url(../../img/topmenu_o.gif) no-repeat center bottom; color: #cccccc; text-decoration:none;}
			.topmenu ul li a.thisclass {background: url(../../img/topmenu_o.gif) no-repeat center bottom; color: #ffff00;}
		</style>
        <script language="javascript">
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
        	function skipPage(page){
   				window.location.href="../../showGonggao.do?indexPage="+page;
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
		<div style="width:90%;margin:0px auto;background-color:#fff">
			<table width="100%" border="1" cellpadding="4" cellspacing="0"  style="margin-top:10px;">
				<caption>网站公告</caption>
				<tr align="center">
					<th width="10%">标题</th>
					<th width="75%">内容</th>
					<th width="10%">发布时间</th>
				</tr>
				 <c:forEach items="${gonggaoList }" var="gonggao">
				<tr>
					<td align="center">
						${gonggao.title }
					</td>
					<td>
					    <b>${gonggao.content }</b>
					</td>
					<td align="center">
						 ${gonggao.sendtime }
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">
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
	</body>
</html>
