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
		<script type="text/javascript" src="${path }/js/jquery-easyui-1.8.8/plugins/jquery.form.js"></script>
		<style type="text/css">
	
</style>
</head>

<body>

		<div id="register" >
		
			
		<form id="regform" action="${path }/user/register" method="post">
			<table align="center" style="background-color: gray;width: 400px;height: 500px">
			
			<br />
							
						<tbody>
						
						<tr><td></td><td><h2 >用 户 注  册</h2></td></tr>
							<tr height="36">
									<th style="text-align: right;">账 号：</th>
										<td>
										<input type="text" id="u_username" name="u_username"  /></td><td><span id="sp_username"></span></td>
										
								</tr>
									<tr height="36">
									<th style="text-align: right;">密 码：</th>
									<td>
									<input type="password" name="u_password" id="u_password" /></td><td><span id="sp_password"></span>
									</td>
									</tr>
									 <tr height="36">
									<th style="text-align: right;">确认密 码：</th>
									<td>
									<input type="password" name="u_password2" id="u_password2"/></td><td><span id="sp_password2"></span>
									</td>
									</tr>  
									 <tr height="36">
										 <th style="text-align: right;">姓 名：</th>
										 <td>
											 <input type="text" id="u_name" name="u_name"/></td><td><span id="sp_name"></span>
											 </td>
											 
											 </tr>
								<tr height="36">
									<th style="text-align: right;">邮 箱：</th>
									<td>
										<input type="text" name="u_email" id="u_email"/></td><td><span id="sp_email"></span>
										</td>
										</tr>	
									<tr height="36">
										<th style="text-align: right;">电 话：</th>
										<td>
											<input type="text" name="u_phone" id="u_phone"/></td><td><span id="sp_phone"></span>
											</td>
											</tr>
								 <tr height="36">
										<th style="text-align: right;">
											验证码：
										</th>
										<td>
												<input type="text" name="u_validateCode"  id="validateCode" class="text" >
											</td>
												<td ><img id="code" src="${path }/user/doValidateCode" alt="验证码图片"></td>
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
				
				</form>

		
				
		</div>
		
		<script type="text/javascript">
		var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠数字以外的字符						 					
		var re = /\s/;//空格
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");//特殊字符
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
		 $('#u_password').blur(function(){
			var data = "";
			if($(this).val()==""){
				data = "密码不能为空";
			}
			if(rp.test($(this).val())){
				data="密码只能输入字母、数字"
			}
			$("#sp_password").html(data).css("color","#ff0000");
		});
		//确认密码
		$("#u_password2").blur(function(){
			var data = "";
			if($(this).val()==""){
				data = "请确认密码";
			}
			if($(this).val()!=$("#u_password").val()){
				var data = "密码不一致";
				
			}
			$("#sp_password2").html(data).css("color","#ff0000");
		}); 
		
		$('#u_name').blur(function(){
			var data = "";
			if($('#u_name').val()!=""){
				$('#sp_name').html(data).css("color","#ff0000");;
			}
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
		$('#validateCode').blur(function(){
			var data = "";
			if($(this).val()!=""){
				$('#sp_validateCode').html(data);
			}
		});
		//点击更改另一张验证码
		$("#code").on("click",function(){
			
			$(this).attr("src","${path }/user/doValidateCode?a=" + new Date().getTime()); //可以拼接当前时间  让每次请求的网址都不一样
		});
		
	});
	 
	
	function commit(object,flag){
		
		var tr = "";
		var u = "u_";
		var sp = "sp_";
		var data = "";
		if($('#u_username').val()!=""){
			if($("#u_password").val()==""){
				$("#sp_password").html("密码不能为空").css("color","#ff0000");
				return;
			}else if($("#u_password2").val()==""){
				$("#sp_password2").html("请确认密码").css("color","#ff0000");
				return;
			}else{
				$('input[type="text"]').each(function(i,v){
					
					tr = $(this).attr('name');
					if(tr=="u_username"){
						data = "账号不能为空";
					}else if(tr=="u_name"){
						data = "姓名不能为空";
					}else if(tr=="u_email"){
						data = "邮箱不能为空";
					}else if(tr=="u_phone"){
						data = "电话不能为空";
					}
					tr = tr.replace(u,sp);	
					
					if($(this).val()==""||re.test($(this).val())){//为空或者输入空格
						flag = false;
						console.log(tr);
						if(tr=="sp_validateCode"){
							alert("请输入验证码")
						}
						//document.getElementById(tr) 得到dom对象 ,通过$(document.getElementById(tr))转换传jquery对象
					$(document.getElementById(tr)).html(data).css("color","#ff0000");
					return false;
					}else if($(document.getElementById(tr)).html()!=""&&tr!="sp_validateCode"){
						flag = false;
						return false;
					}
					else {
						flag = true;
					}
					
				});
			}
		}else{
			$('#sp_username').html("账号不能为空").css("color","#ff0000");
			return;
		}
		alert(flag)
		if(flag){
			var v = $('#validateCode').val();
			$.post("${path }/user/validateCode",{"validateCode":v},function(data){
				if("success"==data){
					var data = $('#regform').serialize();
					$.post("${path }/user/register",data,function(data){
						if("success"==data){
							alert("注册成功，请前往邮箱激活")
							location.href="${path}/login.jsp";
						}
					});
					
				}else{
					alert(data)
				}
			});
		}
		
		/* if(flag){
			$('form').location.href="${path }/user/register";
		} */
		
		
	}	
 function exit(){
	 location.href="${path}/index.jsp";
 }
</script>
	</body>
</html>
