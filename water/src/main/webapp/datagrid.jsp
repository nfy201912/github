<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" charset="utf-8">
	var datagrid;
	$(function(){
		$('#datagrid').datagrid({
			url:'${path}/admin/findAll',
			iconCls:'icon-save',
			pagination:true,
			pageSize:10,
			pageList:[10,20,30,40],
			fit:true,
			fitColumns:false,
			nowarp:false,
			border:false,
			idField:'adm_id',
			checkOnSelect:false,
			selectOnCheck:true,
			sortName:'adm_id',
			sortOrder:'desc',
			toolbar:'#manager_tool',
			loadFilter: pagerFilter,
			columns:[[{
				checkbox:true,
				field:'id',
				
			},{
				title:'编号',
				field:'adm_id',
				width:100
			},
			{
				title:'账号',
				field:'adm_name',
				width:100
			},
			{
				title:'密码',
				field:'adm_password',
				width:100
			},{
				title:'状态',
				field:'adm_status',
				width:100
			}]],
			toolbar:[{
				text:'增加',
				iconCls:'icon-add',
				handler:function(){
					$('#add').dialog({
						closed:false,
						 buttons:[{
						    	text:'保存',
						    	handler:function(){
						    		var adm =  $('#formAdd').serialize();
						    		console.info(adm);
						    		$.post("${path}/admin/add",adm,function(data){
						    			if("success"==data){
						    				$.messager.show({
							    				title:'My Title',
							    				msg:'添加成功!',
							    				timeout:1000,
							    				showType:'slide'
							    			});
						    				$('#datagrid').datagrid('reload'),
								    		$('#add').dialog('close') 
						    			}else{
						    				$.messager.alert('Warning','添加失败');
						    			}
						    				
						    		});
						    		
						    	}
						    },{
						    	text:'退出',
						    	handler:function(){
						    		$('#add').dialog('close')
						    	}
						    }]
					});
					
				}},{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var arr = $('#datagrid').datagrid('getSelections');
					if(arr.length==0){
						$.messager.alert('提示','请选择要删除的数据');
					}else{
						$.messager.confirm("删除确认","你确定要删除选中的数据吗？",function(f){
							if(f){
								var arry = new Array();
								for(i=0;i<arr.length;i++){
									var adm = arr[i];
									console.info(adm)
									arry.push(adm.adm_id);
									//var index = $('#datagrid').datagrid('getRowIndex',arr[i]);
									//console.info(index);
									//$('#datagrid').datagrid('deleteRow',index);
								}
								$("#datagrid").datagrid('clearSelections');
								$.post("${path}/admin/delete",{"array[]":arry,"id":2},function(data){
									
									$('#datagrid').datagrid('reload');
								});
							}
							
							
						});
						
						
					}
					
					
				}
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					
				}
			},{
				text:'查询',
				iconCls:'icon-search',
				handler:function(){
					
				}
			}]
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
alert($('#admin').val())
</script>
<input type="hidden" id="admin" value="${admin }"/>
<div align="center" id="add" class="easyui-dialog" title="管理员新增" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
   
    <form id="formAdd" action="${path}/admin/add" method="post">
    	<table style="margin-top: 20px">
    <tr height="30" >
    	<td>账号：</td><td><input type="text" name="adm_name" /></td>
    </tr>
    <tr height="30">
    	<td>密码：</td><td><input type="password" name="adm_password" /></td>
    </tr>
 	<tr height="50">
    	<td><input type="radio" name="adm_status" value="1"  checked="checked"/>启用</td><td><input type="radio" name="adm_status" value="0" />禁用 </td>
    </tr>
  	
    </table>
    </form>
    

</div>
<div class="easyui-tabs" fit="true" border="false"> 
	
		<table id="datagrid"></table>
		
	
</div>
