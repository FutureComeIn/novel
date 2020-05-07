<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="static/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="static/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="static/css/component.css" />

<script type="text/javascript" src="../../js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="../../js/jquery.cookie.js" ></script>
<script type="text/javascript" src="../../js/login.js"></script>
	<script type="text/javascript">		
	<%
		String message=(String)request.getAttribute("adminMsg");
		if(message=="false"){
	%>
			alert("昵称或密码错误");
			$.cookie("rmbuser", "false", { expires: 7 }); //登录失败不填充用户名、密码
	<%
		}
	%>
		function afterUpd(){
			<%
				String flag=(String)request.getAttribute("flag");
				if(flag=="yes"){
			%>
					alert("密码修改成功,请重新登录");
					$("input").eq(1).val(""); 
					$("#rmbuser").attr('checked',false);
			<%
				}
			%>
		}
	</script>
</head>
<body onload="afterUpd()" style="overflow:hidden">
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header" style="background-image:url('img/demo-1-bg.jpg');">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>长江文学阅读系统后台管理</h3>
						<form action="selectAdmin.do" name="f" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="userName" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入昵称">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="userPw" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<input type="checkbox" id="rmbuser" onclick="saveuserinfo()" />记住我一周<br/><br/>
							<div class="mb2">
								<a class="act-but submit" href="javascript:;" id ="alogin" style="color: #FFFFFF">登录</a>
							</div>
							<div class="mb2" style="text-align:center">
								<font color="white"><span id="nameerr">Copyright @ 长江文学 2019</span></font>
							</div>
						</form>  
					</div>
					
				</div>
			</div>
		</div>
		<script src="static/js/TweenLite.min.js"></script>
		<script src="static/js/EasePack.min.js"></script>
		<script src="static/js/rAF.js"></script>
		<script src="static/js/demo-1.js"></script>
	</body>
</html>