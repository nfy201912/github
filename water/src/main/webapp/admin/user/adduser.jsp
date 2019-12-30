<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引标准标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 使用jstl标签 -->
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>添加管理员</title>
<link rel="stylesheet" rev="stylesheet" href="${path }/admin/css/style.css" type="text/css" media="all" />
<script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#adm").blur(function(){
		if($(this).val()!=""){
		
			$.post("${path}/admin/checkName",{adm_name:$(this).val()},function(data){
				
				if(!data){
					data ="用户已存在";
				}else{
					data="";
				}
				
				$("#sp_adname").html(data).css("color","#ff0000");
			});
		}else{
			data="";
			$("#sp_adname").html(data).css("color","#ff0000");
		}
		
	});
	 
	

	
	
});
function refreshParent() {
	window.open('/admin/index.jsp');
	//window.parent.frames[ "leftFrame"].location.reload();
	window.close();
	 }  



</script>

<body class="ContentBody">
<form action="${path }/admin/add" method="post" target="mainFrame" name="fom" id="fom" >
<input type="hidden" name="mark" value="addAdmin">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加管理员</legend>
				    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%">账号:</td>
					    <td width="41%"><input id="adm" name="adm_name" class="text"  type="text" size="40" /> <span id="sp_adname"></span></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">密码:</td>
					    <td width="41%"><input name="adm_password" class="text"  type="password" size="40" /></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">状态:</td>
					    <td width="41%">
					     	锁定：<input name="adm_status" class="text" value="0" checked type="radio"  />
					                     未锁定：<input name="adm_status" class="text"  value="1"   type="radio"  />
					    </td>
					  </tr>
					  <!-- <tr>
					    <td nowrap align="right" height="120px">备注:</td>
					    <td colspan="3"><textarea id="textarea" name="remark" rows="5" cols="80"></textarea>
					    </td>
					    </tr>
					    <tr>
					    <td  align="center" colspan="2" >
					      <font color="red"></font>
					    </td>
					    </tr> -->
					  </table>
			 <br />
				</fieldset>			
			</TD>
		</TR>
		</TABLE>
	 </td>
     </tr>
		<TR>
		   <TD colspan="2" align="center" height="50px">
			<input type="submit" name="Submit" onclick="window.close()" value="保存" class="button"/>　
			<input type="reset" name="Submit2" value="重置" class="button"/>
			<input type="button" id="btn1" class="btn" value="关闭" class="button" onclick="refreshParent()" />
		   </TD>
		</TR>
	</TABLE>
    </div>
  </form>
 </body>
 
 
</html>
