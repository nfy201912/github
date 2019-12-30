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
    
    
<title>校园送水《管理员》</title>
</head>
<body>  


<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg" style="background-color:#82fbf8 ">	
   
	<div class="login" style="margin-top: 100px">
    	
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
                <td><input type="button" name="submit" value="登录" class="log_btn" onclick="login()"/></td>
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
document.onkeydown=keyListener;
function keyListener(e){
    // 当按下回车键，执行我们的代码
    if(e.keyCode == 13){
        login();
    }
}
function login(){
	
	var name = $('input[name="adm_name"]').val();
	var pwd = $('input[name="adm_password"]').val();
	$.post("${path }/admin/login",{"adm_name":name,"adm_password":pwd},function(data){
		alert(data)
		if("SUCCESS"==data){
			location.href="${path}/admin/index.jsp";
			//$scope.$apply();
		}
	});
}


	/* $(function(){
		$('input[name="submit"]').click(function(){
			var name = $('input[name="adm_name"]').val();
			var pwd = $('input[name="adm_password"]').val();
			$.post("${path }/admin/login",{"adm_name":name,"adm_password":pwd},function(data){
				alert(data)
				if("SUCCESS"==data){
					location.href="${path}/admin/index.jsp";
					//$scope.$apply();
				}
			});
			
		});
	}) */
	
</script>


</html>
