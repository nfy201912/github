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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加管理员</title>
<script type="text/javascript" src="${path}/js/jquery-3.4.1.js" charset="utf-8"></script>
<link rel="stylesheet" rev="stylesheet" href="${path }/admin/css/style.css" type="text/css" media="all" />
</head>
<body class="ContentBody">
<form name="fom" id="fom" target="mainFrame" method="post" >
	<input type="hidden" name="mark" value="updateAdmin">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >编辑页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>编辑管理员</legend>
				     
				     <input type="hidden" name="aid" value="${a.aid }">
				    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%">账号:</td>
					    <input type="hidden" name="adm_id" value="${adm.adm_id }"/>
					    <td width="41%"><input type="text" name="adm_name" id="adm_name" value="${adm.adm_name}" ></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">密码:</td>
					    <td width="41%"><input name="adm_password" id="adm_password" class="text"  value="${adm.adm_password }"   type="password" size="40" /></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">状态:</td>
					    <td width="41%">
					    	<c:choose>
					    		<c:when test="${adm.adm_status}">
			    		 			未锁定：<input  name="adm_status" class="text" checked value="1"   type="radio"  />
			                     	 锁定：<input  name="adm_status" class="text"    value="0" type="radio"  />
					    		</c:when>
					    		
					    		<c:otherwise>
			    					 未锁定：<input  name="adm_status" class="text"  value="1"   type="radio"  />
			                     	 锁定：<input  name="adm_status" class="text"  checked="checked"  value="0" type="radio"  />
					    		</c:otherwise>
					    	</c:choose>
					    	
					                    
					    </td>
					  </tr>
					 
					  </table>
			 <br />  
				</fieldset>			
			</TD>
		</TR>
		</TABLE>
	 </td>
     </tr>
		<TR>
		   <TD colspan="2" align="center" height="50px">
			<input type="button" id="submit"  name="Submit" value="修改" class="button"/>　
			<input type="reset" name="Submit2" value="取消" class="button"/>
		   </TD>
		</TR>
	</TABLE>
    </div>
  </form>
 </body>
 <script type="text/javascript">
 	$(function(){
 		$("#submit").click(function(){
 		//var data = new Array();	
 		// var data = $("form").serialize();//将form表单序列化$("#form1").serializeObject()
 		/* $.ajax(
    {
        url:"${pageContext.request.contextPath}/blogger/loginOu.html",//发送的路径
        data:{},//发送的数据
        type:"post",//发送的方式
        dataType:"json",//服务器返回的数据类型
        success: function(data) {
            if(data.msg="success"){
                alert("已提交成功");
               
            }else{
                alert("提交失败");
            }
        },
        error: function (data){
            alert("提交失败");
        }

    });
 */
 		var id = $("input[name='adm_id']").val();
 		var name = $("#adm_name").val();
 		 var password = $("#adm_password").val();
 		 var satus = $('input[name="adm_status"]:checked').val();
 		
 			$.post("${path }/admin/edit",{"adm_id":id,"adm_name":name,"adm_password":password,"adm_status":satus},function(data){
 				alert(data);
 				if("更新成功"==data){
 				location.href="${path}/admin/findUsers";
 				}
 				
 			}); 
 		});
 	})
 	
 </script>
</html>
