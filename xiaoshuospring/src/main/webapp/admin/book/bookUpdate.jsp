<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script src="../../js/jquery.min.js"></script>
		<script src="../../formChecked_js/jquery.validate.min.js"></script>
		<script src="../../formChecked_js/messages_zh.js"></script>
        
        <script language="javascript">
	        function fillCatelog(){
	        	var catelog_id=$("#catelog_id2").val();
	        	$("#catelog_id").val(catelog_id);
	        }
	        
	        $().ready(function() { 	
		        $("#registForm").validate();   	   
		    });	
	        
	        function updateFujian(){
	        	if(""==document.formUpdate.upload.value){
	        		alert("请选择附件");
	        		return;
	        	}
	        	document.formUpdate.action="../../updateBookFujian.do";
	        	document.formUpdate.submit();
	        }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif' onload="fillCatelog()">
			<form action="../../updateBook.do" name="formUpdate" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${book.id }" />
				<input type="hidden" id="catelog_id2" value="${book.catelog_id }" />
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="2" background="<%=path %>/img/tbg.gif">&nbsp;小说信息修改&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         类别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <select name="catelog_id" id="catelog_id" style="width:100px">
						         	<c:forEach items="${catelogList}" var="catelog">
						         		<option value="${catelog.id }">${catelog.name }</option>
						         	</c:forEach>

						        </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						                名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="name" value="${book.name }" style="width: 300px;" required/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						               作者：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zuozhe" value="${book.zuozhe }" style="width: 300px;" required/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" id="tr1">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         下载点券：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="number" name="dianquan" id="dianquan" value="${book.dianquan }" min="0" style="width: 300px;" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         小说介绍：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <textarea rows="10" cols="50" name="jieshao" required>${book.jieshao }</textarea>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        附件：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="${book.fujian }" style="width: 300px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						     &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="file" name="upload" id="fujian" size="50" accept=".txt" />
						       	<button type="button" onclick="updateFujian()">附件更新</button>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交"  />&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
