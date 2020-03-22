<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }" />     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${path}/css/style.css" />
<script src="${path }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${path}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${path}/js/menu.js"></script>    
	<script type="text/javascript" src="${path}/js/select.js"></script>
	<script type="text/javascript" src="${path}/js/shade.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="soubg" style="height: 50px;overflow: hidden;">
	<jsp:include page="${path}/head.jsp"  flush="true"/><!--动态包含  -->
</div>
<div class="m_top_bg">
    <div class="top">
        
        <div class="m_search">
            <form>
                <input type="text" value="" class="m_ipt" />
                <input type="submit" value="搜索" class="m_btn" />
            </form>                      
      
        </div>
        
    </div>
</div>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<div class="m_left">
        	<div class="left_n">管理中心</div>
            <div class="left_m">
            	<div class="left_m_t t_bg1">订单中心</div>
                <ul>
                	<li><a href="Member_Order.html" class="now">我的订单</a></li>
                    <li><a href="Member_Address.html">收货地址</a></li>
                    <li><a href="#">缺货登记</a></li>
                    <li><a href="#">跟踪订单</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg2">会员中心</div>
                <ul>
                	<li><a href="Member_User.html">用户信息</a></li>
                    <li><a href="Member_Collect.html">我的收藏</a></li>
                    <li><a href="Member_Msg.html">我的留言</a></li>
                    <li><a href="Member_Links.html">推广链接</a></li>
                    <li><a href="#">我的评论</a></li>
                </ul>
            </div>
            
        </div>
		<div class="m_right">
            <p></p>
            <div class="mem_tit">我的订单</div>
            <form id="orderForm" action="${path}/order/findAll?u_id=${u.u_id}" method="post">
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
              <c:choose>
              	<c:when test="${orders!=null}">
              	<tr>         
              	<td width="10%">商品图片</td>                                                                                                                                           
                <td width="20%">订单号</td>
                <td width="25%">下单时间</td>
                <td width="15%">订单总金额</td>
                <td width="10%">订单状态</td>
                <td width="20%">操作</td>
              </tr>
              <c:forEach items="${orders}" var="order">
              <tr>
              <td><img src="${path}${order.goods.g_imgUrl}" style="width:100%;height: 50px;"/></td>
                <td><font color="#ff4e00">${order.o_number}</font></td>
                <td><fmt:formatDate value="${order.o_createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>￥${order.o_totalPrice}</td>
                <td id="${order.o_id}">${order.o_status}<c:if test="${order.o_status =='未付款'}"><br/>(<a name="pay"><b>立即支付</b></a>)</c:if></td>
                <td><c:if test="${order.o_status=='交易关闭' or order.o_status=='交易完成'}" ><a id="sc${order.o_id}" onclick="del('${order.o_id}',this)" >删除订单</a></c:if>
                <c:if test="${order.o_status!='交易关闭'&&order.o_status!='已支付'&&order.o_status!='正在派送'&&order.o_status!='交易完成'}"><a id="qx${order.o_id}" onclick="cancel('${order.o_id}'),ShowDiv('MyDiv','fade')" >取消订单</a></c:if>
                <c:if test="${order.o_status=='已支付'}"><a>申请退换</a></c:if>
                 <c:if test="${order.o_status=='正在派送'}"><a id="sh${order.o_id}" onclick="sure('${order.o_id}')">确认收货</a></c:if>
                <a id="sc${order.o_id}" onclick="del('${order.o_id}',this)" style="display: none">删除订单</a>
                &nbsp;|&nbsp;<a href="${path}/order/load?o_id=${order.o_id}">订单详情</a></td>
                
              </tr>
              </c:forEach>
             	
              	</c:when>
              	<c:otherwise>
              	<tr ><td align="center"><span style="font-size: 24px;">空 空 如 也. . .</span></td></tr>
              	</c:otherwise>
              </c:choose>
              
              
            </table>
            </form>
        </div>
    </div>
	<!--End 用户中心 End--> 
    <!--Begin Footer Begin -->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="${path}/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top" height="50">
                    <td align="center">您确定要取消该订单吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a id="sure" class="b_sure" onclick="sure(''),CloseDiv('MyDiv','fade')">确定</a><a class="b_buy" onclick="CloseDiv('MyDiv','fade')">取消</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    
    <div class="btmbg">
		   	<%@include file="../foot.jsp" %><!-- 静态包含 -->
    </div>
    <form id="payForm" action="${path}/order/pay" method="post" >
    	<input type="hidden" name="o_id" id="oid"/>
    </form>
    <!--End Footer End -->    
</div>

</body>
<script type="text/javascript">
	var oid;
	function cancel(o_id){
		oid = o_id;
	}
	 function sure(id){
		 var status;
		 var o_id;
		 if(id!=""){
			 status = "交易完成";
			 o_id = id;
		 }else{
			 status = "交易关闭";
			 o_id = oid;
		 }
		$.post("${path}/order/updateOne",{"o_id":o_id,"o_status":status},function(data){
			if("success"==data){
				var id = "#"+o_id;
				var qx = "#qx"+o_id;
				var sc = "#sc"+o_id;
				var sh = "#sh"+o_id;
				$(id).html(status);
				$(qx).hide();
				$(sh).hide();
				$(sc).show();
			}else{
				alert("操作失败")
			}
		})
	} 
	
	function del(o_id,obj){
		var ary = [];
		ary.push(o_id);
		$.post("${path}/order/delete",{"array[]":ary},function(data){
			if("success"==data){
				$(obj).parent().parent().remove();
			}else{
				alert("删除失败")
			}
		})
	}
	
	$(function(){
		$('a[name="pay"]').click(function(){
			var id =$(this).parent().attr("id");
			$('#oid').val(id);
			$('#payForm').submit();
		});
	})
	
</script>
</html>
