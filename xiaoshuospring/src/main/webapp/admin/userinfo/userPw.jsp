<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

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
        
		<script type="text/javascript">
				<%
					String tishi=(String)request.getAttribute("updateAdminPwMsg");
					if("yes".equals(tishi)){
				%>
					alert("修改密码成功...");
				<%
					}
					if("no".equals(tishi)){
				%>
					alert("修改密码失败...");
				<%
					}
				%>
			function check(){
				var loginPw=document.formPw.loginPw.value;
				var pw=document.formPw.userPw.value; //新密码
				var pw1=document.formPw.userPw1.value;//填写的原密码
				var pw2=document.formPw.userPw2.value;
				if(pw1!=loginPw){
					alert("原密码错误...");
					return false;
				}
				if(pw==""){
					alert("新密码不能为空...");
					return false;
				}
				if(pw!=pw2){
					alert("两次密码输入不一致...");
					return false;
				}
				document.formPw.submit();
			}
		</script>
      
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form method="post" action="../../updateAdminPw.do" name="formPw">
			<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				<tr bgcolor="#EEF4EA">
				    <td colspan="2" background="<%=path %>/img/wbg.gif" class='title'><span>密码修改</span></td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         登录名：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="text" value="${sessionScope.admin.userName }" name="userName" size="22" disabled/>
				        <!-- 被disabled修饰的文本框，不能传值到controller;禁止编辑  (readonly="readonly" 只读，去编辑会闪退界面 )-->
				        <input type="hidden" value="${sessionScope.admin.userName }" name="userName"/>
				        <input type="hidden" value="${sessionScope.admin.userPw }" name="loginPw"/>
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				        原密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="password" name="userPw1" size="22" />
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         新密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="password" name="userPw" size="22"/>
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         确认密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="password" name="userPw2" size="22"/>
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				        &nbsp;
				    </td>
			        <td width="75%" bgcolor="#FFFFFF">
			             <input type="button" value="修改" onclick="check();"/>
			             &nbsp;&nbsp;&nbsp;
			             <input type="reset" value="重置"/>
			        </td>
				</tr>
			</table>
			</form>
   </body>
</html>
