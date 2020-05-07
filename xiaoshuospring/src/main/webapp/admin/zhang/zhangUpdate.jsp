<%@ page language="java" pageEncoding="UTF-8"%>


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
        <script type="text/javascript" src="../../fckeditor/fckeditor.js"></script>
        <script type="text/javascript" src="../../js/jquery.min.js"></script>
        
        <script language="javascript">
        	$(function(){
        		var fck=new FCKeditor("neirong");
        		fck.BasePath="../../fckeditor/";
        		fck.Width  = 1000;
        		fck.Height = 480;
        		fck.ToolbarSet = "Default"; //Basic(文本编辑操作更少)
        		fck.ReplaceTextarea();
        	})
        	function check(){
        		var fck=FCKeditorAPI.GetInstance("neirong");  //fck：替换和取值是不同的方面
        		//alert(fck.GetXHTML(true)); 取得值带html标签
        		//alert(fck.EditorDocument.body.innerText);
        		var neirong=fck.EditorDocument.body.innerText;
        		if(""==$("#mingcheng").val().trim()){
        			alert("名称不能为空");
        			$("#mingcheng").focus();
        			return;
        		}
        		if(neirong.trim().length<20){
        			alert("内容不能少于20个字符");
        			$("textarea").focus();
        			return;
        		}
        		document.formUpdate.submit(); 
        	}
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="../../updateZhangjie.do" name="formUpdate" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="2" background="<%=path %>/img/tbg.gif">&nbsp;章节信息修改&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         小说名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="${zhangjie.bookName }" size="80" disabled/>
						        <input type="hidden" name="book_id" value="${zhangjie.book_id }"/>
						        <input type="hidden" name="id" value="${zhangjie.id }"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         章节名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="${zhangjie.mingcheng }" name="mingcheng" id="mingcheng" size="80"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         章节内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
                                <textarea name="neirong"> ${zhangjie.neirong } </textarea> 
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交"  onclick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
