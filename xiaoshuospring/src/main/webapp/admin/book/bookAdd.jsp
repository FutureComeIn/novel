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
        
        <script src="../../js/jquery.min.js"></script>
		<script src="../../formChecked_js/jquery.validate.min.js"></script>
		<script src="../../formChecked_js/messages_zh.js"></script>
        <script language="javascript">
	        $().ready(function() { 	
		        $("#registForm").validate();   	   
		    });	
        </script>
	</head>
	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="../../addBook.do" name="formAdd" method="post" enctype="multipart/form-data">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;小说信息添加&nbsp;</td>
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
						        <input type="text" name="name" style="width: 300px;" required/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						               作者：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zuozhe" style="width: 300px;" required/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" id="tr1">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         下载点券：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="number" name="dianquan" id="dianquan" value="0" min="0" style="width: 300px;" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         小说介绍：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <textarea rows="10" cols="50" name="jieshao" required></textarea>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         上传附件：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="file" name="upload" id="fujian" size="50" accept=".txt" required/>
						        <font color="red">只支持txt格式</font>
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
