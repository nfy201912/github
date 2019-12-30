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
<title>修改管理员信息</title>
<link rel="stylesheet" rev="stylesheet" href="${path }/admin/css/style.css" type="text/css" media="all" />
</head>
<body class="ContentBody">
<form action="${path }/servlet/admin/AdminServlet" method="post" target="mainFrame" name="fom" id="fom" >
<input type="hidden" name="mark" value="updateAdmin">
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
				<legend>修改管理员信息</legend>
				    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%">账号:</td>
					    <td width="41%"><input name="adminame" class="text"  type="text" size="40" /></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">密码:</td>
					    <td width="41%"><input name="adminpwd" class="text"  type="password" size="40" /></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">状态:</td>
					    <td width="41%">
					     	锁定：<input name="status" class="text" value="0" checked type="radio"  />
					                     未锁定：<input name="status" class="text"  value="1"   type="radio"  />
					    </td>
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">备注:</td>
					    <td colspan="3"><textarea id="textarea" name="remark" rows="5" cols="80"></textarea>
					    </td>
					    </tr>
					    <tr>
					    <td  align="center" colspan="2" >
					      <font color="red"></font>
					    </td>
					    </tr>
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
			<input type="submit" name="Submit" value="保存" class="button"/>　
			<input type="reset" name="Submit2" value="取消" class="button"/>
		   </TD>
		</TR>
	</TABLE>
    </div>
  </form>
 </body>
</html>
