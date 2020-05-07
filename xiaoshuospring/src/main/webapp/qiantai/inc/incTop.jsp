<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <style type="text/css">
        .Header {margin: 0px auto;background: url(../../img/bookLogo2.jpg); height:105px;width:1100px;}
    </style>
     <script type="text/javascript">
     	 var width=document.documentElement.clientWidth;
     	 var height=document.documentElement.clientHeight; //屏幕可见区域宽、高
     	 
     	 function showBook(id){
         	var url="../showBooks.do?catelog_id="+id;
         	var formObj=document.getElementById("searchForm");
			formObj.action=url;
			formObj.submit();
         }
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
   </script>
  </head>
  <body>
 		<!-- banner  -->
        <div class="Header"> </div>
		 <!-- 菜单  -->
		<div class="topmenu">
			<ul>
				<li class="thisclass"><A href="../showBooks.do">网站首页</A></li>
				<c:forEach items="${catelogList}" var="catelog">
					<li class="thisclass"><A href="#" onclick="showBook('${catelog.id}')">${catelog.name }</A></li> 
				</c:forEach>
			    <li class="thisclass"><a href="#" onclick="register()">用户注册</a></li>
			    <li class="thisclass"><a href="#" onclick="myInfo()">我的信息</a></li>
			    <li class="thisclass"><a href="#" onclick="chongzhi()">点券充值</a></li>
			    <li class="thisclass"><a href="#" onclick="liuyan()">留言板</a></li>
			</ul>
		</div>
		<!-- 搜索框 -->
		<form id="searchForm" name="sform" action="../showBooks.do" method="post">
			<div class="topsearch">
				<div class="title"></div>
				<div id="page_search_left" style="width:700px;font-size:18px;">
					名称：<input  class="inputText" id="" size="25" name="name" type="text" value="${searchBook.name }"/>
					&nbsp;&nbsp;
					作者：<input  class="inputText" id="" size="25" name="zuozhe" type="text" value="${searchBook.zuozhe }"/>
				</div>
				<div id="page_search_btn">
					<input type="submit" value="搜索" style="font-size:16px;">
				</div>
			</div>
		</form>
  </body>
</html>
