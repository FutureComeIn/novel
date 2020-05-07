<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>我的信息</title>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<script language="javascript">
				window.onload=show;
				function show(){
					 //处理性别按钮的选中
			    	var sex="${user.sex}";
			    	var man=document.getElementById("man");
			    	var woman=document.getElementById("woman");
			    	if(man.value==sex){
			    		man.checked="checked";
			    	}
			    	if(woman.value==sex){
			    		woman.checked="checked";
			    	}
				}
			    function update(){
			    	if(confirm("您确认修改您的信息吗?")){
			    		var pw1=document.form1.pw1.value;
				    	if(""==pw1.trim()){
				    		alert("请填写您的原密码!");
				    		return;
				    	}
				    	if("${user.loginpw}"!=pw1.trim()){  //在js里面用$要用 双引号 括起来
				    		alert("原密码填写错误...");
				    		return;
				    	}
				    	if($("#loginname").val().trim()==""){
			 				alert("用户名不为空");
			 				return false;
			 			}
				    	if($("#age").val().trim()==""){
			 				alert("年龄不能为空");
			 				return;
			 			}
				    	//var myreg=/^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/; 密码为6到20位,同时包含数字和字母
				    	var myreg=/^[a-zA-Z]\w{5,17}$/;
			            if (!myreg.test($("#loginpw").val().trim())) { 
			            	alert("密码以字母开头,6-18位,只包含字符、数字和下划线");
			 				return;
			            } 
			            var myreg1=/^[1][3,4,5,7,8][0-9]{9}$/;
			            if (!myreg1.test($("#tel").val().trim())) { 
			            	alert("错误的联系方式");
			 				return;
			            } 
			            var myreg2=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
			            if (!myreg2.test($("#email").val().trim())) {
			            	alert("错误的邮箱");
			 				return;
			            } 
			            if($("#loginname").val()!="${user.loginname}"){
			            	$.ajax({
			    	    		url:"http://localhost:8080/checkLoginName.do",
			    	    		type:"post",
			    	    		data:{
			    	    			"loginname":$("#loginname").val()
			    	    		},
			    	    		dataType:"json",
			    	    		success:function(data){
			    	    			if(data.isResult==false){
			    	    				alert(data.singerData);
			    	    			}else{
			    	    				document.form1.submit(); 
			    	    			}
			    	    		},
			    	    		error:function(){
			    	    		}
			    	    	})
			            }else{
			            	document.form1.submit(); 
			            }
						/*
						var bt=document.getElementById("bt");
						bt.disabled=false; */
			    	}
			   }
			   function closeOpen(){
			       window.returnValue=false;
			       window.close();
			   }
        </script>
	</head>
	<body background="../../img/bookBg.jpg">
			<form action="../../updateUser.do" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="10" cellspacing="1">
					<tr>
						<th height="40" colspan="2" class="f12b-red" style="font-size:30px;">
							用 户 信 息
						</th>
					</tr>
					<tr style="font-size:20px;">
						<td width="40%" height="30" align="right">
							用户名：
						</td>
						<td width="60%">
							&nbsp;<input type="text" size="30" name="loginname" id="loginname" value="${sessionScope.user.loginname}" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							密 码：
						</td>
						<td>
							&nbsp;<input type="password" id="loginpw" size="30" name="loginpw" value="${sessionScope.user.loginpw}" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right" >
							性别：
						</td>
						<td>
							&nbsp;<input type="radio" name="sex" value="男" id="man"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" id="woman"/>女
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							年龄：
						</td>
						<td>
						    &nbsp;<input type="text" id="age" size="30" name="age" value="${sessionScope.user.age}" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							联系方式：
						</td>
						<td>
							&nbsp;<input type="text" id="tel" size="30" name="tel" value="${sessionScope.user.tel}" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							E-mail：
						</td>
						<td>
							&nbsp;<input type="text" id="email" size="30" name="email" value="${sessionScope.user.email}" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							点券：
						</td>
						<td>
							&nbsp;<input type="text" size="30" name="dianquan" value="${sessionScope.user.dianquan}" readonly="readonly"/>
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							原 密 码：
						</td>
						<td>
							<input type="password" size="30" name="pw1"/>
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td colspan="2" align="center">
							<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
							<input type="button" value="修改" onclick="update();"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
