<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
        	<h2>订 单 详 情</h2>
            
        </ul>
        
    </div>
</div>
<!--End Menu End--> 
<div class="i_bg">
	   
    <div class="content">
    	                    
        <div id="tsShopContainer">
            <div id="tsImgS"><a href="${path}${order.goods.g_imgUrl}" title="Images" class="MagicZoom" id="MagicZoom"><img src="${path}${order.goods.g_imgUrl}" width="390" height="390" /></a></div>
            
            <img class="MagicZoomLoading" width="16" height="16" src="${path}/images/loading.gif" alt="Loading..." />				
        </div>
        
        <div class="pro_des">
        	<div class="des_name">
            	<p>${order.goods.g_name}</p>
              
            </div>
            <div class="des_price">
            	订单总额：<b>￥${order.o_totalPrice}</b>(含运费:${order.o_freight}元)<br />
              
            </div>
            <div class="des_price">
            	购买数量：
                <b>${order.o_amount}</b>
            </div>
            <div class="des_price">
            	订单状态：
                <b>${order.o_status}</b>
            </div>
           <c:if test="${order.o_status!='交易关闭' }">
            <div class="des_join">
            	
                <span class="fl"><a id="pay"><img src="${path}/images/pay.jpg" /></a></span>
            </div>
           </c:if>
           <c:if test="${order.o_status=='交易关闭' }">
            <div class="des_price">
            	您可选择：
                <a id="buyAgain"><b>再次购买</b></a>
            </div>
           </c:if>            
        </div>    
        
      
        
    </div>
    <div class="content mar_20">
    	
       
            <div class="des_border">
                <div class="des_tit">
                	<ul>
                    	<li class="current">订单信息</li>
                       	
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%;font-size:16px;font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>收货地址：${order.o_address}</td>
                        <td>订单编号：${order.o_number }</td>
                        <td>下单时间：<fmt:formatDate value="${order.o_createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>收货人：${order.o_consignee} </td>
                      </tr>
                      <tr height="50">
                        <td>联系方式：${order.o_cellphone}</td>
                     
                      </tr>
                    </table>                                               
                                            
                        
                </div>
          	</div>  
          	<form id="payForm" action="${path}/order/pay" method="post">
          		<input type="hidden" id="order" name="o_id" value="${order.o_id}"/>
          	</form>
          	<form id="buyAgForm" action="${path}/goods/findGoods" method="post">
          		<input type="hidden"  name="g_name" value="${order.goods.g_name}" />
          		<input type="hidden"  name="b_name" value="" />
          		<input type="hidden"  name="startPage" value="1" />
          		<input type="hidden"  name="pageSize" value="12" />
          	</form>
	<%@include file="../foot.jsp" %><!-- 静态包含 -->
</body>

<script src="js/ShopShow.js"></script>
<script type="text/javascript">
	$(function(){
		$("#pay").click(function(){
			 $('#payForm').submit();
		});
		$('#buyAgain').click(function(){
			$('#buyAgForm').submit();
		});
	})	
</script>
</html>
