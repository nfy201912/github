<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
		 <link rel="stylesheet" type="text/css" href="${path }/css/mybootstrap.css?v=<%= System.currentTimeMillis()%>" charset="utf-8"/>
		
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
   <script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../js/menu.js"></script>    
            
	<script type="text/javascript" src="../js/lrscroll_1.js"></script>   
     
    
	<script type="text/javascript" src="../js/n_nav.js"></script>
    
    <link rel="stylesheet" type="text/css" href="../css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="../css/MagicZoom.css" />
    
    <script type="text/javascript" src="../js/MagicZoom.js"></script>
    
    <script type="text/javascript" src="../js/num.js">
    	var jq = jQuery.noConflict();
    </script>
        
    <script type="text/javascript" src="../js/p_tab.js"></script>
    
    <script type="text/javascript" src="../js/shade.js"></script>
    
<title>水站</title>
</head>
<body style="background-color: white;">  
<!--Begin Header Begin-->

<div class="soubg" style="height: 50px;overflow: hidden;">
	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
</div>
<!--End Header End--> 
<!--Begin Menu Begin-->
<div class="menu_bg">
	
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<%-- <div class="nav">
        	<a href="${path}/index.jsp"><div class="nav_t" style="width: 120px;" ><h2>首 页</h2></div></a>
            
        </div>   --%>
        <!--End 商品分类详情 End-->                                                     
    	<ul class="menu_r" style="margin: 0;">
        	<li><a href="${path}/index.jsp">首 页</a></li>
            <li><a href="${path}/goods.jsp">商品</a></li>
            
        </ul>
        
    </div>
</div>
<!--End Menu End--> 
<div class="i_bg">
	   
    <div class="content">
    	                    
        <div id="tsShopContainer">
            <div id="tsImgS"><a href="${path}${good.g_imgUrl}" title="Images" class="MagicZoom" id="MagicZoom"><img src="${path}${good.g_imgUrl}" style="width:400px;height: 360px;" /></a></div>
            
            <img class="MagicZoomLoading" width="16" height="16" src="${path}/images/loading.gif" alt="Loading..." />				
        </div>
        
        <div class="pro_des">
        	<div class="des_name">
            	<p>${good.g_name}</p>
              
            </div>
            <div class="des_price">
            	价格：<b>￥${good.g_price}</b><br />
              
            </div>
            <div class="des_choice">
            	<span class="fl">型号：</span>
                <ul>
                	<li class="checked">18.9L<div class="ch_img"></div></li>
                  
                </ul>
            </div>
           
           
            <div class="des_join" style="margin-top: 110px;">
            	<div class="j_nums">
                	<input id="num" type="text" value="1" name="" class="n_ipt" />
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1" />
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" />   
                </div>
                <span class="fl"><a id="add"><img src="${path}/images/j_car.png" /></a></span>
            </div>            
        </div>    
        
      
        
    </div>
    <div class="content mar_20">
    	
       
            <div class="des_border">
                <div class="des_tit">
                	<ul>
                    	<li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                        <li><a href="#p_comment">商品评论</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>商品名称：迪奥香水</td>
                        <td>商品编号：1546211</td>
                        <td>品牌： 迪奥（Dior）</td>
                        <td>上架时间：2015-09-06 09:19:09 </td>
                      </tr>
                      <tr>
                        <td>商品毛重：160.00g</td>
                        <td>商品产地：法国</td>
                        <td>香调：果香调香型：淡香水/香露EDT</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>容量：1ml-15ml </td>
                        <td>类型：女士香水，Q版香水，组合套装</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>                                               
                                            
                        
                </div>
          	</div>  
	<%@include file="foot.jsp" %><!-- 静态包含 -->
</body>

<script src="js/ShopShow.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		$('#add').click(function(){
			var good = {"g_id":"${good.g_id}"};
			var user = {"u_id":"${u.u_id}"};
			var data = {"goods":good,"user":user,"buyNum":$('#num').val()};
			var dd = [];
			dd.push(data);
			console.log(dd)
			 if(""!='${u}'){
				$.post("${path}/goods/addc",{"data":JSON.stringify(dd)},function(data){
					alert(data);
				});
			}else{
				alert("请先登入")
			} 
			
		});
	});
</script>
</html>
