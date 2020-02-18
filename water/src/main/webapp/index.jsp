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
		<script src="${path }/js/jquery.singlePageNav.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path }/js/wow.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			new WOW().init();
		</script>
</head>
<body >

	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
		<div class="container" >
			<!-- Static navbar -->
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
									<li><a href="#home">首 页 <span class="sr-only">(current)</span></a></li>
									<li><a href="#bbs">论 坛</a></li>
									<li><a href="">送 水 员</a></li>
									<li><a href="${path}/goods/findGoods?g_name&b_name&startPage=1&pageSize=12">商 品</a></li>
									<li><a href="">联 系 我 们</a></li>
								</ul>
								<form class="navbar-form navbar-right" role="search" style="margin-right:-90px;">
	<div class="col-sm-4 col-xs-4" style="margin-right:75px;padding:0;">
    <input id="st" type="text" style="width: 280px;" class="form-control" placeholder="Search">
</div>
 <button id="ser" type="button" class="btn btn-default">搜 索</button>

  

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
		
				
					<div class="container">
						<!-- 轮播图 -->
						<div class="row">
					
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
						  <!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
						     <li data-target="#carousel-example-generic" data-slide-to="2"></li> 
						  </ol>
						
						  <!-- Wrapper for slides -->
						  <div id="Mycarousel" class="carousel-inner" role="listbox">
						    <div class="item active" >
						      <img src="${path }/img/wahaha.jpg" style="display: block;height: 480px"  title="来啦老弟！！！" alt="图片走丢了...">
						     
						    </div>
						    <div class="item">
						      <img src="${path }/img/yibao.jpg" style="display: block;height: 480px" title="来啦老弟！！！"  alt="图片走丢了...">
						      
						    </div>
							<div class="item">
							  <img src="${path }/img/lebaishi.jpg" style="display: block;height: 480px" title="来啦老弟！！！"  alt="图片走丢了...">
							  
							</div>
						   
						  </div>
						
						  <!-- Controls -->
						  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
						</div>
						<div class="row" style="padding:0;margin: 40px 0;">
						<div class="col-md-4 col-lg-4 col-sm-4" style="text-align: right">
									
								</div>
								<div class="col-md-4 col-lg-4 col-sm-4" style="text-align:center">
									<span>品 牌 系 列</span>
								</div>
								
		
			
						</div>	
						
						<div class="row" style="padding:8px 20px 20px 20px;background-color: #c9e9f9;">
							<div class="row" style="height:240px; padding: 0;margin: 5px -15px" align="center">
							<input type="hidden" id="tt" value="乐百氏"/>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin-top:20px;" ><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=7" style="text-decoration: none;"><img src="${path }/img/lebaishi1.jpg"><span style="font-size: 18px;margin-top: 6px;">乐 百 氏</span></a></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="  padding: 0;  margin-top:20px;"><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=1" style="text-decoration: none;"><img src="${path }/img/wahaha1.jpg" ><span style="font-size: 18px;margin-top: 6px;">娃 哈 哈</span></a></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="padding: 0;  margin-top:20px;"><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=5" style="text-decoration: none;"><img src="${path }/img/nfsc.jpg" ><span style="font-size: 18px;margin-top: 6px;">农 夫 山 泉</span></a></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin-top:20px;"><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=3" style="text-decoration: none;"><img src="${path }/img/yibao1.jpg" ><span style="font-size: 18px;margin-top: 6px;">怡 宝</span></a></div>
					
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin-top:20px;" ><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=8" style="text-decoration: none;"><img src="${path }/img/binglu.jpg" ><span style="font-size: 18px;margin-top: 6px;">冰 露</span></a></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="  padding: 0;  margin-top:20px;"><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=6" style="text-decoration: none;"><img src="${path }/img/dnyl.jpg" ><span style="font-size: 18px;margin-top: 6px;">达 能 益 力</span></a></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="padding: 0;  margin-top:20px;"><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=4" style="text-decoration: none;"><img src="${path }/img/quchenshi.jpg" ><span style="font-size: 18px;margin-top: 6px;">屈 臣 氏</span></a></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin-top:20px;"><a  href="${path}/goods/findGoods?g_name&startPage=1&pageSize=12&b_name=2" style="text-decoration: none;"><img src="${path }/img/quechao.jpg" ><span style="font-size: 18px;margin-top: 6px;">雀 巢</span></a></div>
				</div>
			<%-- <div class="row" style="height:202px; padding: 0;margin: 0px -15px " align="center">
					
				</div> --%>
						
						</div>
				
				</div>
		
		
		<%@include file="foot.jsp" %><!-- 静态包含 -->
		<script type="text/javascript">
			 
			$(function(){
				$("#ser").click(function(){
					//$(location).attr('href', "${path}/goods/findGoods?g_name="+$("#st").val());startPage=0&pageSize=12
					var url = "${path}/goods/findGoods?g_name="+$("#st").val()+"&startPage="+1+"&pageSize="+12+"&b_name";
					location.href=url;
				});
				 
			})
		</script>
	</body>
	
</html>