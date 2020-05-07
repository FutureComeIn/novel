<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
     <link rel="stylesheet" type="text/css" href="../../css/amazeui.css" />
     <link rel="stylesheet" type="text/css" href="../../css/user.css" />   
     <script type="text/javascript" src="../../js/jquery.min.js"></script>
    
    <script type="text/javascript">
    $(function(){
	 	$("#change").click(function(){
	 		var date=new Date();
	 		$("#img").attr("src","../../showYzm.do?date="+date.getTime());
	 	})
	 	//同步实现验证用户名是否已被注册
	 	$("#loginname").blur(function(){
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
	    			}
	    		},
	    		error:function(){
	    		}
	    	})
	    })
	 	//同步实现验证码是否正确
	 	$("#yzm").blur(function(){
	 		$.ajax({
	    		url:"http://localhost:8080/checkYzm.do",
	    		type:"post",
	    		data:{
	    			"yzm":$("#yzm").val()
	    		},
	    		dataType:"json",
	    		success:function(data){
	    			if(data.isResult==false){
	    				alert(data.singerData);
	    			}
	    		},
	    		error:function(){
	    		}
	    	})
	    })
	 	$(".submit:first").click(function(){
	 		$input=$("input");
	 		if($("#loginname").val().trim()==""){
 				alert("用户名不为空");
 				return false;
 			}
	 		if($("#loginpw").val().trim()!=$("#loginpw2").val().trim()){
 				alert("密码输入不一致");
 				return false;
 			}
	 		for(var i=0;i<$input.size()-2;i++){
	 			if(i==1){
	 				//var myreg=/^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/; 密码为6到20位,同时包含数字和字母
			    	var myreg=/^[a-zA-Z]\w{5,17}$/;
		            if (!myreg.test($("#loginpw").val().trim())) { 
		            	alert("密码以字母开头,6-18位,只包含字符、数字和下划线");
		 				return;
		            }
    	 		}
	 			if($("input:radio[name='sex']:checked").length==0) {
		 		    alert('请选择性别');
		 		    return false;
		 		}
	 			if($("#age").val().trim()==""){
	 				alert("出生日期不为空");
	 				return false;
	 			}
    	 		if(i==6){
    	 			var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
    	            if (!myreg.test($input.eq(i).val().trim())) { 
    	            	alert("错误的联系方式");
    	 				return;
    	            } 
    	 		}
    	 		if(i==7){
    	 			var myreg=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    	            if (!myreg.test($input.eq(i).val().trim())) {
    	            	alert("错误的邮箱");
    	 				return;
    	            } 
    	 		}
    	 	}
	 		if($("#yzm").val().trim()==""){
            	alert('请填写验证码');
	 		    return;
            }
    	 	document.form1.submit();
	 	})
	 })
    </script>
</head>
<body style="background-image:url('../../img/bookBg.jpg');font-size:20px;">
<div id="log_register">
	<div style="margin-top:30px;margin-left:600px; width:500px;background-color:#fff;padding:20px;">
		<div class="tag">
			<ul>
				<li><a class="cur" href="javascript:;">用 户 注 册</a></li>
			</ul>
		</div>
		<form action="../../addUser.do" name="form1" method="post" id="registForm">
			<table class="table_list">
				<tbody>
					<tr>
						<td height="20" align="right"> 
							<a href="../../exitAdmin.do" style="text-decoration:none;color:blue">回 到 首 页</a>
						</td>
					</tr>
					<tr>
						<td height="20"><input class="text" id="loginname" name="loginname" type="text" placeholder="用户名" /></td>
					</tr>
					<tr>
						<td height="10"><input class="text" id="loginpw" name="loginpw" type="password" placeholder="您的密码" /></td>
					</tr>
					<tr>
						<td height="20"><input class="text" id="loginpw2" name="password" type="password" placeholder="确认密码" /></td>
					</tr>
					<tr>
						<td>
						         性别:&nbsp;&nbsp;&nbsp;
						         <input type="radio" name="sex" value="男"/>男&nbsp;&nbsp;
						         <input type="radio" name="sex" value="女"/>女
						</td>
					</tr>
					<tr>
						<td height="10">出生日期:
							<input style="width:75%;" class="text" name="age1" type="date" id="age" /></td>
					</tr>
					<tr>
						<td height="20"><input class="text" id="tel" name="tel" type="text" placeholder="联系方式" /></td>
					</tr>
					<tr>
						<td height="20"><input class="text" id="email" name="email" type="text" placeholder="E-mail" /></td>
					</tr>
					
					<!-- 添加图形验证码 -->
					<tr>
						<td >
						    <input style="width:45%;height:40px;" class="text" type="text" placeholder="验证码" id="yzm" name="yzm"/>&nbsp;&nbsp;
							<img id="img" src="../../showYzm.do" style="height:30px;" /> &nbsp;
							<a style="color:red;cursor: pointer;" id="change" href="javascript:;" >换一张</a>
						</td>
					</tr>
					<tr>
						<td> 
							<input class="submit" type="button" value="注册" />&nbsp;
							<input class="submit" type="reset" value="重置" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

</body>
</html>