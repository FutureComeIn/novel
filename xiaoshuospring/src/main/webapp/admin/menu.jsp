<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>菜单栏</title>
	
	<!-- <link rel="stylesheet" href="/css/base.css" type="text/css" /> -->
	<style type="text/css">
		body {
		 scrollbar-base-color:#bae87c;
		 scrollbar-arrow-color:#FFFFFF;
		 scrollbar-shadow-color:#c1ea8b;
		 padding:0px;
		 margin:auto;
		 text-align:center;
		 background-color:skyblue;
		}
		dl.bitem {
			width:152px;
			margin:0px 10px 5px 4px;
		}
		dl.bitem dt {
		  font-size:16px;
		  background:url(<%=path %>/img/menubg.gif);
		  height:26px;
		  line-height:26px;
		  text-align:center;
		  cursor:pointer;
		}
		dl.bitem dd {
		  padding:2px 0px 3px 3px;
		  background-color:#fff;
		}
		.sitemu li {
			padding:0px 0px 0px 0px;
			line-height:20px;
		}
		li,dd {margin:0px; padding:0px; }
		a:link { font-size: 12pt; color: #000000; text-decoration: none; font-family: "微软雅黑"; }
		a:visited{ font-size: 12pt; color: #000000; text-decoration: none; font-family: "微软雅黑"; }
		a:hover {color: red; font-family: "微软雅黑";}
	</style>
	<script language='javascript'>
		var curopenItem = '1';
	</script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/menu.js"></script>
	<base target="main" />
  </head>
  
  <body target="main">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	    
	      <dl class='bitem'>
	        <dt onclick='showHide("items1_1")'><b>修改个人密码</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/userinfo/userPw.jsp' target='main'>修改个人密码</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>会员信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
	            <li><a href='../../selectUser.do' target='main'>会员信息管理</a> </li>
	            <li><a href='../../selectChongzhi.do' target='main'>点券充值管理</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      
	      <dl class='bitem'>
	        <dt onClick='showHide("items3_1")'><b>类别信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items3_1'>
	          <ul class='sitemu'>
	            <li><a href='../../showCatelog.do' target='main'>类别信息管理</a> </li>
	            <li><a href='../../admin/catelog/catelogAdd.jsp' target='main'>类别信息添加</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      
	      <dl class='bitem'>
	        <dt onClick='showHide("items4_1")'><b>小说信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items4_1'>
	          <ul class='sitemu'>
	            <li><a href='../showBooks_ht.do' target='main'>小说信息管理</a> </li>
	            <li><a href='../showCatelogs.do' target='main'>小说信息添加</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      
	      <dl class='bitem'>
	        <dt onClick='showHide("items5_1")'><b>留言公告管理</b></dt>
	        <dd style='display:block' class='sitem' id='items5_1'>
	          <ul class='sitemu'>
	            <li><a href='../../showGonggao_ht.do' target='main'>公告信息管理</a> </li>
	            <li><a href='../../selectLiuyan.do' target='main'>留言信息管理</a> </li>
	          </ul>
	        </dd>
	      </dl>

		</td>
	  </tr>
	</table>
  </body>
</html>
