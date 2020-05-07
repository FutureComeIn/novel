<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>充值界面</title>
	
	<script type="text/javascript" src="../../js/jquery.min.js"></script>
	<script type="text/javascript">
		<%
			String msg=(String)request.getAttribute("message");
			if("yes".equals(msg)){
		%>
				alert("充值提交成功");
				closeOpen();
		<%
			}
			if("no".equals(msg)){
		%>
				alert("充值提交成功");
				closeOpen();
		<%
			}
		%>
		function chongzhi(){
			/*
			^符号表示字符串的开始，^1表示字符串第一个字符为1 
			$符号表示字符串的结束
			[]符号表示字符集合，即该位置匹配[]中任意一个字符，[6-9]即该字符可以是6、7、8、9中的任意一个
			\d匹配任意一个数字，及0~9中任何一个字符
			{2}表示前面匹配的字符数为2个，\d{2}即匹配了2个数字
			|表示或的关系，任何一个表达式匹配，则整体表达式匹配
			^1[6-9]$匹配2位数，第一位为1，第二位为6~9，即匹配16~19
			^[2-9]\d$匹配2位数，第一位为2~9，第二位是任意数字，即匹配20~99
			^1\d{2}$匹配3位数，第一位为1，后两位为任意数字，即匹配100~199 */
	    	var myreg=/^[1-9]\d$|^[1-9]\d{2}|^[1-9]\d{3}$/;  //大于9小于10000
            if (!myreg.test($("#dianquan").val().trim())) { 
            	alert("充值金额范围：9-10000");
 				return;
            }
            if($("input:radio[name='fukuanfangshi']:checked").length==0){
	    		alert("请选择付款方式");
	    	}
			document.chongzhiForm.submit();
		}
		function closeOpen(){
		       window.returnValue=false;
		       window.close();
		}
	</script>
  </head>
  
  <body background="../../img/bookBg.jpg">
      <form action="../../insertChongzhi.do" name="chongzhiForm" method="post">
				<table width="98%" border="0" align="center" cellpadding="10" cellspacing="1">
					<tr>
						<th height="40" colspan="2" class="f12b-red" style="font-size:30px;">
							我 的 充 值
						</th>
					</tr>
					<tr style="font-size:20px;">
						<td width="38%" height="30" align="right">
							用户名：
						</td>
						<td width="62%">
							&nbsp;<input type="text" size="30" name="loginname" id="loginname" value="${sessionScope.user.loginname}" readonly="readonly" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							充值金额(1元=10点券)：
						</td>
						<td>
							&nbsp;<input type="text" size="30" name="dianquan" id="dianquan" />
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td height="30" align="right">
							付款方式：
						</td>
						<td>
							&nbsp;<input type="radio" name="fukuanfangshi" value="支付宝" />支付宝(yuewen@book.cn 户名:周润发)
							<br/>
							&nbsp;<input type="radio" name="fukuanfangshi" value="建设银行" />建设银行(6052 0063 8210 2131 423)
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td colspan="2" align="center">
							转账请备注：用户名--充值金额
						</td>
					</tr>
					<tr style="font-size:20px;">
						<td colspan="2" align="center">
							<input type="hidden" name="user_id" value="${sessionScope.user.userId}"/>
							<input type="button" value="充值" onclick="chongzhi();"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
						</td>
					</tr>
			  </table>
	     </form>
  </body>
</html>
