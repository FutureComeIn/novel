<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>留言板信息管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link> <!-- a标签样式 -->
		<script type="text/javascript">
			function delLiuyan(id){
				if(confirm("您确认删除该留言吗?")){
					window.location.href="../../deleteLiuyan.do?id="+id;
				}
			}
			function skipPage(page){
	   			var formObj=document.getElementById("searchForm");
	   			formObj.action="../../selectLiuyan.do?indexPage="+page;
	   			formObj.submit();
   		   }
		</script>
	</head>

	<BODY leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
    	<form id="searchForm" action="../../selectLiuyan.do" name="searchForm" method="post" style="text-align:center">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			
			<tr bgcolor="#E7E7E7">
				<td height="25" align="center" colspan="8" background="<%=path %>/img/tbg.gif">留言管理</td>
			</tr>
			<TR>
				<td colspan="5">
					<input type="text" name="user_id" value="${searchLiuyan.user_id }" placeholder="留言人编号" /> &nbsp;&nbsp;
					<input type="submit" value="搜索"/>
				</td>
			</TR>
			<TR bgcolor="#FAFAF1"> 
				<td colspan="5">&nbsp;</td>
			</TR>
			<TR align="center" bgcolor="#FAFAF1">
				<td width="3%">ID</td>
				<td width="12%">留言时间</td>
				<td width="72%">内容</td>
				<td width="8%">留言用户(编号)</td>
				<td width="5%">删除</td>
			</TR>
			<c:forEach items="${liuyanList }" var="liuyan">
			<TR bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='skyblue';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td align="center">${liuyan.id }</td>
				<td align="center">${liuyan.shijian }</td>
				<td>${liuyan.content }</td>
				<td align="center">${liuyan.userName }(${liuyan.user_id })</td>
				<td align="center"><button type="button" onclick="delLiuyan(${liuyan.id })">删除</button></td>
			</TR>
			</c:forEach>
			<tr bgcolor="#FAFAF1" style="font-size:20px;">
				<td colspan="5" align="center">
				  <a href="javascript:;" style="font-size:20px;" onclick="skipPage(1)" >首  页</a>
				  &nbsp;&nbsp;
				  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}')">上一页</a>
				  &nbsp;&nbsp;
				  ${page.indexPage }/${page.pageCount }
				  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}')">下一页</a>
				  &nbsp;&nbsp;
				  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}')">末   页</a>
				</td>
			</tr>
		</TABLE>
		</form>
	</BODY>
</html>
