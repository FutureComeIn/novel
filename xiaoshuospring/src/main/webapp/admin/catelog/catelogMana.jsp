<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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
        <script language="javascript">
           function delCatelog(id){
           		if(confirm("您确认删除吗,同时将删除该类别下的所有小说?")){
           			window.location.href="../../deleteCatelog.do?id="+id;
           		}
           }
           function updateCatelog(id){ 
          		window.location.href="../../showCatelogName.do?id="+id;
          }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='../../img/allbg.gif'>
			<table width="98%" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px;text-align:center">
				<tr bgcolor="#E7E7E7" style="background-image:url('../../img/tbg.gif')">
					<td height="20" colspan="3" >电子书类别管理</td>
				</tr>
				<tr bgcolor="#FAFAF1"> 
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr bgcolor="#FAFAF1">
					<td width="5%">序号</td>
					<td>名称</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${catelogList}" var="catelog">
				<tr bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='skyblue';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td >
						${catelog.id }
					</td>
					<td>
						${catelog.name }
					</td>
					<td>
						<input type="button" value="删除" onclick="delCatelog(${catelog.id})"/>&nbsp;
						<input type="button" value="修改" onclick="updateCatelog(${catelog.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
