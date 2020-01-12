<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.8.8/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.8.8/jquery.easyui.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.8.8/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.8.8/themes/icon.css" type="text/css">
<script type="text/javascript" src="${path }/js/jquery-easyui-1.8.8/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
</head>
<body class="easyui-layout">
	
	 <div data-options="region:'north'" style="height:80px; overflow: hidden" >
	 	<img src="${path }/img/adlogo.jpg" border="0" />
	 </div>
	 <div data-options="region:'south',split:true" style="height:50px; text-align: center;line-height: 50px; overflow: hidden">
	 	<span>版权信息</span>
	 </div>
		
		<div data-options="region:'west',split:true" title="目录" style="width:200px;">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="管理员" style="padding:10px;">
				<ul >
					<li><a href="#" >>>><span id="spa" onclick="add(this,$('#spa').html())">管理员列表</span></a></li>
				</ul>
					
				</div>
				<div title="用户管理"  style="padding:10px;">
					<ul >
					<li><a href="#" >>>><span  id="spa2" onclick="add(this,$('#spa2').html())">用户</span></a></li>
				</ul>
				</div>
				<div title="订单管理" style="padding:10px">
					<ul >
					<li><a href="#" >>>><span id="spa3" onclick="add(this,$('#spa3').html())">订单</span></a></li>
				</ul>
				</div>
				<div title="商品管理" style="padding:10px">
					<ul >
					<li><a href="#" >>>><span id="spa4"  onclick="add(this,$('#spa4').html())">商品</span></a></li>
				</ul>
				</div>
			</div>
		</div>
		<div id="center" data-options="region:'center',title:'内容',iconCls:'icon-ok'"  style="overflow: hidden" >
			
		</div>
	</div> 
	
	<script type="text/javascript">
	$(function(){
		$('#center').tabs();
	});
	
	function add(object,name){
	if($('#center').tabs("exists",name)){
		$('#center').tabs("select",name);
		var tab = $('#center').tabs('getSelected');
		$('#center').tabs("update",{
			tab:tab,
			options:{
				title:name,
				href:'datagrid.jsp'
			}
			
		});
		}else{
			$('#center').tabs("add",{
				title:name,
				selected:true,
				closable:true,
				href:'datagrid.jsp'
			});
		}
	}
	
	function del(){
		var name = $("#tname").val();
		$('#center').tabs("close",name);
	}
	</script>
</body>
</html>