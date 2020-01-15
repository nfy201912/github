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
		<link rel="stylesheet" type="text/css" href="${path }/css/mybootstrap.css"/>
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
<body>
		<div class="container" >
		<div class="row" style="float: right;margin-top:20px; padding: 0" >
			
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="padding: 0" align="right">
			<c:if test="${user==null}">
				<a  href="${path }/login.jsp">登入</a>|<a  href="${path }/Register.jsp">注册</a>
			</c:if>
			<c:if test="${user!=null}">
				<span>欢 迎 您 ！[${user.u_username}]</span><a  href="${path }/login.jsp">切换账号</a>&nbsp|&nbsp<a  href="${path }/Register.jsp">注册</a>&nbsp|&nbsp<a href="${path}/user/exit">退出</a>
			</c:if>
			
			
			</div>
		</div>
		
			<div class="row" id="rowheader" style="height: 50px;">
				<div class="col-md-3 col-lg-3 col-sm-4 " style="margin-bottom: 50px"><a class="navbar-brand"  href="index.jsp"><h2>校园送水${admin }</h2></a></div>
				<div class="col-md-3 col-lg-3 col-sm-3" style="margin-top: 33px" ><div class="dropdown" >
	<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    选择校区
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">东合校区</a></li>
    <li><a href="#">澄碧校区</a></li>
   
    <li role="separator" class="divider"></li>
    <li><a href="#">更多</a></li>
  </ul>
</div></div>
				
				
			</div>
			
			<div class="row" style="padding: 0">
				<div class="col-md-12 col-lg-12 col-sm-12 col-xs-8" style="padding: 0" align="right">
					<form class="navbar-form navbar-right" role="search">
	<!-- <div class="col-sm-4 col-xs-4" style="margin: 0;padding: 0 2px"> -->
    <input type="text" class="form-control" placeholder="Search">
<!-- </div> -->
 
 <button type="submit" class="btn btn-default">搜索</button>

  

</form>
				</div>
			</div>
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
									<li><a href="#home">首页 <span class="sr-only">(current)</span></a></li>
									<li><a href="#bbs">论坛</a></li>
									<li><a href="">送水员</a></li>
									<li><a href="">桶装水</a></li>
									
									<li><a href="">联系我们</a></li>
									
								</ul>
								
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
						<div class="row" style="padding: 8px 14px">
							<span>商品 >></span>
						</div>
						
						<div class="row" style="padding: 20px;background-color: #c9e9f9;">
							<div class="row" style="height:202px; padding: 0;margin: 5px -15px" align="center">
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin:0" ><img src="${path }/img/lebaishi1.jpg"  ><span>商品 >></span></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="  padding: 0;  margin:0"><img src="${path }/img/wahaha1.jpg" ><span>商品 >></span></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="padding: 0;  margin:0"><img src="${path }/img/nfsc.jpg" ><span>商品 >></span></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin:0"><img src="${path }/img/yibao1.jpg" ><span>商品 >></span></div>
				</div>
			<div class="row" style="height:202px; padding: 0;margin: 5px -15px " align="center">
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin:0" ><img src="${path }/img/binglu.jpg" ><span>商品 >></span></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="  padding: 0;  margin:0"><img src="${path }/img/dnyl.jpg" ><span>商品 >></span></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style="padding: 0;  margin:0"><img src="${path }/img/quchenshi.jpg" ><span>商品 >></span></div>
					<div class="col-md-4 col-lg-3 col-sm-6 col-xs-6" style=" padding: 0; margin:0"><img src="${path }/img/quechao.jpg" ><span>商品 >></span></div>
				</div>
						
						</div>
				
				</div>
		
		
		<div id="foot"  class="container-fluid" style="background-color:">
			<div id="foot1" class="row" style="background: #c9e9f9" >
				<div class="col-md-3 col-lg-3 col-sm-3 col-xs-3">1313</div>
				<div class="col-md-3 col-lg-3 col-sm-3 col-xs-3">1313</div>
				<div class="col-md-3 col-lg-3 col-sm-3 col-xs-3">1313</div>
				<div class="col-md-3 col-lg-3 col-sm-3 col-xs-3">1313</div>
			</div>
			<div class="row" id="foot2" >
				<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">版权</div>
			</div>
		</div>
		
	</body>
	
</html>