<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
		<link rel="stylesheet" type="text/css" href="${path }/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${path }/css/mybootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${path }/css/Login.css" />
		
		<script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/my.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/jquery.singlePageNav.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/wow.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
	
</style>
</head>

<body>

		<div id="register" class="container">
		<div class="row" style="margin: -40px">
			<div class="col-md-12 col-sm-12 col-xs-12" align="center">
		<form method="post">
			<table>
			<h1>用户注册</h1>
			<br />
							
						<tbody>
							<tr height="36">
									<th>账 号：</th>
										<td>
										<input type="text" id="u_username" name="u_username" value=""/></td><td><span id="sp_username"></span></td>
										
								</tr>
									<tr height="36">
									<th>密 码：</th>
									<td>
									<input type="password" name="u_password" id="u_password"/>
									</td>
									</tr>
									 <tr height="36">
									<th>确认密 码：</th>
									<td>
									<input type="password" name="u_password2" id="u_password2"/></td><td><span id="sp_password"></span>
									</td>
									</tr>  
									 <tr height="36">
										 <th>姓 名：</th>
										 <td>
											 <input type="text" name="u_name"/>
											 </td>
											 
											 </tr>
								<tr height="36">
									<th>邮 箱：</th>
									<td>
										<input type="text" name="u_email" id="u_email"/></td><td><span id="sp_email"></span>
										</td>
										</tr>	
									<tr height="36">
										<th>电 话：</th>
										<td>
											<input type="text" name="u_phone" id="u_phone"/></td><td><span id="sp_phone"></span>
											</td>
											</tr>
								 <tr height="36">
										<th>
											验证码：
										</th>
										<td>
												<input type="text" name="validateCode"  id="validateCode" class="text" >
											</td>
												<td><img id="code" src="${path }/user/doValidateCode" alt="验证码图片"></td>
												<span class="redFont">&nbsp;&nbsp;&nbsp;&nbsp;${validateCodeMessage }</span>
										
									</tr> 
								
								
								</tbody>		
								
							<tr height="70">
									<td></td><td align="center"><input type="button"  value="注 册" style="width: 180px;height: 36px;line-height: 34px" onclick="commit(this,false)" /></td>
								</tr>
								<tr height="30">
									<td></td><td align="center"><input type="button"  value="退 出" style="width: 180px;height: 36px;line-height: 34px;margin-top: -20px"  onclick="exit()" /></td>
								</tr>
								
				</table>
				
				</form></div>
		</div>
		
				
		</div>
		
		<script type="text/javascript">
	$(function(){
		
		$("#u_username").blur(function(){
			//参一：url地址
			//{username:$(this).val(),mark:"checkName"}   
			// username:$(this).val()：自定义一个变量，变量名为：username  变量值：$(this).val() :获取当前文本框中的内容
			//mark:"checkName"    mark是一个变量名     "checkName":是mark的值   类似于  String mark="checkName";
			//function(data)：回调函数
			if($("#u_username").val()==""){
				$("#sp_username").html("账号不能为空").css("color","#ff0000");
			}else{
				$.post("${path}/user/checkName",{"u_username":$("#u_username").val()},function(data){
					if("success"!=data){
						data ="用户已存在";
					}else{
						data="";
					}
					
					$("#sp_username").html(data).css("color","#ff0000");
				});
			}
			
		}); 
		//确认密码
		$("#u_password2").blur(function(){
			if($(this).val()!=$("#u_password").val()){
				var data = "密码不一致";
				
			}else{
				var data="";
			}
			$("#sp_password").html(data).css("color","#ff0000");
		});
		//邮箱格式验证
		$("#u_email").blur(function(){
			var mailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			if($.isEmptyObject($(this).val())){
				data="邮箱不能为空";
			}
			else if (mailReg.test($(this).val())){
				var data = "";
			}else{
				var data = "邮箱格式错误";
			}
			$("#sp_email").html(data).css("color","#ff0000");
		})
		//电话号码验证
		$("#u_phone").blur(function(){
			
			var phoneReg=/^1[3,4,5,8][0-9]{9}$/;
			if($.isEmptyObject($(this).val())){
				var data = "请输入电话号码";
			}else if(phoneReg.test($(this).val())){
				var data = "";
			}else{
				var data="电话有误";
			}
			
			
			$("#sp_phone").html(data).css("color","#ff0000");
		}) 
		
		//点击更改另一张验证码
		$("#code").on("click",function(){
			
			$(this).attr("src","${path }/user/doValidateCode?a=" + new Date().getTime()); //可以拼接当前时间  让每次请求的网址都不一样
		});
		
	});
	 
	
	function commit(object,flag){
		var regu = "^[ ]+$";//空格
		var re = new RegExp(regu);
		$('input[type="text"]').each(function(i,v){
			if($(this).val()==null||$(this).val()==""||re.test($(this).val())){
			$(this).siblings().html("不能为空").css("color","#ff0000");
			alert($(this).siblings().val())
			}
		});
		if(flag){
			$('form').location.href="${path }/user/register";
		}
		
		
	}	
 function exit(){
	 location.href="${path}/index.jsp";
 }
</script>
	</body>
</html>
