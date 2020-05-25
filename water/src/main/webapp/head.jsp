	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
		<style> 
a{ text-decoration:none;} 
</style> 
</head>
<body>
<div  style="margin-bottom:50px;height:50px;line-height:50px;width: 100%;background-color:#f6f6f6" >
			<div style="float: left;position: relative;left: 180px;">
				<a href="${path}/index.jsp">首页</a>
			</div>
			<div  style="float:right;position: relative;right: 60px;">
			
			<c:if test="${u==null}">
				<a  href="${path }/login.jsp">登入</a>|<a  href="${path }/Register.jsp">注册</a>
			</c:if>
			
			<c:if test="${u!=null}">
				欢 迎 您 ！[${u.u_username}]&nbsp;|&nbsp;<a  href="${path }/goods/findAllc?u_id=${u.u_id}">我的购物车</a>&nbsp;|&nbsp;<a href="#" onclick="myOrder()">我的订单</a>&nbsp;|&nbsp;<a  href="${path }/login.jsp">切换账号</a>&nbsp;|&nbsp;<a  href="${path }/Register.jsp">注册</a>&nbsp;|&nbsp;<a id="et" href="${path}/user/exit?uid=${u.u_id}">退出</a>
			</c:if>

			</div>
		</div>
		<form id="mdForm" action="${path}/order/findAllByUser" method="post">
			<input type="hidden" id="u" name="u_id"/>
		</form>
		<form id="et" action="${path}/user/exit" method="post">
		<input type="hidden" name = "" id=""/>
		</form>
		<script type="text/javascript">
			
			function myOrder(){
				$('#u').val('${u.u_id}');
				$('#mdForm').submit();
			}
			$(function(){
				$('#et').click(function(){
					
				});
			})
		</script>
</body>
</html>