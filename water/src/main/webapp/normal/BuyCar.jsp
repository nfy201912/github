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
        	
            <li><a href="${path}/goods/findGoods?g_name&b_name&startPage=1&pageSize=12">商品</a></li>
            
        </ul>
        
    </div>
</div>
<!--End Menu End--> 
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="${path}/images/img1.jpg" />        
    </div>
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    <form action="${path}/goods/">
    	<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          <tr>
            <td class="car_th" width="490">商品名称</td>
            <td class="car_th" width="140">品牌</td>
            <td class="car_th" width="150">种类</td>
            <td class="car_th" width="140">购买数量</td>
            <td class="car_th" width="130">小计</td>
            <td class="car_th" width="150">操作</td>
          </tr>
          <c:choose>
          	<c:when test="${buyCars!=null&&buyCars.size()>0}">
          	<c:forEach items="${buyCars}" var="buyCar" varStatus="status">
          <tr>
            <td>
            <label class="r_rad" style="margin-top: 24px;"><input type="checkbox" id="${buyCar.goods.g_id}" value="${buyCar.bc_id}" name="del"/ onclick="on('${buyCar.goods.g_id}',null)"></label>
            	<div class="c_s_img"><img src="${path}${buyCar.goods.g_imgUrl}" width="73" height="73" /></div>
               ${buyCar.goods.g_name}
            </td>
            <td align="center">${buyCar.goods.brand.b_name}</td>
            <td align="center">${buyCar.goods.category.c_name}</td>
            <td align="center">
            	<div class="c_num">
                    <input type="button" value="" onclick="jianUpdate1(jq(this)),cg(0,'${buyCar.goods.g_id}','${buyCar.goods.g_price}');" class="car_btn_1" />
                	<input type="text" value="${buyCar.buyNum}" id="num${buyCar.goods.g_id}" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" onblur="nc('${buyCar.goods.g_id}','${buyCar.goods.g_price}','${buyCar.buyNum}')" class="car_ipt" />  
                    <input type="button" value="" onclick="addUpdate1(jq(this)),cg(1,'${buyCar.goods.g_id}','${buyCar.goods.g_price}');" class="car_btn_2" />
                </div>
            </td>
            <td align="center" style="color:#ff4e00;">&nbsp;&nbsp;&nbsp;￥<span style="float:right;padding-right: 30px;" id="price${buyCar.goods.g_id}" name="price">${buyCar.goods.g_price*buyCar.buyNum}</span></td>
            <td align="center"><a onclick="del('${buyCar.goods.g_id}',this),ShowDiv('MyDiv','fade')">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
          </tr>
          	</c:forEach>
          		 <tr height="70">
          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
            	<label class="r_rad"><input type="checkbox" name="clear" /></label><label class="r_txt">清空购物车</label><label class="r_txt"><input type="button" value="确认删除" style="cursor: pointer" onclick="ShowDiv('MyDiv2','fade')" /></label>
                <span class="fr">商品总价：<b style="font-size:22px; color:#ff4e00;">￥</b><b style="font-size:22px; color:#ff4e00;" id="total">0</b></span>
            </td>
          </tr>
          <tr valign="top" height="150">
          	<td colspan="6" align="right">
            	<a href="${path}/goods.jsp"><img src="${ path}/images/buy1.gif" /></a>&nbsp; &nbsp; <a id="paySure" onclick="paysure()"><img src="${ path}/images/buy2.gif" /></a>
            </td>
          </tr>
          	</c:when>
          	<c:otherwise>
          		<tr height="300"><td colspan="6" align="center"><span style="font-size: 18px;">空 空 如 也. . .</span></td></tr>
          	</c:otherwise>
          </c:choose>
          
           
        </table>
    
    </form>
    	<form id="payForm" action="${path}/goods/paySure" method="post">
    	<input type="hidden" id="car" name="list"/>
    	<input type="hidden" id="tp" name="totalPrice"/>
        </form>
    </div>
	<!--End 第一步：查看购物车 End--> 
    
    
    <!--Begin 弹出层-删除商品 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="${path}/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a class="b_sure" onclick="delsure(true,false)">确定</a><a href="#" class="b_buy" onclick="CloseDiv('MyDiv','fade'),delsure(false)">取消</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    
    <div id="MyDiv2" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="${path}/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a class="b_sure" onclick="delsure(true,true)">确定</a><a href="#" class="b_buy" onclick="CloseDiv('MyDiv','fade'),delsure(false)">取消</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-删除商品 End-->
    
    
    <!--Begin Footer Begin -->
   <%@include file="../foot.jsp" %><!-- 静态包含 -->

