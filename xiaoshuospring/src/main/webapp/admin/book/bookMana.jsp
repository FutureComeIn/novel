<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>	 <!-- a标签样式 -->	
        <script language="javascript">
        	<%
        		String delMsg=request.getParameter("delMsg");
        		if("ok".equals(delMsg)){
        	%>
        		alert("小说删除成功...");
        	<%
        		}
        	%>
           function loadFujian(bookid){
           		if(confirm("确认下载该小说吗?")){
			   		var url="../../loadBook.do?id="+bookid;
			   		window.location.href=url;
           		}
           }
		   function deleteBook(bookid){
		       if(confirm("确定删除该小说吗?")){
		   			window.location.href="../../deleteBook.do?id="+bookid;
		       }
		   }
		   function updateBook(bookid){
	   			var url="../../selectBookById.do?bookid="+bookid;
	   			window.location.href=url;
		   }
          
           function showZj(bookid) {
           		window.location.href="../../showZhangjie.do?book_id="+bookid;
           }
           function skipPage(page,catelog_id){
	   			var formObj=document.getElementById("searchForm");
	   			formObj.action="../../showBooks_ht.do?indexPage="+page+"&catelog_id="+catelog_id;
	   			formObj.submit();
   		   }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
		<!-- 搜索框 -->
		<form id="searchForm" name="sform" action="../../showBooks_ht.do" method="post">
			<table width="100%" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="25" colspan="8" align="center" background="<%=path %>/img/tbg.gif">小说信息管理</td>
				</tr>
				<tr>
					<td colspan="8" height="30" align="center">
						<input type="text" name="name" placeholder="名称" size="18" value="${searchBook.name }"/>&nbsp;&nbsp;
						<input type="text" name="zuozhe" placeholder="作者" size="18" value="${searchBook.zuozhe }"/>&nbsp;&nbsp;
						<select name="catelog_id">
							<c:forEach items="${catelogList}" var="catelog">
								<option value="${catelog.id}">${catelog.name }</option>
							</c:forEach>
						</select> &nbsp;&nbsp;
						<input type="submit" value="搜索" size="10"/>
					</td>
				</tr>
				<tr bgcolor="#FAFAF1"> 
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1">
					<td width="3%">ID</td>
					<td width="8%">名称</td>
					<td width="6%">作者</td>
					<td width="5%">所属类别</td>
					<td width="5%">下载点券</td>
					<td>小说介绍</td>
					<td width="5%">附件下载</td>
					<td width="12%">操作</td>
		        </tr>	
				<c:forEach items="${bookList}" var="book">
				<tr bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='skyBlue';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td align="center" >
						${book.id }
					</td>
					<td align="center" >
						${book.name }
					</td>
					<td align="center">
						${book.zuozhe }
					</td>
					<td align="center">
						${book.catelogName }
					</td>
					<td align="center">
						${book.dianquan }
					</td>
					<td>
						${book.jieshao }
					</td>
					<td align="center">
						<a  style="font-size: 15px;color: red;cursor:pointer;" onclick="loadFujian(${book.id })">附件下载</a>
					</td>
					<td align="center">
						<input type="button" value="删除" onclick="deleteBook(${book.id})"/>
						<input type="button" value="修改" onclick="updateBook(${book.id})"/>
						<input type="button" value="章节管理" onclick="showZj(${book.id})"/>
					</td>
				</tr>
				</c:forEach>
				<tr bgcolor="#FAFAF1" style="font-size:20px;">
					<td colspan="8" align="center">
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage(1,'${searchBook.catelog_id }')" >首  页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}','${searchBook.catelog_id }')">上一页</a>
					  &nbsp;&nbsp;
					  ${page.indexPage }/${page.pageCount }
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}','${searchBook.catelog_id }')">下一页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}','${searchBook.catelog_id }')">末   页</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
