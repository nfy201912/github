<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${path}/css/style.css" />
     <link rel="stylesheet" type="text/css" href="${path }/css/mybootstrap.css?v=<%= System.currentTimeMillis()%>" charset="utf-8"/>
    <script type="text/javascript" src="${path}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${path}/js/menu.js"></script>    
    <script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"/>            
	<script type="text/javascript" src="${path}/js/n_nav.js"></script>   
    
    <script type="text/javascript" src="${path}/js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    
    <script type="text/javascript" src="${path}/js/shade.js"></script>
       
<title>购物车</title>
</head>
<body>  
<div class="soubg" style="height: 50px;overflow: hidden;">
	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
</div>
<!--End Header End--> 
<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<a href="${path}/index.jsp"><div class="nav_t" style="width: 120px;" ><h2>首 页</h2></div></a>
            
        </div>  
        <!--End 商品分类详情 End-->                                                     
    	<ul class="menu_r">
        	
            <li><a href="${path}/goods.jsp">商品</a></li>
            
        </ul>
        
    </div>
</div>
<!--End Menu End--> 
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="${path}/images/img2.jpg" />        
    </div>
    <!--Begin 第一步：查看购物车 Begin -->
     <div class="content mar_20">
    	<div class="two_bg">
        	<div class="two_t">
            	<span class="fr"></span>商品列表
            </div>
           <form>
    	<table border="0" class="car_tab" style="width:1110px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          
          <tr>
            <td class="car_th" width="280">商品名称</td>
            <td class="car_th" width="140">品牌</td>
            <td class="car_th" width="150">种类</td>
            <td class="car_th" width="140">购买数量</td>
            <td class="car_th" width="100">小计</td>
            
          </tr>
          <c:choose>
          	<c:when test="${buyCars!=null&&buyCars.size()>0}">
          	<c:forEach items="${buyCars}" var="buyCar" varStatus="status">
          <tr>
            <td>
            <c:if test="${status.last}">
            <input type="hidden" name="count" id="count" value="${status.count}"/>
            </c:if>
            
            	<div class="c_s_img"><img src="${path}${buyCar.goods.g_imgUrl}" width="73" height="73" /></div>
               <span id="n${buyCar.goods.g_id}">${buyCar.goods.g_name}</span>
               <input type="hidden" id="p${buyCar.goods.g_id}" value="${buyCar.goods.g_price}"/>
            </td>
            <td align="center">${buyCar.goods.brand.b_name}</td>
            <td align="center">${buyCar.goods.category.c_name}</td>
            <td align="center">
            	<span name="num" id="${buyCar.goods.g_id}">${buyCar.buyNum}</span>
            </td>
            <td align="center" style="color:#ff4e00;"><span style="float:right;padding-right: 30px;" id="price${buyCar.goods.g_id}" name="price" >￥${buyCar.goods.g_price*buyCar.buyNum}</span></td>
        
          </tr>
          	</c:forEach>
          		 <tr height="70">
          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
            	
                <span class="fr">商品总价：￥${totalPrice}</span>
            </td>
          </tr>
         
          	</c:when>
          	<c:otherwise>
          		<tr height="200"><td colspan="6" align="center"><span style="font-size: 18px;">空 空 如 也. . .</span></td></tr>
          	</c:otherwise>
          </c:choose>
          
           
        </table>
    </form>
  
            
            <div class="two_t">
            	<span class="fr"><a onclick="ShowDiv('MyDiv','fade')">修改</a></span>收货人信息
            </div>
            <form >
                   <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tr>
                <td class="p_td" width="160">收货人姓名</td>
                <td width="395"><span id="u_name">${u.u_name}</span></td>
                <td class="p_td" width="160">电子邮件</td>
                <td width="395"><span id="u_email">${u.u_email}</span></td>
              </tr>
              <tr>
                <td class="p_td">详细地址</td>
                <td><%-- <span id="u_address">${u.u_address}</span> --%>
                <select id="xq" title="校区" style="width: 78px;height: 20px;">
                	<option value="" selected="selected">校区</option>
                	<option value="东合校区">东合校区</option>
                	<option value="澄碧校区">澄碧校区</option>
                </select>
                <select id="ssl" title="宿舍楼" style="width: 100px;height: 20px;">                	
                	<option value="" selected="selected">宿舍楼</option>
                </select>
                <select id="lc" title="楼层" style="width:60px;height: 20px;">                	
                	<option value="" selected="selected">楼层</option>
                </select>
                <select id="ss" title="宿舍号" style="width:80px;height: 20px;">                	
                	<option value="" selected="selected">宿舍</option>
                </select>
                </td>
                <td class="p_td">联系号码</td>
                <td><span id="u_phone">${u.u_phone}</span></td>
              </tr>
              
            </table>
            </form>
     

            
            
            
            <div class="two_t">
            	支付方式
            </div>
            <ul id="pm" class="pay">
                <li class="checked" value="YEZF">余额支付<div class="ch_img"></div></li>
                <li value="HDFK">货到付款<div class="ch_img"></div></li>
                <li value="ZFB">支付宝<div class="ch_img"></div></li>
            </ul>
         
            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right">
                	
                    商品总价: <font color="#ff4e00">￥${totalPrice}</font>  + 配送费用: <font color="#ff4e00">￥</font><font color="#ff4e00" id="zyf">0</font>&nbsp;(<font color="#ff4e00">￥</font><font color="#ff4e00" id="yf">0</font>/桶&nbsp;&nbsp;x<b id="amount"></b>)
                </td>
              </tr>
              <tr height="70">
                <td align="right">
                	<b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;" id="tp">￥${totalPrice}</span></b>
                </td>
              </tr>
              <tr height="70">
                <td align="right"><a id="orderSure"><img src="${path}/images/btn_sure.gif" /></a></td>
              </tr>
            </table>

            
        	
        </div>
    </div>
	 
    
    
    <!--Begin 弹出层-修改信息Begin-->    
    <div id="fade" class="black_overlay" ></div>
    <div id="MyDiv" class="white_content" style="width: 630px;">              
        <div class="white_d" style="width: 610px;">
            <div class="notice_t" style="width: 590px;">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="${path}/images/close.gif" /></span>
            </div>
            <div class="notice_c" style="width: 600px;">
           		
                <table border="0" align="center" style="font-size:16px;width: 600px;" cellspacing="0" cellpadding="0">
                  <tr height="50">
                <td class="p_td" width="100" style="text-align: right;">收货人姓名&nbsp;</td><td width="200"><input type="text" id="name" value="${u.u_name }"/></td>
                
                <td class="p_td" width="100" style="text-align: right;">电子邮件&nbsp;</td><td width="200"><input type="text" id="email" value="${u.u_email }"/></td>
                
              </tr>
              <tr height="50">
                <%-- <td class="p_td" style="text-align: right;">详细地址&nbsp;</td><td width="200"><input type="text" id="address" value="${u.u_address }"/></td> --%>
                
                <td class="p_td" style="text-align: right;">联系号码&nbsp;</td><td width="200"><input type="text" id="phone" value="${u.u_phone }"/></td>
                
              </tr height="50">
                  <tr height="50" valign="bottom">
                    <td colspan="4" style="padding-right: 160px;"><a class="b_buy" onclick="CloseDiv('MyDiv','fade')" style="float: right">取消</a><a class="b_sure" style="float: right" onclick="editSure(),CloseDiv('MyDiv','fade')" >确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <form id="sureForm" action="${path}/order/orderSure" method="post">
    	<input type="hidden" name="list" id="order"/>
    	<input type="hidden" name="u_id" id="uid"/>
    	<input type="hidden" name="totalPrice" id="totalP" value=""/>
    	
    </form>
    
   
    
    
    <!--Begin Footer Begin -->
   <%@include file="../foot.jsp" %><!-- 静态包含 -->

