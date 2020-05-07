<%@ page language="java" pageEncoding="UTF-8"%>

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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;用户信息&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">用户名</td>
					<td width="10%">密 码</td>
					<td width="10%">真实姓名</td>
					<td width="10%">性别</td>
					<td width="10%">年龄</td>
					<td width="10%">住址</td>
					<td width="10%">联系方式</td>
					<td width="10%">E-mail</td>
					<td width="10%">QQ</td>
		        </tr>	
	>
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 111
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 222
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 333
					</td>
					<td bgcolor="#FFFFFF" align="center">
						444
					</td>
					<td bgcolor="#FFFFFF" align="center">
						555
					</td>
					<td bgcolor="#FFFFFF" align="center">
						666
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 777
					</td>
					<td bgcolor="#FFFFFF" align="center">
						888
					</td>
					<td bgcolor="#FFFFFF" align="center">
						999
					</td>
				</tr>
		
			</table>
	</body>
</html>
