$(function(){
	$("#alogin").click(function(){
		var $input=$("input");
		if($input.eq(0).val()==""||$input.eq(0).val()==null){
			alert("请输入用户名");
			$input.eq(0).focus();  //聚焦光标
			return;
		}
		if($input.eq(1).val()==""||$input.eq(1).val()==null){
			alert("请输入密码");
			$input.eq(1).focus();  //聚焦光标
			return;
		}
		document.f.submit();
	});
	
	
	if ($.cookie("rmbuser") == "true") { 
		//$("#rmbuser").attr("checked", true); 
		$("input").eq(0).val($.cookie("username")); 
		$("input").eq(1).val($.cookie("password")); 
		$("#rmbuser").attr('checked','true');
	} 

});

//保存用户信息 
function saveuserinfo() { 
	if($("#rmbuser").attr('checked')=='checked'){
		var username = $("input").eq(0).val(); 
		var password = $("input").eq(1).val(); 
		$.cookie("rmbuser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie 
		$.cookie("username", username, { expires: 7 }); // 存储一个带7天期限的 cookie 
		$.cookie("password", password, { expires: 7 }); // 存储一个带7天期限的 cookie 
	}else{
		$.cookie("rmbuser","false",{ expires: -1 }); 
		$.cookie("username",'',{ expires: -1 }); 
		$.cookie("password",'',{ expires: -1 }); 
	}
}

