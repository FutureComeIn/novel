<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>充值用户信息</title>
    <style type="text/css">
    	input{readonly:readonly}
    </style>
    
    <script type="text/javascript"> 
    	 function closeOpen(){
		       window.returnValue=false;
		       window.close();
		 }
		 
		 function show(){	
			 //处理性别按钮的选中
	    	var sex="${user_admin.sex}";
	    	var man=document.getElementById("man");
	    	var woman=document.getElementById("woman");
	    	if(man.value==sex){
	    		man.checked="checked";
	    	}
	    	if(woman.value==sex){
	    		woman.checked="checked";
	    	}
		}
		window.onload=show;
    </script>

  </head>
  
  <body>
    <form action="" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<th height="40" colspan="2" bgcolor="#FFFFFF" class="f12b-red" style="font-size: 11px;">
							充 值 用 户 信 息
						</th>
					</tr>
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							序号：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userId" id="userId" value="${sessionScope.user_admin.userId}" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							账号：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="loginname" id="loginname" value="${sessionScope.user_admin.loginname}" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密 码：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="loginpw" value="${sessionScope.user_admin.loginpw}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							姓名：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="name" value="${sessionScope.user_admin.rname}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							性别：
						</td>
						<td bgcolor="#FFFFFF">
							
							&nbsp;
							<input type="radio" name="sex" value="男" id="man"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="女" id="woman"/>女
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							年龄：
						</td>
						<td bgcolor="#FFFFFF">
						    &nbsp;
							<input type="text" name="age" value="${sessionScope.user_admin.age}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							住址：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="address" value="${sessionScope.user_admin.address}" />
						</td>
					</tr>
					
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							联系方式：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="tel" value="${sessionScope.user_admin.tel}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							E-mail：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="email" value="${sessionScope.user_admin.email}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							QQ：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="qq" value="${sessionScope.user_admin.qq}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							点券：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="qq" value="${sessionScope.user_admin.dianquan}" readonly="readonly"/>
						</td>
					</tr>
					
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							
							<input type="button" value="确认" onclick="closeOpen();"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
							
						</td>
					</tr>
				</table>
			</form>
  </body>
</html>
