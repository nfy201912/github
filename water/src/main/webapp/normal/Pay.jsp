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
<body style="background-color: white;overflow:-Scroll;overflow-x:hidden;" >  
<!--Begin Header Begin-->

<div class="soubg" style="height: 50px;overflow: hidden;">
	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
</div>
<!--End Header End--> 
<!--Begin Menu Begin-->
<div style="width:800px;margin-left: 360px;">
<div  style="width: 800px;">
	
	<div  style="width:800px;border-bottom:2px solid #ff4e00;" >
    	<!--Begin 商品分类详情 Begin-->    
    	<%-- <div class="nav">
        	<a href="${path}/index.jsp"><div class="nav_t" style="width: 120px;" ><h2>首 页</h2></div></a>
            
        </div>   --%>
        <!--End 商品分类详情 End-->                                                     
    	<ul style="margin: 0;">
        	<h2>订 单 支 付</h2>
            
        </ul>
        
    </div>
</div>
<!--End Menu End--> 
<div class="i_bg">
	   
    <div >
    	                    
        <div style="width: 200px;float: left;text-align: center;">
            <div><img src="${path}/img/ZFB.jpg" style="width: 200px;height: 200px;"/>扫码支付</div>
            
            <img class="MagicZoomLoading" width="16" height="16" src="${path}/images/loading.gif" alt="Loading..." />				
        </div>
        
        <div style="float: left;margin-left: 10px;">
        	<div style="overflow:auto;height: 210px;">
        	<table>
            	<p>
            		<c:choose>
            			<c:when test="${orders!=null&&orders.size()>0}">
            			<td>&nbsp;</td><td>&nbsp;</td>
            				<c:forEach items="${orders}" var="order">
            					<tr><td>商品:</td><td>${order.goods.g_name}&nbsp;&nbsp;&nbsp;&nbsp;${order.goods.g_price}&nbsp;x&nbsp;${order.o_amount}</td><tr/>
            					<tr><td>购买时间:</td><td><fmt:formatDate value="${order.o_createTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td><tr/>
            					<tr><td>订单编号:</td><td>${order.o_number}</td><tr/>
            					<input type="hidden" name="yf" value="${order.o_freight}"/>
            					<input type="hidden" name="oid" value="${order.o_id}"/>
            				</c:forEach>
            			</c:when>
            			<c:otherwise>
            			
            			</c:otherwise>
            		</c:choose>
            	</p>
              </table>
            </div>
                       
        </div>    
        <div style="position:absolute;right: 400px;top: 120px;">
      
        (含运费:<b id="yf" style="color: #ff4e00;"></b>元)<b style="color: #ff4e00;font-size: 24px;">${totalPrice}</b>元
        </div>
      
        
    </div>
   </div> 
    	<div style="margin: 50px 0px 160px 0px;">
            	<div style="margin-bottom: 10px;">
            		<span style="font-size: 16px;">支付宝支付密码:</span>
            		<input type="password" name="pwd" id="pwd"/>&nbsp;&nbsp;&nbsp;<a href="https://auth.alipay.com/login/index.htm"><b style="color: #00AAEE">忘记密码？</b></a><br/>
            		<b style="color: #B2B2B2">请输入6位数字密码</b>
            	</div>
                <span class="fl"><a id="pay"><img src="${path}/images/paysure.jpg" /></a></span>
            </div> 
       
           </div>
           
           <div style="position: absolute;bottom: 0px;width: 100%;">
           	<%@include file="../foot.jsp" %><!-- 静态包含 -->
           </div>
	<form id="payForm" action="${path}/order/update" method="post"> 
		<input type="hidden" name="o_status" value="已支付"/>
		<input type="hidden" id="ary" name="array[]"/>
		
	</form>
</body>

<script src="js/ShopShow.js"></script>
<script type="text/javascript">
	$(function(){
		var yf = 0;
		$('input[name="yf"]').each(function(){
			yf+=parseFloat($(this).val());
		})
		$('#yf').html(yf);
		$('#pay').click(function(){
		var array = [];
		$('input[name="oid"]').each(function(){
			array.push($(this).val());
		});
		$('#ary').val(array);
		$('#payForm').submit();
		});
	})
</script>
</html>