</body>
<script type="text/javascript">
	var totalPrice = 0;
	/* $('span[name="price"]').each(function(){
		totalPrice +=parseFloat($(this).html());
	}); */
	$('#total').html(totalPrice);
	function total(){//计算总金额
		totalPrice = 0;
		$('span[name="price"]').each(function(){
			totalPrice +=parseFloat($(this).html());
		});
		$('#total').html(totalPrice);
	}

function nc(i,price,num){
	//onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" 只能输入正整数
	var n = "#num"+i;
	var p = "#price"+i;
	/* if(""!=$(n).val()&&$(n).val()<1){
		alert("数量不能小于1");
		$(n).val(num);
		$(p).html(parseFloat(price*num));
		return;
	} */
	var oldp =parseFloat($(p).html()); 
	if(""==$(n).val()){
		$(n).val(num);
		$(p).html(parseFloat(price*num));
		
	}
	
	
	cg(2,i,price);
	on(i,oldp);
}
function on(id,oldp){
	var totalp = parseFloat($('#total').html());
	var n = "#num"+id;//数量
	var p = "#price"+id;
	var obj = "#"+id;
	var nowp = parseFloat($(p).html());//当前金额
	if(oldp!=null){
		totalp = totalp - oldp;
	}
	if($(obj).prop("checked")){

		totalp+=nowp;
		
	}else{
		if(totalp<=0){
			return;
		}
		totalp = totalp - nowp;
	}
	
	$('#total').html(totalp);
}
var f = false;
function cg(flag,i,price){
	var totalp = parseFloat($('#total').html());
	var n = "#num"+i;//数量
	var p = "#price"+i;//价格
	var d = "#"+i;//复选框
	var nowp = parseFloat($(p).html());//当前金额
	$(p).html(parseFloat($(n).val()*price));
	if($(d).prop("checked")){
		if(1==flag){
			totalp = totalp+parseFloat(price);
			
		}
	    if(0==flag){
	    	
			if(nowp>price){
				totalp-=parseFloat(price);
				
			}
			
		}
		$('#total').html(totalp);
	}
}
var bc_id = null;
var ob = null;
var u_id = '${u.u_id}';
function del(id,obj){
	bc_id = id;
	ob = obj;
}
$('input[name="clear"]').click(function(){//清空按钮
	if($(this).prop("checked")){
		total();
		$('input[name="del"]').each(function(){
			
				$(this).prop("checked",true);
			
		});
	}else{
		$('#total').html(0);
		$('input[name="del"]').each(function(){
			
			$(this).prop("checked",false);
		
	});
	}
})

function delsure(flag,multiple){
	var data = [];
	 if(flag){
		 if(multiple){//多选删除
				$('input[name="del"]').each(function(){
					if($(this).prop("checked")){
						data.push($(this).attr("id"));
						$(this).parent().parent().parent().remove();//删除选中行
					}
				});
				 $('#MyDiv2').hide();
			}else{//直接单击删除
				$(ob).parent().parent().remove();
				
				data.push(bc_id);
			}
		 $('#MyDiv').hide();
		 $('#fade').hide();
		  $.post("${path}/goods/del",{"array[]":data,"u_id":u_id},function(data){
			if("success"==data){
				total();//重新计算总金额
			}else{
				alert("删除失败")
			}
		})  
	}
}
/* 确认结算 */
function paysure(){
	
	var n = "#num";//数量
	var totalPrice = parseFloat($('#total').html());
	var list = [];
	var buyCar =  {};
	$('input[name="del"]').each(function(){
		if($(this).prop("checked")){
			n = "#num";//数量
			n =  n+$(this).attr("id");
			buyCar = {"buyNum":$(n).val(),"bc_id":$(this).val()};
			list.push(buyCar);
		}
});	
	
	if(list!=null&&list.length>0){
		list = JSON.stringify(list);
		$('#car').val(list);
		$('#tp').val(totalPrice);
		$('#payForm').submit();
		
	}else{
		alert("请选择要结算商品")
	}
	
}
</script>

</html>
