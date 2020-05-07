<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>长江文学网</title>
		<link href="../css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="../js/public.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			function skipPage(page,catelog_id){
				var formObj=document.getElementById("searchForm");
				formObj.action="../showBooks.do?indexPage="+page+"&catelog_id="+catelog_id;
				formObj.submit();
			}
			function bookDetail(id){
				window.location.href="../../showBookById.do?id="+id;
			}
		</script>
	</head>
	<body style="background-image:url('../img/bookBg.jpg')">
		<!-- 顶部菜单导航栏 -->
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		
		<!-- 电子书信息 --> 
		<div class="page_row">
			<div class="page_main_msg left">
			     <div class="left_row">
		              <div class="list pic_news">
				          <div class="list_bar">电子书信息</div>
				          <div class="list_content">
				          
				          <!-- 书籍信息 --> 
                              <div class="c1-body"  style="height: 400px;">
                              	<c:forEach items="${bookList}" var="book">
                                 <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left">
                                            <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
                                            <a href="#" title="" onclick="bookDetail('${book.id}')"><span style="">${book.name }</span></a>
                                       </div>
                                       <div class="f-right">${book.fabushijian }</div>
                                       <div class="clear"></div>
                                  </div>
                                  
                                  </c:forEach>

								  <div class="pg-3" style="font-size:20px;">
									  <a href="javascript:;" onclick="skipPage(1,'${searchBook.catelog_id }')" style="font-size:20px;">首  页</a>
									  &nbsp;&nbsp;
									  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}','${searchBook.catelog_id }')">上一页</a>
									  &nbsp;&nbsp;
									  ${page.indexPage }/${page.pageCount }
									  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}','${searchBook.catelog_id }')">下一页</a>
									  &nbsp;&nbsp;
									  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}','${searchBook.catelog_id }')">末   页</a>
								  </div>		  
						      </div>
						  </div>
					  </div>	
				   
			     </div>
			</div>
			<div class="page_other_msg right" id="right">
				<jsp:include flush="true" page="/qiantai/inc/incRight.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
