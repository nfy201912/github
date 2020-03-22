<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${path }/css/style.css" />
<script type="text/javascript" src="${path }/js/jquery-1.8.2.min.js"></script>
<%-- <script type="text/javascript" src="${path }/js/jquery-3.4.1.js"></script>  --%>

<title>Insert title here</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg" style="height: 50px;overflow: hidden;">
	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
	
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg" style="background-color: #fff4ef;height: 700px;">	

	<div  class="login" style="margin-top: 100px;">
    	<div class="log_img" style="float: left;"><img src="${path}/img/logo1.png" width="611" height="425" /></div>
		<div id="d3" class="log_c" style="background-color: #FFF;">
        	<form>
        	<a style="font-size:16px;padding: 10px;" onclick="al()">切换管理员</a>
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="55">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">用户登录</span>
                    <span class="fr">还没有账号，<a href="${path}/Register.jsp" style="color:#ff4e00;">立即注册</a></span>
                </td>
              </tr>
              <tr height="70">
                <td>用户名</td>
                <td><input type="text" id="name" name="u_username" value="${cookie.username.value }" class="l_user" /></td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password" name="u_password" id="u_password" value="${cookie.password.value }" class="l_pwd" /></td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<input type="checkbox" id="autoLogin" name="autoLogin" ${empty cookie.autoLogin ? "": "checked"} ><span>自动登入</span> 
                	<input type="checkbox" id="rembPwd"  name="rembPwd" ${empty cookie.rembPwd ? "": "checked"}><span>记住密码</span>
                    </span>
                    <span class="fr"><a onclick="wj()" style="color:#ff4e00;">忘记密码</a></span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="登录" class="log_btn" onclick="commit()" /></td>
              </tr>
            </table>
            </form>
        </div>
        
        <!-- 管理员登录 -->
        <div id="d2" class="log_c" style="background-color: #FFF;">
        	<form>
        	<a style="font-size:16px;padding: 10px;" onclick="ul()">切换用户</a>
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top" >
              	<td width="55">&nbsp;</td>
                <td align="center">
                	<span  style="font-size:24px;">管理员登录</span>
                    
                </td>
              </tr>
              <tr height="70">
                <td>账&nbsp; &nbsp; 号</td>
                <td><input type="text" name="adm_name" value="${adm.adm_name }" class="l_user" /></td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password" name="adm_password" value="" class="l_pwd" /></td>
              </tr>
              
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="登录" class="log_btn" onclick="login()" /></td>
              </tr>
            </table>
            </form>
        </div>
        <!-- 忘记密码 -->
        <div id="d1" class="log_c" style="background-color: #FFF;">
        	<form id="formEt">
        	<a style="font-size:16px;padding: 10px;" onclick="ul(),rs()">返回</a>
            <table border="0" style="width:390px; font-size:14px; margin-top:30px;text-align: center;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	
                <td style="padding-left: 32px;">
                	<span class="fl" style="font-size:24px;">忘记密码</span>
                </td>
               
              </tr>
              <tr height="70">
               
                <td><input type="text" id="em" name="u_email" onblur="vdl()" class="l_email" placeholder="邮箱"  required="required"  /><br/><span id="hem" style="color:red;position:absolute; left:980px;"></span></td>
             
              </tr>
              <tr height="70">
               
                <td><input type="text" name="validate" id="vd"  class="l_user" placeholder="验证码" required="required" /><a id="rc" onclick="receive()"  style="position:absolute; right:280px;padding-top: 8px;">获取验证码</a><br/><span id="hvd" style="color:red;position:absolute; left:980px;"></span></td>
              </tr>
              <tr height="70">
              
                <td >
                	<input type="password" name="u_password" id="npwd" class="l_pwd" placeholder="设置新密码" required="required" /><br/><span id="hpwd" style="color:red;position:absolute; left:980px;"></span>
                </td>
              </tr>
              <tr height="70">
              	
                <td><input type="button" value="确定" class="log_btn" onclick="sure()" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->

<!--End Footer End -->    
<div class="btmbg">
    <%@include file="../foot.jsp" %><!-- 静态包含 -->	
</div>
</body>

<script type="text/javascript">
	$("#d1").hide();
	$("#d2").hide();
	$("#d3").show();
	if(!$("#d3").is(':hidden')){//用户
		ul();
	}
