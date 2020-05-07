<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<script type="text/javascript" src="../../js/jquery-1.8.3.js" ></script>
		<script type="text/javascript" src="../../js/ShowDate.js" ></script>  <!-- 360浏览器不需要也可以 -->
		
        <script language="javascript">
        	<%
        		String forbidMsg=(String)request.getAttribute("message");
        		if("ok".equals(forbidMsg)){
        	%>
        			alert("封号成功...");
        	<%
        		}
        		if("error".equals(forbidMsg)){
        	%>
        			alert("封号失败...");
        	<%
        		}
        	%>
        	function skipPage(page){
    			var formObj=document.getElementById("searchForm");
    			formObj.action="../../selectUser.do?indexPage="+page;
    			formObj.submit();
    		}
        	function forbid(userId){
        		if(confirm("您确定对该用户进行封号处理吗,同时该用户的充值记录将删除?")){
        			var url="../../deleteUser.do?userId="+userId;
        			window.location.href=url;
        		}
        	}
        	function fillDel(){
        		var del=$("#del").val();
        		if("Y"==del){
        			$("#rdel").attr("checked",true);
        		}
        	}
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif' onload="fillDel()">
	 		<!-- 搜索框 -->
			<form id="searchForm" name="sform" action="../../selectUser.do" method="post" style="text-align:center">
			
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="20" colspan="10" background="<%=path %>/img/tbg.gif">用户管理</td>
				</tr>
				<tr style="text-align:left">
					<td colspan="10" height="20">
						<input type="text" name="loginname" placeholder="昵称" size="18" value="${searchUser.loginname }"/>&nbsp;&nbsp;
						<input type="date" name="registerTime" placeholder="注册时间" size="15" value="${searchUser.registerTime }"/>&nbsp;&nbsp;
						<input type="text" name="dianquan" placeholder="点券数" size="10" value="${searchUser.dianquan }"/>&nbsp;&nbsp;
						<input type="checkbox"  value='Y' name="del" id="rdel" />封号用户&nbsp;&nbsp;
						<input type="hidden"  value='${searchUser.del }' id="del"  />
						<input type="submit" value="搜索" size="10"/>
					</td>
				</tr>
				<tr bgcolor="#FAFAF1"> 
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr bgcolor="#FAFAF1">
				    <td width="4%">ID</td>
					<td width="10%">昵称</td>
					<td width="10%">密码</td>
					<td width="5%">性别</td>
					<td width="10%">年龄</td>
					<td width="10%">联系方式</td>
					<td width="10%">E-mail</td>
					<td width="5%">点券</td>
					<td width="10%">注册时间</td>
					<td width="10%">操作</td>
		        </tr>	
				
				<c:forEach items="${userList }" var="user">
				<tr bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='skyblue';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td>
						${user.userId }
					</td>
					<td>
						${user.loginname }
					</td>
					<td>
						${user.loginpw }
					</td>
					<td>
						${user.sex }
					</td>
					<td>
						${user.age }
					</td>
					<td>
						${user.tel }
					</td>
					<td>
						${user.email }
					</td>
					<td>
						${user.dianquan }
					</td>
					<td>
						${user.registerTime }
					</td>
					<td>
						<c:if test="${user.del eq 'N'}">
							<a href="javascript:;" onclick="forbid('${user.userId}')" style="font-size:20px;color:blue">封号</a>
						</c:if>
						<c:if test="${user.del eq 'Y'}">
							&nbsp;
						</c:if>
						
					</td>
				</tr>
				</c:forEach>
				<tr bgcolor="#FAFAF1" style="font-size:20px;">
					<td colspan="10" align="center">
					  <a href="javascript:;" onclick="skipPage(1)" style="font-size:20px;">首  页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}')">上一页</a>
					  &nbsp;&nbsp;
					  ${page.indexPage }/${page.pageCount }
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}')">下一页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}')">末   页</a>
					</td>
				</tr>
				
			</table>
			</form>
	</body>
</html>
