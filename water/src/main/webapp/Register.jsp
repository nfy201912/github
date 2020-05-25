<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${path }/css/style.css" />
    
    <script type="text/javascript" src="${path}/js/jquery-1.8.2.min.js"></script>
  
<title>Insert title here</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg" style="height: 50px;overflow: hidden;">
	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg" style="height:700px; background-image: url('${path}/img/bg.jpg');">	
	<div class="regist" style="margin-top:50px;">
    	<div class="log_img" style="float: left;margin-top: 90px;"><img src="${path}/img/logo1.png" width="611" height="425" /></div>
		<div class="reg_c" style="background: rgba(255,255,255,0.5);">
        	<form id="regform">
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr">已有账号，<a href="${path}/login.jsp" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                <td><input type="text" id="u_username" name="u_username"  value="" class="l_user" /><span id="sp_username"></span></td>
                
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                <td><input type="password" name="u_password" id="u_password" value="" class="l_pwd" /><span id="sp_password"></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                <td><input type="password" name="u_password2" id="u_password2" value="" class="l_pwd" /><span id="sp_password2"></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                <td><input type="text" name="u_email" id="u_email" class="l_email" /><span id="sp_email"></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                <td><input type="text" name="u_phone" id="u_phone" value="" class="l_tel" /><span id="sp_phone"></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;姓名 &nbsp;</td>
                <td><input type="text" id="u_name" name="u_name" value="" class="l_mem" /><span id="sp_name"></span></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;地址 &nbsp;</td>
                <td>
                <select id="u_address" name="u_address" style="width: 319px;height: 40px;">
          			<option value="澄碧校区" selected="selected">澄碧校区</option>
                	<option value="东合校区" >东合校区</option>
                </select>
               <!-- <input type="hidden" id="u_address" name="u_address" value="" class="l_mem" /><span id="sp_address"></span> --></td>
              </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                   <input type="text" name="u_validateCode"  id="validateCode" value="" class="l_ipt" /> 
                     <a><img id="code" src="${path }/user/doValidateCode" alt="验证码图片" style="vertical-align:middle;"></a>
                </td><%-- <span class="redFont">&nbsp;&nbsp;&nbsp;&nbsp;${validateCodeMessage }</span> --%>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" /></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="立即注册" onclick="commit(this,false)" class="log_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<div class="btmbg">
    <%@include file="../foot.jsp" %><!-- 静态包含 -->	
</div>
<!--End Footer End -->    

</body>
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
			if($(this).val().length<6){
				data="密码长度不能小于6位"
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
		if($('#u_username').val()!=""&&$('#sp_username').html()==""){
			if($("#u_password").val()==""){
				$("#sp_password").html("密码不能为空").css("color","#ff0000");
				return;
			}else if($("#u_password2").val()==""){
				$("#sp_password2").html("请确认密码").css("color","#ff0000");
				return;
			}else if($("#u_password2").val()!=""&&$("#sp_password2").html()!=""){
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
		}else if($('#u_username').val()==""){
			$('#sp_username').html("账号不能为空").css("color","#ff0000");
			return;
		}
		
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
		 
		
	}	
 function exit(){
	 location.href="${path}/index.jsp";
 }
</script>


</html>
