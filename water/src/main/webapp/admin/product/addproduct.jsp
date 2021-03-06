<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引标准标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 使用jstl标签 -->
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加商品</title>
<link rel="stylesheet" rev="stylesheet" href="${path }/admin/css/style.css" type="text/css" media="all" />
</head>
<body class="ContentBody">
<form action="${path }/servlet/ProductsServlet?mark=addProduct" method="post"  enctype="multipart/form-data" target="mainFrame" >

<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加商品</legend>
				    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%">商品名称:</td>
					    <td width="41%"><input name="pname" class="text"  type="text" size="40" /></td>
					  </tr>
					  <tr>
					    <td nowrap align="right" width="13%">商品分类:</td>
					    <td width="41%">
					       <select name="cid">
					        	<c:forEach items="${categors }" var="categor">
					        	 	<option value="${categor.cid }">${categor.cname }</option>
					        	</c:forEach>
					       </select>
					    </td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">商品价格:</td>
					    <td width="41%"><input name="price" class="text"  type="text" size="40" /></td>
					  </tr>
					   <tr>
					    <td nowrap align="right" width="13%">商品图片:</td>
					    <td width="41%">
					            <input name="imgurl"  checked  type="file"  />
					    </td>
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">商品描述:</td>
					    <td colspan="3"><textarea id="textarea" name="remark" rows="5" cols="80"></textarea>
					    
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
			<input type="submit" name="Submit" value="保存" class="button"/>　
			<input type="reset" name="Submit2" value="取消" class="button"/>
		   </TD>
		</TR>
	</TABLE>
    </div>
  </form>
 </body>
</html>
