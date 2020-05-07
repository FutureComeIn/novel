<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String title=request.getParameter("title");
	String sendtime=request.getParameter("sendtime");
	String content=request.getParameter("content");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>公告信息</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
	</head>

	<body background="../../img/bookBg.jpg">
		<form>
		<table width="98%" border="0" align="center" cellpadding="10" cellspacing="1">
			<tr>
				<th height="40" colspan="2" class="f12b-red" style="font-size:30px;">
					公 告 详 细 信 息
				</th>
			</tr>
			<tr style="font-size:20px;">
				<td width="30%" height="30" align="right">
					标  题：
				</td>
				<td width="70%">
					&nbsp;<input type="text" size="30" name="loginname" id="loginname" value="<%=title %>" />
				</td>
			</tr>
			<tr style="font-size:20px;">
				<td height="30" align="right">
					发布时间：
				</td>
				<td>
					&nbsp;<input type="text" size="30" name="loginname" id="loginname" value="<%=sendtime %>" />
				</td>
			</tr>
			<tr style="font-size:20px;">
				<td height="30" align="right">
					内  容：
				</td>
				<td>
					<textarea rows="14" cols="40"><%=content %></textarea>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
