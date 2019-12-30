<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!-- 引标准标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 使用jstl标签 -->
<c:set var="path" value="${pageContext.request.contextPath }" /> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="UTF-8">
    <!--<base href="http://localhost:8080/shopping/">-->    
    <title>My JSP 'left.jsp' starting page</title>
   <link href="css/css.css" rel="stylesheet" type="text/css" />
<script language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}
function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	
	//alert(imgobj);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="images/ico04.gif";
	}
}
</script>
  </head>
 <body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="${path }/admin/images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="${path }/admin/images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${admin.adm_name }</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="${path }/admin/exit" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
	 <!--管理员管理开始-->

		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img9" id="img9" src="${path }/admin/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
					   <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('9');" >系统管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </table>

		<table id="subtree9" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="22" ><img id="xiaotu22" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
				  <a href="${path }/admin/user/adduser.jsp" target="mainFrame" class="left-font03" 
						onClick="tupian('22');">添加管理员</a></td>
				</tr>
				<tr>
				  <td width="9%" height="23" ><img id="xiaotu23" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${path }/admin/findUsers" target="mainFrame" class="left-font03" 
						onClick="tupian('23');">管理员列表</a></td>
				</tr>
      </table>
		<!-- 管理员管理结束    -->
			
  <!--会员管理开始-->
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
        <tr>
          <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="8%"><img name="img6" id="img6" src="${path }/admin/images/ico04.gif" width="8" height="11" /></td>
                <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('6');">会员管理</a></td>
              </tr>
          </table></td>
        </tr>
      </table>
	  <table id="subtree6" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
        <tr>
          <td width="9%" height="20"><img id="xiaotu15" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="${path }/user/findAll" target="mainFrame" class="left-font03" onClick="tupian('15');">会员列表</a></td>
        </tr>
      </table>
	<!--  会员管理结束    -->
	
	<!--  分类管理开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="${path }/admin/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >分类管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu20" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="category/addcategory.html" target="mainFrame" class="left-font03" onClick="tupian('20');">添加分类</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu21" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="category/listcategory.html" target="mainFrame" class="left-font03" onClick="tupian('21');">分类列表</a></td>
				</tr>
      </table>
		<!--  分类管理结束    -->
<!--  商品管理开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img4" id="img4" src="${path }/admin/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('4');" >商品管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree4" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu11" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="product/listproduct.html" target="mainFrame" class="left-font03" >添加商品</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu12" src="${path }/admin/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="#" target="mainFrame" class="left-font03" onClick="tupian('12');">商品列表</a></td>
				</tr>
      </table>
		<!--  商品管理结束    -->
	  </TD>
  </tr>
  
</table>
</body>
</html>
