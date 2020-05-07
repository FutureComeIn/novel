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
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	    <script type="text/javascript">
	        
	    </script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<div class="page_main_msg left">
			     <div class="left_row">
		              <div class="list pic_news">
				          <div class="list_bar">电子书信息</div>
				          <div class="list_content">
                              <div class="c1-body"  style="height: 400px;">
                                  <c:forEach items="${requestScope.bookList}" var="book">
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left">
                                            <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
                                            <a href="<%=path %>/book?type=bookDetailQian&id=${book.id}" title=""><span style="">${book.name}</span></a>
                                       </div>
                                       <div class="f-right">${book.fabushijian}</div>
                                       <div class="clear"></div>
                                  </div>
                                  </c:forEach>
								  <div class="pg-3">
									   <!--  分页-->
								  </div>		  
						      </div>
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
