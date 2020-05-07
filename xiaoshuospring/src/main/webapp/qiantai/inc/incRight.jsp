<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function showContent(title,sendtime,content){
			var width=document.documentElement.clientWidth;
	     	var height=document.documentElement.clientHeight; //屏幕可见区域宽、高
			var top=(height-500)/2;
         	var left=(width-600)/2;
         	var url="../../qiantai/gonggao/gonggaoDetail.jsp?title="+title+"&sendtime="+sendtime+"&content="+content;
         	window.open(url,"公告详情","height=500,width=600,top="+top+",left="+left+",resizable=no,location=no,status=no");
		}
		function more(){
			window.location.href="../../showGonggao.do";
		}
		function show1(){
        	var now=new Date();
        	var year=now.getFullYear();
        	var month=now.getMonth()+1;
         	document.getElementById("year_month").innerHTML=year+"年"+month+"月";  //在rili.jsp

         	
         	//window.setTimeout(show1,500);  //应该让网页装载完毕，才能得到div的id
         	<c:if test="${sessionScope.user!=null}">
			var obj1=document.getElementById("loginDiv");
			//alert(obj1);
			obj1.style.display="none";
			var obj2=document.getElementById("loginSuccessDiv");
			//alert(obj2);
			obj2.style.display="block";
  	   </c:if>
         	
        }
	</script>
  </head>
  
  <body onload="show1()">
     	<div class="left_row">
		    <div class="list">
		        <div class="list_bar">用户登录</div>
		        <div class="list_content">
		            <div id="div"> 
						<jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include> 
			        </div>
			    </div>
		    </div>
		</div>
        <div class="left_row">
		    <div class="list">
		        <div class="list_bar">网站公告</div>
		        <div class="list_content">
		            <div id="div"> 
						<table width="100%" cellpadding="5" cellspacing="5">
							<c:forEach items="${gonggaoList }" var="gonggao">
						    <tr>
						    	<td align="left">
						    		<a href="javascript:;" onclick="showContent('${gonggao.title }','${gonggao.sendtime }','${gonggao.content }')"> 
						    			---${gonggao.title }---${gonggao.sendtime } 
						    		</a> 
						    	</td>
						    </tr>
						    </c:forEach>
						    <tr>
						    	<td align="left"><a href="#" onclick="more()">...更多</a> </td>
						    </tr>
					   </table> 
			        </div>
			    </div>
		    </div>
		</div>
		
		<div class="left_row" style="height:150px;">
		    <div class="list">
		        <div class="list_bar">系统日历</div>
		        <div class="list_content">
		            <div id="div"> 
						<jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include> 
			        </div>
			    </div>
		    </div>
		</div>
  </body>
</html>
