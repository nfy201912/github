<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${path }/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${path }/css/mybootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${path }/css/animate.css"/>
		<script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/my.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/jquery.singlePageNav.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/wow.min.js" type="text/javascript" charset="utf-8"></script>
			
</head>

<body>
<script type="text/javascript">
		$(function(){
			if($("#autoLogin").prop("checked")){
				$("#rembPwd").prop("checked",true);
				setTimeout(function () {
				    
					$("#loginForm").submit();//自动登入
				}, 1000);
				
			}
			$("#autoLogin").click(function(){//判断自动登入复选框
				if($(this).prop("checked")){
					$("#rembPwd").prop("checked",true);
				}
			});
			$("#rembPwd").click(function(){//记住密码
			if(!$(this).prop("checked"))
				$("#autoLogin").prop("checked",false);
			});
		})
		
	</script>
		<div class="container">
					
							<div class="row" align="center"> 
								<div class="col-lg-12 col-md-12 col-sm-12">
									<form id="loginForm" action="${path }/user/userLogin" method="post">
										<table >
										<thead><h1>用户登入</h1></thead><br/>
										<tbody>
										<tr>
											<th>账 号：</th><td><input type="text" name="u_username" value="${cookie.username.value }"/></td>
										
										</tr>
											<th>密 码：</th><td><input type="password" name="u_password" id="u_password" value="${cookie.password.value }" /></td>
											
										<tr>
										<td><input type="checkbox" id="autoLogin" name="autoLogin" ${empty cookie.autoLogin ? "": "checked"} ><span>自动登入</span></td>
										<td><input type="checkbox" id="rembPwd"  name="rembPwd" ${empty cookie.rembPwd ? "": "checked"}><span>记住密码</span></td>
										
										 </tr>
										
										</tbody>
										
										</table>
											<tr><input type="submit" value="登入" /></tr>
									</form>
									
								</div>
							
							</div>
						
										
				
							
						</div>
	</body>
</html>
