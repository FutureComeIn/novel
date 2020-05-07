<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>章节管理</title>
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>	 <!-- a标签样式 -->	
        <script language="javascript">
           <% 
           		String message=(String)request.getAttribute("message");
           		if("yes".equals(message)){
           %>	
           			alert("更新成功...");
           <% 
           		}
           		if("no".equals(message)){
           %>
           			alert("更新成功...");
           <% 
           		}
           %>
           function zhangDel(id,bookId){
               if(confirm('您确定删除吗？')){
                   window.location.href="../../deleteZhangjie.do?id="+id+"&book_id="+bookId;
               }
           }
           
           function zhangAdd(book_id){
				 window.location.href="../../admin/zhang/zhangAdd.jsp?book_id="+book_id;
           }
           function zhangDetail(id,book_id){
                 window.location.href="../../showZhangjieDetail.do?id="+id+"&book_id="+book_id;
				
           }
           function zhangUpdate(id){
                 window.location.href="../../showZhangjieById.do?id="+id;
           }
           function skipPage(page,book_id){
        	   window.location.href="../../showZhangjie.do?indexPage="+page+"&book_id="+book_id;
  		   }
       </script>
	</head>

	<body>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td align="center" height="28" colspan="5" background="<%=path %>/img/tbg.gif">&nbsp;章节信息管理&nbsp;</td>
				</tr>
				<tr bgcolor="#FAFAF1">
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
				    <td colspan="5">
				      <input type="button" value="添加章节" style="width: 80px;" onclick="zhangAdd(${book_id})" />
				    </td>
			  	</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">ID</td>
					<td width="10%">小说名称</td>
					<td width="10%">章节名称</td>
					<td width="65%">章节内容</td>
					<td width="10%">操作</td>
		        </tr>	
				
				<c:forEach items="${zhangjieList}" var="zhangjie">
				
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${zhangjie.id }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${zhangjie.bookName }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${zhangjie.mingcheng }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="javascript:;" style="font-size:16px;color:blue" onclick="zhangDetail(${zhangjie.id},${book_id })">${zhangjie.neirong }</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="zhangDel(${zhangjie.id },${zhangjie.book_id })"/>&nbsp;
						<input type="button" value="修改" onclick="zhangUpdate(${zhangjie.id })"/>
					</td>
				</tr>
				
				</c:forEach>
				<tr style="font-size:20px;">
					<td colspan="5" align="center">
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage(1,'${book_id }')" >首  页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}','${book_id }')">上一页</a>
					  &nbsp;&nbsp;
					  ${page.indexPage }/${page.pageCount }
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}','${book_id }')">下一页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}','${book_id }')">末   页</a>
					</td>
				</tr>
			</table>
	</body>
</html>
