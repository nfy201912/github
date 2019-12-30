<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引标准标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<fmt:formatDate value="${job.jobtime }" pattern="yyyy-MM-dd HH:mm:ss"/>
<!-- 使用jstl标签 -->
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>校园送水系统 </title>
<link href="${path }/admin/css/css.css" rel="stylesheet" type="text/css" />
<link href="${path }/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${path }/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	//删除单条数据
	function delUserById(obj,num){
		var flag = confirm('你是否要确定删除这条数据');
		//结果为真，则真的删除 (防止误删数据)
		var arr = new Array();
		arr.push(num);
		if(flag){
			$.post("${path}/user/delete",{"array[]":arr},function(data){
				alert(data)
				if(data){
					//obj则是当前对象，也就是点击的a标签      a-->td
					 //a      td     //tr      删除
					$(obj).parent().parent().remove();
				}
			},"json");
		}
	}
	
	//批量删除
	$(function(){
		$("#delSelectUser").on("click",function(){
			
			//定义数组
			var arr = new Array();
			$("input[type=checkbox]:checked").each(function(i,v){
					//alert(v.value)
				//arr[i] = v.value;
				arr.push(v.value);
				
			});
			
			//发送异步请求
			$.post("${path}/user/delete",{"array":arr},function(data){
				
				if(data){
					$("input[type=checkbox]:checked").each(function(i,checkbox){
						//checkbox.parent().parent().remove();
						//$(checkbox): 把javascript对象转换成jquery对象
					    $(checkbox).parent().parent().remove();
						
						//var $cbx = $(checkbox);
						//$cbx.parent().parent().remove()
					});
				}
				
			},"json");
			
			
			
			//var ch = $("input[type=checkbox]:checked");
			/* $.each(ch,function(i,v){
				alert(v.value);
			}); */
			
		});
	});
</script>
</head>
<body >
<form name="fom" id="fom" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"></td>
  </tr>
  <tr>
    <td>
    <input type="button" value="批量删除" id="delSelectUser">
    <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
		          <tr>
                    <td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title">管理员列表</td>
                  </tr>
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">编号</td>
                    <td width="5%" height="20" align="center" bgcolor="#EEEEEE">账号</td>
                    <td width="20%" align="center" bgcolor="#EEEEEE">密码</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">姓名</td>
                   <td width="15%" align="center" bgcolor="#EEEEEE">邮箱</td> 
                   <td width="15%" align="center" bgcolor="#EEEEEE">电话</td> 
                   <td width="6%" align="center" bgcolor="#EEEEEE">状态</td>
                   <td width="20%" align="center" bgcolor="#EEEEEE">创建时间</td>  
                    <td width="26%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  
                  <c:choose>
                  	<c:when test="${empty users }">
                  		<tr align="center">
					    	<td bgcolor="#FFFFFF" colspan="6">没有数据</td>
	                 	</tr>
                  	</c:when>
                  	
                  	<c:otherwise>
                  		 <c:forEach items="${users }" var="user" varStatus="s">
	                  		<tr align="center">
							    <td bgcolor="#FFFFFF"><input type="checkbox"  value="${user.u_id }">${s.count}</td>
			                    <td height="20" bgcolor="#FFFFFF">${user.u_username}</td>
			                    <td bgcolor="#FFFFFF">${user.u_password }</td>
			                    <td bgcolor="#FFFFFF">${user.u_name }</td>
			                    <td bgcolor="#FFFFFF">${user.u_email }</td>
			                    <td bgcolor="#FFFFFF">${user.u_phone }</td>
						       <td bgcolor="#FFFFFF"><c:choose><c:when test="${user.u_status}"> 未锁定</c:when><c:otherwise>锁定</c:otherwise></c:choose></td>
			                   <td bgcolor="#FFFFFF"><fmt:formatDate value="${user.u_createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			                    <td bgcolor="#FFFFFF">
			                       <a href="javascript:void(0)" onclick="delUserById(this,${user.u_id })" >删除</a>
			                    |  <a href="${ path}/user/edit?&aid=${user.u_id }">编辑</a></td>
		                  	</tr>
		                 </c:forEach>
                  	</c:otherwise>
                  </c:choose>
                  
                  
                </table>
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
  </tr>
</table>
</form>
</body>
</html>
