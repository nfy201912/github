<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" charset="utf-8">
	var datagrid;
	$(function(){
		$('#orderDataGrid').datagrid({
			url:'${path}/order/findAll',
			queryParams:{"startTime":null,"endTime":null},
			pagination:true,
			pageSize:20,
			pageList:[20,40,80],
			fitColumns:false,
			rownumbers:true,
			nowarp:false,
			border:false,
			idField:'o_id',
			checkOnSelect:true,
			selectOnCheck:true,
			sortName:'o_id',
			sortOrder:'desc',
			toolbar:'#manager_tool',
			loadFilter: pagerFilter,
			columns:[[{
				checkbox:true,
				field:'id',
				
			},
			{
				title : '商品图片',
				field : 'goods',
				width : 80,
				formatter : function(value, row, index) {
					if (row.goods.g_imgUrl != null) {
						value = "<img style='width:80px;height:50px;' border='1' src='"+row.goods.g_imgUrl+"'/>";
						return value;
					}

				}
			},
			{
				title:'订单编号',
				field:'o_number',
				width:118,
				align:'center'
			},{
				title:'下单时间',
				field:'o_createTime',
				width:160,
				align:'center'
			},{
				title:'收货人',
				field:'o_consignee',
				width:80,
				align:'center'
			},{
				title:'收货地址',
				field:'o_address',
				width:248,
				align:'center'
			},{
				title:'联系方式',
				field:'o_cellphone',
				width:110,
				align:'center'
			},{
				title:'订单状态',
				field:'o_status',
				width:80,
				align:'center'
			},{
				title:'支付方式',
				field:'o_paymentMethod',
				width:80,
				align:'center'
			},{
				title:'支付时间',
				field:'o_payTime',
				width:160,
				align:'center'
			},{
				title:'成交时间',
				field:'o_dealTime',
				width:160,
				align:'center'
			},{
				title:'商品总数',
				field:'o_amount',
				width:80,
				align:'center'
			},{
				title:'运费',
				field:'o_freight',
				width:50,
				align:'center'
			},{
				title:'订单总额',
				field:'o_totalPrice',
				width:100,
				align:'center'
			}]],
			toolbar:[{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var arr = $('#orderDataGrid').datagrid('getSelections');
					if(arr.length==0){
						$.messager.alert('提示','请选择要删除的数据');
					}else{
						$.messager.confirm("删除确认","你确定要删除选中的数据吗？",function(f){
							if(f){
								var gb = "交易关闭";
								var wc = "交易完成";
								var arry = new Array();
								for(i=0;i<arr.length;i++){
									var order = arr[i];
									if(order.o_status!=gb&&order.o_status!=wc){
										$.messager.alert('提示','所选数据交易进行中，不能删除');
										return;
									}
									arry.push(order.o_id);
									
								}
								
								$.post("${path}/order/delete",{"array[]":arry},function(data){
									//console.log(data)
									if("success"==data){
										$.messager.show({
						    				title:'提示',
						    				msg:'删除成功!',
						    				timeout:1000,
						    				showType:'slide'
						    			});
										$("#orderDataGrid").datagrid('clearSelections');
										$('#orderDataGrid').datagrid('reload');
									}else{
										$.messager.alert('提示',data);
										$("#orderDataGrid").datagrid('clearSelections');
									}
									
								});
							}
							
							
						});
						
						
					}
					
					
				}
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					var arr = $('#orderDataGrid').datagrid('getSelections');
					if(arr.length==0){
						$.messager.alert('提示','请选择要编辑的数据');
					}else if(arr.length>1){
						$.messager.alert('提示','编辑不能多选');
					}else{
						$('#edito_h').show();
						var o_id =arr[0].o_id;
						//console.info(arr[0].adm_id);
						 $('#edito').dialog({
							width:600,
							height:260,
							closed:false,
							buttons:[{
								text:'保存',
								handler:function(){
									 
										$('#formEdito').form('submit',{
											url:'${path}/order/edit',
											success:function(data){
												
												if("success"==data){
													$('#edito').dialog('close');
													$('#orderDataGrid').datagrid('reload');
													$("#orderDataGrid").datagrid('clearChecked');
													$.messager.show({
									    				title:'提示',
									    				msg:'修改成功!',
									    				timeout:1000,
									    				showType:'slide'
									    			});
												}else{
													$.messager.alert('提示',data);
												}
												
											}
										});
									
								}
							},{
								text:'退出',
								handler:function(){
									$("#orderDataGrid").datagrid('clearChecked');
									$('#edito').dialog('close');
									$('#edito_h').hide();
								}
							}]
						}); 
						 $('#formEdito').form('load','${path}/order/loadById?o_id='+o_id);//加载选中数据
						 
						 
					}
				}
			}]
		});
		
		$('#ocz').click(function(){
			$('#searchForm').form('reset')
		});
		$('#osearch').click(function(){	
			$('#orderDataGrid').datagrid('load',{
				'o_number':$('#num').val(),
				'o_status':$("#st option:selected").val(),
				'startTime':$('#startT').val(),
				'endTime':$('#endT').val()
			});
		});
		$('#fh').click(function(){
			$.post("${path}/order/deliver",null,function(data){
				if("success"==data){
					$.messager.show({
	    				title:'提示',
	    				msg:'发货成功!',
	    				timeout:1000,
	    				showType:'slide'
	    			});
					$('#searchForm').form('reset');
					$('#orderDataGrid').datagrid('reload');
				}else{
					$.messager.alert("提示","发货失败");
				}
			});
		});
	});
	
	//分页实现
	function pagerFilter(data) {  
	    if (typeof data.length == 'number' && typeof data.splice == 'function') {  
	    	//typeof判断变量类型的，12是数字，所以输出的结果是number
	        data = {  
	            total: data.length,  
	            rows: data  
	        }  
	    }  
	    var dg = $(this);  
	    var opts = dg.datagrid('options');  //返回参数对象
	    var pager = dg.datagrid('getPager');  
	    pager.pagination({  
	        onSelectPage: function (pageNum, pageSize) {  
	            opts.pageNumber = pageNum;  
	            opts.pageSize = pageSize;  
	            pager.pagination('refresh', {  
	                pageNumber: pageNum,  
	                pageSize: pageSize  
	            });  
	            dg.datagrid('loadData', data);  
	        }  
	    });  
	    if (!data.originalRows) {  
	        if(data.rows)  
	            data.originalRows = (data.rows);  
	        else if(data.data && data.data.rows)  
	            data.originalRows = (data.data.rows);  
	        else  
	            data.originalRows = [];  
	    }  
	    var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);  
	    var end = start + parseInt(opts.pageSize);  
	    data.rows = (data.originalRows.slice(start, end));  
	    return data;  
	}    
	
