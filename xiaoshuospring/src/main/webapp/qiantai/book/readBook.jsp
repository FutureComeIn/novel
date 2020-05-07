<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
     		 
	        function zhangDetail(id,book_id){
	            window.location.href="../../showZhangjieDetail_qt.do?id="+id+"&book_id="+book_id;
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
		<div style="width:70%;margin:0px auto;background-color:#fff">
			<table width="100%" border="1" cellpadding="4" cellspacing="0"  style="margin-top:10px;">
				<tr>
					<td align="center"> <font size="5">${zhangjie.mingcheng}</font> </td>
				</tr>
				<tr>
					<td>
						${zhangjie.neirong}
					</td>
				</tr>
			</table>
			<table width="98%" cellpadding="5" cellspacing="2" style="margin-top:10px;margin:0px auto">
				<tr>
					<td colspan="8">
						<font size="5">目录</font>
					</td>
				</tr>
				<tr>
				<c:forEach items="${zhangjieList}" var="zhang" varStatus="sta">
					 <c:if test="${sta.index%8==0}">  <!-- 每隔八个章节换一行 -->
					     <tr></tr>
					 </c:if>
						<td bgcolor="#E7E7E7" align="center">
	                        <a href="#" onclick="zhangDetail('${zhang.id}','${zhang.book_id}')">${zhang.mingcheng}</a>
						</td>  
				</c:forEach>
				</tr>
			</table>
		</div>
	</body>
</html>
