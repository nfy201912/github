<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${path }/css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->    
    <script type="text/javascript" src="${path }/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${path }/js/jquery.bxslider_e88acd1b.js"></script>
    <script type="text/javascript" src="${path }/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${path }/js/menu.js"></script>    
     <script type="text/javascript" src="${path }/js/jquery-3.4.1.js"></script>   
	<script type="text/javascript" src="${path }/js/select.js"></script>
    
	<script type="text/javascript" src="${path }/js/lrscroll.js"></script>
    
    <script type="text/javascript" src="${path }/js/iban.js"></script>
    <script type="text/javascript" src="${path }/js/fban.js"></script>
    <script type="text/javascript" src="${path }/js/f_ban.js"></script>
    <script type="text/javascript" src="${path }/js/mban.js"></script>
    <script type="text/javascript" src="${path }/js/bban.js"></script>
    <script type="text/javascript" src="${path }/js/hban.js"></script>
    <script type="text/javascript" src="${path }/js/tban.js"></script>
    
	<script type="text/javascript" src="${path }/js/lrscroll_1.js"></script>
    
    
<title>校园送水登入</title>
</head>
<body>  


<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg" style="background-color:#82fbf8 ">	
		
		
		<div id="d1" class="login" style="margin-top: 100px">
    	
		<div style="background-image: url('${path}/img/loginbg.jpg');width: 455px;height: 385px;padding: 10px">
        	
            <table border="0" style="width:370px; font-size:14px; margin-top:30px; padding: 0 22px; text-align: center" cellspacing="0" cellpadding="0">
           	<tr height="100"><td style="text-align: center;color: #82fbf8"><h1>校园送水</h1></td></tr>
            <tr height="70">
              
                <td><input type="button" name="userdr" value="用户登录" class="log_btn" onclick="ul()"/></td>
              </tr>
             <tr height="70">
              
                <td><input type="button" name="admdr" value="管理员登录" class="log_btn" onclick="al()"/></td>
              </tr>
              
             <tr height="120">
              
                <td><input type="button" name="exit" value="首 页" class="log_btn" onclick="exit()"/></td>
              </tr>
            </table>
         
        </div>
    </div>
	
	
			<!-- 管理员登入 -->
		
			<div id="d2" class="login" style="margin-top: 100px;display: none">
		<div style="background-color: #b0fdfb;width: 455px;height: 385px;padding: 10px">
        	<form  method="post">
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
           
              <tr height="50" valign="top" style="text-align: center">
              	<td width="50">&nbsp;</td>
                <td>
                	<span  style="font-size:24px;">管理员登录</span>
                   
                </td>
              </tr>
              <tr height="70">
                <td>用户名</td>
                <td><input type="text"  name="adm_name" value="${admin.adm_name }" class="l_user" /></td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password"  name="adm_password" value="" class="l_pwd" /></td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" /></label><label class="r_txt">请保存我这次的登录信息</label>
                    </span>
                  
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" name="dr" value="登录" class="log_btn" onclick="login()"/></td>
              </tr>
              <tr height="">
              	<td>&nbsp;</td>
                <td><input type="button" name="back" value="返回" class="log_btn" onclick="init()"/></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
	
				<!-- 用户登入 -->
				<div id="d3" class="login" style="margin-top: 100px; display: none" >
    	
		<div style="background-color: #b0fdfb;width: 455px;height: 385px;padding: 10px">
        	<form  id="loginForm" action="${path }/user/userLogin" method="post">
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
           
              <tr height="50" valign="top" style="text-align: center">
              	<td width="50">&nbsp;</td>
                <td>
                	<span  style="font-size:24px;">用户登录</span>
                   
                </td>
              </tr>
              <tr height="70">
                <td>用户名</td>
                <td>
                <input type="text"  id="name" name="u_username" value="${cookie.username.value }" class="l_user" />
                <span id="sp_username"></span>
                </td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password" name="u_password" id="u_password" value="${cookie.password.value }" class="l_pwd" />
                	<span id="sp_password"></span>
                </td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
               		<input type="checkbox" id="autoLogin" name="autoLogin" ${empty cookie.autoLogin ? "": "checked"} ><span>自动登入</span> 
                	<input type="checkbox" id="rembPwd"  name="rembPwd" ${empty cookie.rembPwd ? "": "checked"}><span>记住密码</span>
                    </span>
                  
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="登录" class="log_btn" onclick="commit()"/></td>
              </tr>
              <tr height="">
              	<td>&nbsp;</td>
                <td><input type="button" name="back1" value="返回" class="log_btn" onclick="init()"/></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
	

</div>
<!--End Login End--> 
<!--Begin Footer Begin-->


</body>
<script type="text/javascript">
//document.getElementById("d2").style.display="none";//隐藏
//document.getElementById("d3").style.display="none";//隐藏
$("#d2").hide();
$("#d3").hide();
function init(){

	//document.getElementById("d3").style.display="none";//隐藏
	//document.getElementById("d2").style.display="none";//隐藏
	//document.getElementById("d1").style.display="";//显示
	$("#d3").hide();
	$("#d2").hide();
	$("#d1").show();
}
function exit(){
	location.href="${path}/index.jsp";//退回首页
}
function ul(){
		
		//document.getElementById("d1").style.display="none";//隐藏
		//document.getElementById("d2").style.display="none";//隐藏
		//document.getElementById("d3").style.display="";//显示
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
				
					commit();//自动登入  注意：$("form").submit()提交表单的时候，input的id、name	不能为submit  
				
				
			}
		}, 2000);
}
function commit(){
	$.post("${path}/user/userLogin",{"u_username":$("#name").val(),"u_password":$("#u_password").val(),"autoLogin":$("#autoLogin").val(),"rembPwd":$("#rembPwd").val()},function(data){
		if("SUCCESS"==data){
			location.href="${path}/index.jsp";
		}else{
			alert(data)
		}
	});
}
function al(){
	
	//document.getElementById("d1").style.display="none";//隐藏
	//document.getElementById("d3").style.display="none";//隐藏
	//document.getElementById("d2").style.display="";//显示
	$("#d1").hide();
	$("#d3").hide();
	$("#d2").show();
}

document.onkeydown=keyListener;
function keyListener(e){
	/* alert($("#id").is(':visible')); //判断是否显示  显示：true 隐藏：false
	if($("#id").is(':hidden')){
	alert("隐藏了");
	//处理业务
}
 */
    // 当按下回车键，执行我们的代码
    if(e.keyCode == 13){
    	if(!$("#d2").is(':hidden')){//管理员
    		login();
    	}
    	if(!$("#d3").is(':hidden')){//用户
    		commit();
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
//用户登入
 /* $(function(){
	if($("#autoLogin").prop("checked")){
		
		$("#rembPwd").prop("checked",true);
		setTimeout(function () {
		    
		$("#loginForm").submit();//自动登入
		}, 1500);
		
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
})  */

</script>


</html>
