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
    <title>My JSP 'main.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#4AA3D8"></td>
  </tr>	
  <tr>
    <td><table width="768" height="500" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><img src="${path }/admin/images/welcome.gif"   width="768" height="536" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