/* function exit(){
	location.href="${path}/index.jsp";//退回首页
} */
function ul(){
		$("#d1").hide();
		$("#d2").hide();
		$("#d3").show();
		
		 $("#autoLogin").click(function(){//判断自动登入复选框
			
			if($(this).prop("checked")){
				$("#rembPwd").prop("checked",true);
			}else{
				$(this).prop("checked",false);
			}
		}); 
		$("#rembPwd").click(function(){//记住密码
		if(!$(this).prop("checked"))
			$("#autoLogin").prop("checked",false);
		});
		setTimeout(function () {
			
			if($("#autoLogin").prop("checked")){
				
				$("#rembPwd").prop("checked",true);
					if($("#d3").is(':hidden')){
						return;
					}
					commit();//自动登入  注意：$("form").submit()提交表单的时候，input的id、name	不能为submit  
				
				
			}
		}, 2000);
}
function commit(){
	$.post("${path}/user/userLogin",{"u_username":$("#name").val(),"u_password":$("#u_password").val(),"autoLogin":$("#autoLogin").prop("checked"),"rembPwd":$("#rembPwd").prop("checked")},function(data){
		if("SUCCESS"==data){
			location.href="${path}/index.jsp";
		}else{
			alert(data)
		}
	}); 
}
function al(){
	$("#d1").hide();
	$("#d3").hide();
	$("#d2").show();
}
function wj(){
	$("#d2").hide();
	$("#d3").hide();
	$("#d1").show();
	
}
document.onkeydown=keyListener;
function keyListener(e){
    // 当按下回车键，执行我们的代码
    if(e.keyCode == 13){
    	if(!$("#d2").is(':hidden')){//管理员
    		login();
    	}
    	if(!$("#d3").is(':hidden')){//用户
    		commit();
    	}
    	if(!$("#d1").is(':hidden')){//忘记密码
    		sure();
    	}
        
    }
}

//管理员登入
function login(){
	
	var name = $('input[name="adm_name"]').val();
	var pwd = $('input[name="adm_password"]').val();
	$.post("${path }/admin/login",{"adm_name":name,"adm_password":pwd},function(data){
		
		
		if("SUCCESS"==data){
			
			location.href="${path}/admin/index.jsp";
			//$scope.$apply();
		}else{
			alert(data);
		}
	});
}

/* 忘记密码 */
var uid;
var flag = false;
function vdl(){
	$('#rc').removeAttr("onclick");
	var email = $("#em").val();
	if(email!=""){
		$.post("${path}/user/load",{"u_email":email},function(data){
			if(data==null ||data==""){
				$('#hem').html("邮箱不存在");
				flag = false;
				$('#rc').attr("onclick","receive();");
			}else{
				$('#hem').html("");
				$('#rc').attr("onclick","receive();");
				uid = JSON.parse(data)["u_id"];
				flag = true;
			}
		});
	}else{
		$('#rc').attr("onclick","receive();");
		$('#hem').html("邮箱不能为空");
	}
	
}
var interval;
function rs(){//返回时重置form
	$('#formEt')[0].reset();
	$('#hem').html("");
	$('#hvd').html("");
	$('#hpwd').html("");
	clearInterval(interval);//停止
	$('#rc').html("获取验证码");
}
function timeOut(time){
	interval = setInterval(function(){
		$('#rc').html(time+"s后重新获取");
		$('#rc').removeAttr("onclick");
		if(time<0){
			$('#rc').attr("onclick","receive();");
			$('#rc').html("重新获取");
			clearInterval(interval);//停止
		}
		time--;
	},1000);
}

function receive(){//获取验证码
	if(flag){
		$.post("${path}/user/sendCode",{"u_id":uid,"u_email":$('#em').val()},function(data){
			if("success"==data){
				$('#hvd').html("验证码已成功发送,请注意查收").css("color","#3A8BFF");
				timeOut(60);
			}else{
				$('#hvd').html(data);
			}	
		})
	}else{
		vdl();
	}
	 
}

function sure(){//设置新密码
	if($('#em').val()==""&&$('#hem').html()==""){
		$('#hem').html("邮箱不能为空");
		return;
	}
	if($('#vd').val()==""&&$('#hvd').html()==""){
		$('#hvd').html("验证码不能为空").css("color","#ff0000")
		return;
	}
	if($('#npwd').val()==""&&$('#hpwd').html()==""){
		$('#hpwd').html("密码不能为空")
		return;
	}
	if(flag){
		$.post("${path}/user/vdCode",{"u_id":uid,"u_validate":$('#vd').val()},function(data){
			if(data!=""){
				if("error"==data){
					$('#hvd').html("验证码已过期,请重新获取").css("color","#ff0000");
					return;
				}
				$.post("${path}/user/updatePWD",{"u_id":uid,"u_password":$('#npwd').val()},function(data){
					if("success"==data){
						alert("新密码设置成功！");
						ul();
						rs();//重置
					}
				});
				
				
			}else{
				$('#hvd').html("验证码错误").css("color","#ff0000");
			}
		})
	}else{
		vdl();
	}
	
}
</script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
