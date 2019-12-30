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
    <title>My JSP 'top.jsp' starting page</title>
	<link href="${path }/admin/css/css.css" rel="stylesheet" type="text/css" />
  </head>
 <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="59" background="${path }/admin/images/top.gif"><table width="99%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1%">
			<a href="#" target="_blank">
				<img src="${path }/img/adlogo.jpg" width="557" height="59" border="0" />
			</a>
		</td>
      </tr>
    </table>
   </td>
  </tr>
</table>
</body>
</html>
