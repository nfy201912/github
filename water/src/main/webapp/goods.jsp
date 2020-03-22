<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>index</title>
		<link rel="stylesheet" type="text/css" href="${path }/css/bootstrap.css" />
		 <link rel="stylesheet" type="text/css" href="${path }/css/mybootstrap.css?v=<%= System.currentTimeMillis()%>" charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="${path }/css/animate.css"/>
		<script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	 <script src="${path }/js/my.js" type="text/javascript" charset="utf-8"></script> 
	 <script type="text/javascript" src="${path }/js/jPage-1.2.js"></script>
		<script src="${path }/js/jquery.singlePageNav.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/wow.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			new WOW().init();
			
		</script>
</head>
<body >
		<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
		<div class="container" >
	<%-- 	
		<div class="row" style="float:left;margin-top:20px; padding: 0" >
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-9" style="padding: 0;">
			<img alt="" src="${path}/img/adlogo.jpg">
			</div>
			
		</div> --%>
		
			
			
			 	<div  class="row" style="padding: 0;">
				<div class="col-md-12 col-lg-12 col-sm-12 col-xs-9" style="padding: 0;">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					              <span class="sr-only">Toggle navigation</span>
					              <span class="icon-bar"></span>
					              <span class="icon-bar"></span>
					              <span class="icon-bar"></span>
					            </button>
									
							</div>
							<div id="navbar" class="navbar-collapse collapse" align="center">
								<ul class="nav navbar-nav navbar-letf">
									<li><a href="${path}/index.jsp"> <span style="font-size: 20px;" >首 页</span></a></li>
			
<li ><div class="page-header" style="padding: 0px;border: 0px;margin-top:9px;">
    <div class="form-horizontal">
       
        <div class="col-md-12">
            <select id="sel" class="form-control">
            	<option value="">所 有 品 牌 </option>
                <option value="1">娃 哈 哈</option>
                <option value="2">雀 巢</option>
                <option value="3">怡 宝</option>
                <option value="4">屈 臣 氏</option>
                <option value="5">农 夫 山 泉</option>
                <option value="6">达 能 益 力</option>
                <option value="7">乐 百 氏</option>
                <option value="8">冰 露</option>
            </select>
        </div>
    </div>
</div></li>
								</ul>
			
				
								
								<form id="serForm" action="${path}/goods/findGoods" method="post" class="navbar-form navbar-right" role="search" style="margin-right:-90px;">
	<div class="col-sm-4 col-xs-4" style="margin-right:75px;padding:0;">
    <input id="serch" type="text" name="g_name" style="width: 280px;" class="form-control" placeholder="Search">
   				    <!-- <input type="hidden" id="gn" name="g_name" value=""/> -->
					<input type="hidden" id="sp" name="startPage" value="1"/>
					<input type="hidden" id="ps" name="pageSize" value="12"/>
					<input type="hidden" id="bn" name="b_name" value=""/>
</div>
 <button id="ser" type="button"  class="btn btn-default">搜 索</button>
</form>
							</div>
							
							<!--/.nav-collapse -->
						</div>
						
						<!--/.container-fluid -->
					</nav>
				</div>
				
			</div>
			
			
		</div>
		<!-- /container -->
		<!-- 内容板块 -->
		
				
					<div  class="container">
							<div  class="row" style="padding:8px 20px 20px 20px;background-color: #c9e9f9;"> 
							<div  class="row" style=" padding: 0;margin: 5px -15px;height: 348px;" align="center">
						 <c:choose>
								<c:when test="${goods!= null&&goods.size()>0}">
							
									<c:forEach items="${goods}" var="good" >
				<a href="${path}/goods/loadByID?g_id=${good.g_id}"><div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin-top:20px;h" ><img src="${path }${good.g_imgUrl}" style="width: 282px;height: 202px;" ><span style="font-size: 18px;margin-top: 6px;">${good.g_name} &nbsp;&nbsp;&nbsp;单 价:&nbsp;${good.g_price}</span></div></a>
									</c:forEach>
								</c:when>
								<c:otherwise>
								<span style="margin-top: 130px;"><h3>没 有 数 据. . .</h3></span>
								
								</c:otherwise>
							</c:choose> 
							<div id="goods" class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="margin-top: 50px;" ></div>
				</div>
				
					
				
			</div>
						<!-- g_name="+$('#serch').val()+"&startPage="+1+"&pageSize="+12+"&b_name= -->
						
				
				</div>
		
		<%@include file="foot.jsp" %><!-- 静态包含 -->
		
	</body>
	<script type="text/javascript">
	$(function(){
		var c = '${count}';//总记录数
		var num =parseInt('${startPage}');//当前页码
		var brand = '${brand}';//品牌
		if(num>1){
			$('#goods').page({count:c,pageNo:num,pageSize:12,skipPart:true});
		}else{
			
			$('#goods').page({count:c,pageSize:12,skipPart:true});// 分页栏  $("#test").page({count:70,pageSize:3,skipPart:true});
		}
			//$("#goods").page({count:c,pageNo:num,pageSize:12,skipPart:true});
		
		$(document).on('click','#goods .pagination_search',function(){
			if($(document).find("#goods .pagination_change_page").val()==""){
				
				alert("跳转页码不能为空");
			}else{
				
					var num=parseInt($(document).find("#goods .pagination_change_page").val());
					$("#goods").page({count:c,pageNo:num,pageSize:12,skipPart:true});
					location.href="${path}/goods/findGoods?g_name="+$('#serch').val()+"&startPage="+num+"&pageSize="+12+"&b_name="+brand;
				
			}
		});

		$(document).on('click','#goods .pagination li',function(){
			
			var num=$(this).attr("num");
			if($(this).attr("class")=="disabled"){
				
				return false;
			}
			
			if(num==0 || num==(c+1)){// || num==(count+1)

			}else{
				location.href="${path}/goods/findGoods?g_name="+$('#serch').val()+"&startPage="+num+"&pageSize="+12+"&b_name="+brand	;
				$("#goods").page({count:c,pageNo:num,pageSize:12,skipPart:true});
			}
		});
		
			$('#sel').val(brand);	
			
		
		$("#sel").change(function(){//品牌选择
			var s = $("#sel option:selected");//获取选中项   s.val()选中项 值+s.text()文本
			//location.href="${path}/goods/findGoods?g_name="+$('#serch').val()+"&startPage="+1+"&pageSize="+12+"&b_name="+s.val();
			
			$('#bn').val(s.val());
			$('#serForm').submit();
		});
		
		$('#ser').click(function(){//搜索
			var s = $("#sel option:selected");
			//location.href="${path}/goods/findGoods?g_name="+$('#serch').val()+"&startPage="+1+"&pageSize="+12+"&b_name="+$("#sel option:selected").val();
			$('#bn').val(s.val());
			$('#serForm').submit();
		});
		
		
	});
	
	</script>
</html>