<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>充值管理</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link> <!-- a标签样式 -->
		<script type="text/javascript" src="../../js/jquery-1.8.3.js" ></script>
		<script type="text/javascript">
			<%
				String delMsg=request.getParameter("delMsg");
				String confirmMsg=request.getParameter("confirmMsg");
				if("ok".equals(delMsg)){
			%>
				alert("删除成功...");
			<%
				}
				if("ok".equals(confirmMsg)){
			%>
				alert("确认完毕...");
			<%
				}
			%>
			
			function shenhe(id,user_id,dianquan){
				if(confirm("您确认审核吗")){
					var url="../../shenhe.do?id="+id+"&user_id="+user_id+"&dianquan="+dianquan;
	                window.location.href=url;
				}
			}
         	
         	function delRecord(id){
         		if(confirm("您确认删除该充值记录吗?")){
         			window.location.href="../../deleteChongzhi.do?id="+id;
         		}
         	}
         	function skipPage(page){
	   			var formObj=document.getElementById("searchForm");
	   			formObj.action="../../selectChongzhi.do?indexPage="+page;
	   			formObj.submit();
   		   }
           function fillZhuangTai(){
	       		var zt=$("#zt").val();
	       		if("Y"==zt){
	       			$("#rzt").attr("checked",true);
	       		}
           }
		</script>
       
	</head>
	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif' onload="fillZhuangTai()">
		<form id="searchForm" action="../../selectChongzhi.do" name="searchForm" method="post" style="margin-top:8px;text-align:center">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" >
				<tr bgcolor="#E7E7E7">
					<td height="25" colspan="7" background="<%=path %>/img/tbg.gif">点券充值管理</td>
				</tr>
				<tr style="text-align:left">
					<td colspan="7" height="25">
						<input type="text" name="user_id" value="${searchChongzhi.user_id }" placeholder="充值人编号" /> &nbsp;&nbsp;
						<input type="checkbox" name="zhuangtai" value="Y" id="rzt" />已审核 &nbsp;&nbsp;
						<input type="hidden"  value='${searchChongzhi.zhuangtai }' id="zt" />
						<input type="submit" value="搜索"/>
					</td>
				</tr>
				<tr bgcolor="#FAFAF1"> 
					<td colspan="7">&nbsp;</td>
			    </tr>
				<tr bgcolor="#FAFAF1">
				    <td width="4%">序号</td>
					<td width="16%">充值用户(编号)</td>
					<td width="16%">点券数量</td>
					<td width="16%">付款方式</td>
					<td width="16%">充值时间</td>
					<td width="16%">审核状态</td>
					<td width="16%">操作</td>
		        </tr>	
				<c:forEach items="${chongzhiList}" var="chongzhi">
				<tr bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='skyblue';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td>
						${chongzhi.id }
					</td>
					<td>
					    ${chongzhi.userName }(${chongzhi.user_id })
					</td>
					<td>
						${chongzhi.dianquan }
					</td>
					<td>
						${chongzhi.fukuanfangshi }
					</td>
					<td>
						${chongzhi.shijian }
					</td>
					<td>
						${chongzhi.zhuangtai}
					</td>
					<td bgcolor="#FAFAF1">
						 <c:if test="${chongzhi.zhuangtai=='N'}">
							<button type="button" onclick="shenhe('${chongzhi.id}','${chongzhi.user_id}','${chongzhi.dianquan}')">审核</button>&nbsp;&nbsp;
						</c:if>
						<button type="button" onclick="delRecord('${chongzhi.id}')">删除</button>
					</td>
				</tr>
				</c:forEach>
				<tr bgcolor="#FAFAF1" style="font-size:20px;">
					<td colspan="7">
					  <a href="javascript:;" onclick="skipPage(1)" style="font-size:20px;">首  页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage>1?page.indexPage-1:1}')">上一页</a>
					  &nbsp;&nbsp;
					  ${page.indexPage }/${page.pageCount }
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.indexPage<page.pageCount?page.indexPage+1:page.pageCount}')">下一页</a>
					  &nbsp;&nbsp;
					  <a href="javascript:;" style="font-size:20px;" onclick="skipPage('${page.pageCount}')">末   页</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
