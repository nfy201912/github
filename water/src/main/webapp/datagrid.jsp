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
			checkOnSelect:true,
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
					$('#add').dialog('center');
					$('#add').dialog({
						width:400,
						height:260,
						closed:false,
						 buttons:[{
						    	text:'保存',
						    	handler:function(){
						    		$.messager.progress();
						    		$('#formAdd').form('submit',{
						    			url:'${path}/admin/add',
						    			onSubmit:function(){
						    				var isValid =$(this).form('validate');
						    				if(isValid){
						    					var rp = /[^\w\/]/ig;//中文字符以及其他特殊字符							 					
						    					var re = /\s/;//空格
						    					var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
						    					//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
						    					 if(!re.test($('#name').val())&&!pattern.test($('#name').val())){//排除空格和特殊字符
						    						 if(rp.test($('#pwd').val())){
						    							 $.messager.alert('提示','密码只允许输入英文字母、数字');
									    					$.messager.progress('close');
									    					return false;
						    						 }
							    						$.messager.progress('close');
								    					return true;
						    					}else{
						    						$.messager.alert('提示','账号不能包含特殊字符');
							    					$.messager.progress('close');
							    					return false;
						    					}
						    					
						    				}else{
						    					
						    					$.messager.progress('close');
						    					return false;
						    				} 					    
						    			},
						    			success:function(data){
						    				if("success"==data){
						    					$.messager.progress('close');
						    					$.messager.show({
								    				title:'提示',
								    				msg:'添加成功!',
								    				timeout:1000,
								    				showType:'slide'
								    			});
						    					$('#datagrid').datagrid('reload');
						    					$('#add').dialog('close');
						    				}else{
						    					$.messager.progress('close');
						    					$.messager.alert('提示',data);
						    				}
						    				
						    				
						    			}
						    			
						    		});
						    		
						    	}
						    },{
						    	text:'退出',
						    	handler:function(){
						    		$("#formAdd").form('reset');
						    		$('#add').dialog('close');
						    		
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
							
									arry.push(adm.adm_id);
									
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
				text:'编辑',
				iconCls:'icon-edit',
				handler:function(){
					var arr = $('#datagrid').datagrid('getSelections');
					if(arr.length==0){
						$.messager.alert('提示','请选择要编辑的数据');
					}else if(arr.length>1){
						$.messager.alert('提示','编辑不能多选');
					}else{
						var adm_id =arr[0].adm_id;
						
						console.info(arr[0].adm_id);
											
						/* $.post("${path}/admin/load",{"adm_id":adm_id},function(data){
							console.info(data);
							for(ob in data){
								console.info(data.adm_id);
							}
							$('#ename').attr("value",data.adm_name);
							console.info($('#ename').value);
							$('#epwd').value = data.adm_password;
							if(data.adm_status){
								$('#raA').prop("checked",true);
							}else{
								$('#raB').prop("checked",true);
							}
						}); */
						
						//$('#edit').dialog('open');
						 $('#edit').dialog({
							width:400,
							height:260,
							closed:false,
							buttons:[{
								text:'保存',
								handler:function(){
									$('#formEdit').form('submit',{
										url:'${path}/admin/edit',
										success:function(data){
											$.messager.alert("提示",data);
										}
									});
								}
							},{
								text:'退出',
								handler:function(){
									$("#datagrid").datagrid('clearChecked');
									$('#edit').dialog('close');
								}
							}]
						}); 
						 $('#formEdit').form('load','${path}/admin/load?adm_id='+adm_id);//加载选中数据
						 
						 
					}
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
<input type="hidden" id="admin" value="${admin }"/>
<div align="center" id="add" class="easyui-dialog" title="管理员新增" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
   
    <form id="formAdd" action="${path}/admin/add" method="post">
    	<table style="margin-top: 20px">
    <tr height="30" >
    	<td>账号：</td><td><input id="name" name="adm_name" class="easyui-textbox"   data-options="required:true,iconCls:'icon-man'" /></td>
    </tr>
    <tr height="50">
    	<td>密码：</td><td><input id="pwd"  name="adm_password" class="easyui-passwordbox"  data-options="required:true" /></td>
    </tr>
 	<tr height="50">
    	 <td><input type="radio" name="adm_status" value="1"  checked="checked"/>启用</td><td><input type="radio" name="adm_status" value="0" />禁用 </td> 
    </tr>
  	
    </table>
    </form>
    

</div>
<div align="center" id="edit" class="easyui-dialog" title="管理员编辑" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
    <form id="formEdit" action="" method="post">
    	<table style="margin-top: 20px">
    <tr height="30" >
    	<td>账号：</td><td><input id="ename" name="adm_name" class="easyui-textbox"   data-options="required:true,iconCls:'icon-man'" /></td>
    </tr>
    <tr height="50">
    	<td>密码：</td><td><input id="epwd"  name="adm_password" class="easyui-passwordbox"  data-options="required:true" /></td>
    </tr>
 	<tr height="50">
    	 <td><input type="radio" name="adm_status" value="1" id="raA"/>启用</td><td><input type="radio" name="adm_status" value="0" id="raB"/>禁用 </td>
    </tr>
  	
    </table>
    </form>
    

</div>
<div class="easyui-tabs" fit="true" border="false"> 
	
		<table id="datagrid"></table>
		
	
</div>
