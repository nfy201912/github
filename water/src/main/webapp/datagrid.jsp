<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	var datagrid;
	$(function(){
		$('#datagrid').datagrid({
			url:'${path}/admin/findAll',
			
			iconCls:'icon-save',
			pagination:true,
			pageSize:2,
			pageList:[2,4,8,12],
			fit:true,
			fitColumns:false,
			nowarp:false,
			border:false,
			idField:'id',
			checkOnSelect:true,
			selectOnCheck:true,
			sortName:'data',
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
					
				}
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					
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

</script>
<div class="easyui-tabs" fit="true" border="false">
	
		<table id="datagrid"></table>
		
	
</div>