</script>
<div align="center" id="edito" class="easyui-dialog" title="订单编辑" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
    <div id="edito_h" style="display: none">
    	   <form id="formEdito"  method="post">
    	<table style="margin-top: 20px">
    	<input type="hidden" name="o_id" />
    <tr height="50" >
    	<td align="right">收货人：</td><td><input id="ep" name="o_consignee" class="easyui-textbox" style="width: 80px;text-align: center"   data-options="required:true" />&nbsp;&nbsp;&nbsp;&nbsp;联系方式： <input id="ephone" name="o_cellphone" class="easyui-textbox" style="width: 100px;"   data-options="required:true" />&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	<td align="right">订单状态：</td><td><select id="esta"  name="o_status" class="easyui-combobox" editable="false" style="width: 120px;" data-options="required:true">	
   			<option value="未付款">未付款</option>
   			<option value="已支付">已支付</option>
   			<option value="正在派送">正在派送</option>
   			<option value="交易关闭">交易关闭</option>
   			<option value="交易完成">交易完成</option>
    	</select></td>
    </tr>
    <tr height="50">
    	<td align="right">收货地址：</td><td><input id="eadr"  name="o_address" style="width: 260px;" class="easyui-textbox"  data-options="required:true" /></td>
    	
    </tr>
  	
    </table>
    </form>
    </div>
</div>
			<form id="searchForm" action="${path}/order/findAll" method="post">
			<table style="padding: 10px;">
				<tr>
					<td>订单编号:</td><td><input type="text" class="easyui-textbox" id="num" name="o_number" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>订单状态:</td><td>
					<select class="easyui-combobox" editable="false" id="st" name="o_status" style="width:120px;">
   					 <option value=""></option>		
   					 <option value="未付款">未付款</option>
   					 <option value="已支付">已支付</option>
   					 <option value="正在派送">正在派送</option>
   					 <option value="交易关闭">交易关闭</option>
   					 <option value="交易完成">交易完成</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>订单时间段:&nbsp;从</td><td><input type="text" style="width: 120px;" class="easyui-datebox" editable="false" id="startT" name="startT" value=""/></td>
					<td>&nbsp;到</td><td><input type="text" style="width: 120px;" class="easyui-datebox" editable="false" id="endT" name="endT" value=""/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="osearch" class="easyui-linkbutton" data-options="iconCls:'icon-search'"style="width: 80px">搜 索</a>&nbsp;&nbsp;
					<a id="ocz" class="easyui-linkbutton" style="width: 80px">重 置</a></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="fh" class="easyui-linkbutton" style="width: 90px">一 键 发 货</a></td>
				</tr>
			</table>
			</form>
		<table id="orderDataGrid" style="width:1566px;"></table>
		
	

