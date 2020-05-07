 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
function register(){
	 window.location.href="../../qiantai/userinfo/register.jsp";
 }
 function myInfo(){
 	<c:if test="${sessionScope.user==null}">
          alert("请先登录");
          return;
    </c:if>
 	var url="../../qiantai/userinfo/userXinxi.jsp";
 	var top=(height-600)/2;
 	var left=(width-560)/2;
 	window.open(url,"我的信息","height=600,width=560,top="+top+",left="+left+",resizable=no,location=no,status=no");
 }
 function chongzhi(){
 	<c:if test="${sessionScope.user==null}">
          alert("请先登录");
          return;
    </c:if>
 	var url="../../qiantai/book/chongzhi.jsp";
 	var top=(height-400)/2;
 	var left=(width-700)/2;
 	window.open(url,"我的充值","height=400,width=700,top="+top+",left="+left+",resizable=no,location=no,status=no");
 }
 function liuyan(){
 	<c:if test="${sessionScope.user==null}">
          alert("请先登录");
          return;
    </c:if>
 	window.location.href="../../selectLiuyan_qt.do";
 }