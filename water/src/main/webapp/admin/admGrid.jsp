<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" charset="utf-8">
	var datagrid;
	$(function(){
		$('#datagrid').datagrid({
			url:'${path}/admin/findAll',
			queryParams:{"adm_name":""},
			pagination:true,
			pageSize:20,
			pageList:[20,40,80],
			fitColumns:false,
			rownumbers:true,
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
				
			},/* {
				title:'编号',
				field:'adm_id',
				width:100
			}, */
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
				width:100,
				formatter : function(value, row, index) {
					if (row.adm_status != null&&row.adm_status==true) {
						value = "启用";
					}else{
						value = "禁用";
					}
					return value;
				}
			}]],
			toolbar:[{
				text:'增加',
				iconCls:'icon-add',
				handler:function(){
					$('#add_h').show();
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
						    					var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
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
						    		$('#add_h').hide();
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
								
								$.post("${path}/admin/delete",{"array[]":arry,"id":$('#admin').val()},function(data){
									//console.log(data)
									if("success"==data){
										$("#datagrid").datagrid('clearSelections');
										$('#datagrid').datagrid('reload');
									}else{
										$.messager.alert('提示',data);
										$("#datagrid").datagrid('clearSelections');
									}
									
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
						$('#edit_h').show();
						var adm_id =arr[0].adm_id;
						//console.info(arr[0].adm_id);
						 $('#edit').dialog({
							width:400,
							height:260,
							closed:false,
							buttons:[{
								text:'保存',
								handler:function(){
									/* console.log($('#ename').val());
									console.log($('#epwd').val());
									console.log(isFitCheck($('#ename').val(),$('#epwd').val())) */
									 if(isFitCheck($('#ename').val(),$('#epwd').val())){
										$('#formEdit').form('submit',{
											url:'${path}/admin/edit',
											success:function(data){
												
												if("success"==data){
													$('#edit').dialog('close');
													$('#datagrid').datagrid('reload');
													$("#datagrid").datagrid('clearChecked');
													$.messager.show({
									    				title:'提示',
									    				msg:'修改成功!',
									    				timeout:1000,
									    				showType:'slide'
									    			});
												}
												
											}
										});
									}else{
										$.messager.alert("提示","账号或密码不能有特殊字符");
									} 
									
								}
							},{
								text:'退出',
								handler:function(){
									$("#datagrid").datagrid('clearChecked');
									$('#edit').dialog('close');
									$('#edit_h').hide();
								}
							}]
						}); 
						 $('#formEdit').form('load','${path}/admin/load?adm_id='+adm_id);//加载选中数据
						 
						 
					}
				}
			}]
		});
	});
	
	
	function isFitCheck(name,pwd){
		var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
		var re = /\s/;//空格
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
		return !re.test(name)&&!pattern.test(name)&&!rp.test(pwd);
	}
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
	$('#ss').searchbox({
	    searcher:function(value){
	   //console.log(value)
	      if(value==''){
	    	$('#datagrid').datagrid('load',{
	    		"adm_name":""
	    	});
	    }else{

	    		$('#datagrid').datagrid('load',{
		    		"adm_name":value
		    	});

	    }  
	    },
	    prompt:'Please Input Value'
	});
	
</script>
<input type="hidden" id="admin" value="${admin.adm_id }"/>
<div align="center" id="add" class="easyui-dialog" title="管理员新增" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
   <div id="add_h" style="display: none">
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
</div>
<div align="center" id="edit" class="easyui-dialog" title="管理员编辑" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
    <div id="edit_h" style="display: none">
    	   <form id="formEdit" action="" method="post">
    	<table style="margin-top: 20px">
    	<input type="hidden" name="adm_id" />
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
</div>
<div id="win"></div>
		
			&nbsp;&nbsp;&nbsp;&nbsp;账号：&nbsp;<input id="ss" class="easyui-searchbox" style="width:290px;"/><br/>
		<table id="datagrid" style="width: 100%"></table>
		
	