</body>
<script type="text/javascript">
$(function(){
	var select = $('#ssl');
	for(var i =1;i<=12;i++){
		var option = $("<option />");
		if(i>=11){
			var j = i-10;
			option.html("教职工宿舍"+j+"栋");
			option.val(i);
			select.append(option);
		}else{
			option.html("学生宿舍"+i+"栋");
			option.val(i);
			select.append(option);
		}
		
	}
	var adr = "";
	var xq  = "";
	var ssl = "";
	var lch = "";
	var ssh = "";
	$("#xq").blur(function(){
		var q = $("#xq option:selected");
		if(q.val()==""){
			xq=q.val();
		}else{
			xq = q.text();
		}
		console.log(xq)
	});
	
	var lc = $('#lc');
	var ss = $('#ss');
	$('#ssl').change(function(){
		lc.empty();//清除option
		var s = $("#ssl option:selected");//获取选中项   s.val()选中项 值+s.text()文本
		if(s.val()==""){
			ssl = s.val();
		}else{
			ssl = s.text();	
		}
		if(s.val()!=""){
			for(var i =1;i<=6;i++){
				var op = $("<option />");
				op.html("第"+i+"层");
				op.val(i);
				lc.append(op);
			}
			
		}else{
			var op = $("<option />");
			op.html("楼层");
			op.val("");
			lc.append(op);
		}
		$('#lc').change();
	})
	var n = 0;	
	$('span[name="num"]').each(function(){
		n += parseInt($(this).html());
	});
	$('#amount').html(n);
	$('#lc').change(function(){
		ss.empty();//清除option
		var s = $("#ssl option:selected");//获取选中项   s.val()选中项 值+s.text()文本
		var lc = $("#lc option:selected");
		lch = lc.text();
		var yf = lc.val();
		if(lc.val()!=""){
			if(yf>2){
				$('#yf').html(yf);
			}else{
				$('#yf').html(2);
			}
			for(var i =1;i<=28;i++){
				var op = $("<option />");
				if(i<10){
					op.html(lc.val()+"0"+i+"宿舍");
				}else{
					op.html(lc.val()+i+"宿舍");
				}
				op.val(i);
				ss.append(op);
			}
		}else{
			$('#yf').html(0);
			var op = $("<option />");
			op.html("宿舍");
			op.val("");
			ss.append(op);
		}
		
		$('#zyf').html(parseFloat($('#yf').html())*n);//总运费
		yf = parseFloat('${totalPrice}')+parseFloat($('#zyf').html());//总额
		$('#tp').html("￥"+yf);
		ssh =$("#ss option:selected").text();
		adr = xq+ssl+lch+ssh;
		
	});
	$("#ss").change(function(){
	ssh =$("#ss option:selected").text();
	});
	/* 支付方式 */
	var pm;
	$('#pm li').each(function(){
		if("checked"==$(this).attr("class")){
			pm = $(this).attr("value");
		}
	});
	$('#pm li').click(function(){
		$(this).siblings('li').removeClass('checked');// 删除其他兄弟元素的样式
		$(this).addClass('checked'); // 添加当前元素的样式
		pm = $(this).attr("value");
	});
	/* 确认订单 */
	$('#orderSure').click(function(){
		adr = xq+ssl+lch+ssh;
		if(xq==""||ssl==""||lch==""||ssh==""){
			alert("请完善地址")
			return;
		}
		var p;
		var n;
		var pr;
		var user ={"u_id":'${u.u_id}'};
		var goods={};
		var order={};
		var list = [];
		$('span[name="num"]').each(function(){
			p = "#price";
			pr = "#p";
			n = "#n";
			p+=$(this).attr('id');
			pr+=$(this).attr('id');
			n+=$(this).attr('id');
			var yf = parseFloat($('#yf').html());
			var fy = parseFloat($('#tp').html().replace("￥",""));//订单总额
			$('#totalP').val(fy);
				goods = {"g_id":$(this).attr('id'),"g_name":$(n).html(),"g_price":$(pr).val()};
				order = {"goods":goods,"user":user,"o_amount":$(this).html(),"o_totalPrice":parseFloat($(p).html().replace("￥",""))+yf*$(this).html(),
						"o_freight":yf*$(this).html(),"o_paymentMethod":pm,"o_address":adr,"o_consignee":$('#u_name').html(),"o_cellphone":$("#u_phone").html()};
				list.push(order);
		});
		list = JSON.stringify(list);
		$('#uid').val('${u.u_id}');
		$('#order').val(list);
		$("#sureForm").submit();
	});
})
	
function editSure(){
	$('#u_name').html($('#name').val());
	$('#u_email').html($('#email').val());
	$('#u_phone').html($('#phone').val());
	
}

</script>

</html>
