<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>公告管理</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>	 <!-- a标签样式 -->	
        <script language="javascript">
           function gonggaoAdd(){
              window.location.href="../../admin/gonggao/gonggaoAdd.jsp";
           }
           function del(id){
           		if(confirm("您确认删除该公告吗?")){
           			window.location.href="../../deleteGonggao.do?id="+id;
           		}
           }
           function skipPage(page){
	   			window.location.href="../../showGonggao_ht.do?indexPage="+page;
  		   }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="25" colspan="5" align="center" background="<%=path %>/img/tbg.gif">网站公告</td>
				</tr>
				<tr>
				    <td colspan="5">
				      <input type="button" value="添加公告" style="width: 80px;" onclick="gonggaoAdd()" />
				    </td>
			  	</tr>
			  	<tr bgcolor="#FAFAF1"> 
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" >
				    <td width="3%">ID</td>
					<td width="10%">标题</td>
					<td width="76%">内容</td>
					<td width="6%">发布时间</td>
					<td width="5%">删除</td>
		        </tr>	
			    <c:forEach items="${gonggaoList }" var="gonggao">
				<tr bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='skyblue';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td align="center">
						${gonggao.id }
					</td>
					<td align="center">
						${gonggao.title }
					</td>
					<td>
					    ${gonggao.content }
					</td>
					<td align="center">
						 ${gonggao.sendtime }
					</td>
					<td align="center">
						<button onclick="del('${gonggao.id}')">删除</button> 
					</td>
				</tr>
				</c:forEach>
				<tr bgcolor="#FAFAF1" style="font-size:20px;">
					<td colspan="5" align="center">
					  <a href="javascript:;" onclick="skipPage(1)" style="font-size:20px;">首  页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}'">上一页</a>
					  &nbsp;&nbsp;
					  ${page.indexPage }/${page.pageCount }
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}')">下一页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}')">末   页</a>
					</td>
				</tr>
			</table>
	</body>
</html>
