<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小说详情</title>
		
		<link href="../../css/layout.css" type="text/css" rel="stylesheet" />
	    <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
    
	    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
	    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script type="text/javascript">
        function book_xiazai(book_id,userId,dianquan){
        	 <c:if test="${sessionScope.user==null}">
	              alert("请先登录");
	              return;
		      </c:if>
		      <c:if test="${sessionScope.user!=null}">
		          if(confirm("您确定要下载吗？需要"+dianquan+"点券")){
		         		if(${user.dianquan }>=dianquan){   
		      			var url="../../userLoadBook.do?book_id="+book_id+"&userId="+userId+"&dianquan="+dianquan;
		         			window.location.href=url;
		  		    }else{
		  		    	alert("目前你拥有的点券是"+${user.dianquan }+"，请充值后重新下载");
		  		    }
		          }
		      </c:if>
        }
		function book_shidu(book_id){
			window.location.href="../../readBook.do?id="+book_id;  
	    }
        
    </script>
	</head>
	<body style="background-image:url('../../img/bookBg.jpg')">
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<div class="page_main_msg left">
			     <div class="left_row">
		              <div class="list pic_news">
		  	                <div class="list_bar">&nbsp;电子书详细信息</div>
						  	<div class="ctitle ctitle1">名称：${requestScope.book.name }</div>
							<div class="ctitleinfo">发布时间：${requestScope.book.fabushijian }</div>
							<div class="pbox">作者：${requestScope.book.zuozhe }</div>
							<div class="pbox">下载所需点券：${requestScope.book.dianquan }</div>
							<div class="pbox">内容简介：<c:out value="${requestScope.book.jieshao }" escapeXml="false"></c:out></div>
							<div class="pbox">
								<a style="cursor:pointer;" href="#" onclick="book_shidu(${book.id})"><img src="<%=path %>/img/shidu.jpg"/></a>
                            </div>
							<div class="pbox">
								<a style="cursor:pointer;" href="#" onclick="book_xiazai('${book.id}','${user.userId}','${book.dianquan}')"><img src="<%=path %>/img/down.jpg"/></a>
                            </div>
		              </div>
				      <div style="clear:both;"></div>
			     </div>
			</div>
			<div class="page_other_msg right">
				<jsp:include flush="true" page="/qiantai/inc/incRight.jsp"></jsp:include>
			</div>
		</div>
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
