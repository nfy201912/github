<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" charset="utf-8">
	var userGrid;
	$(function(){
		$('#userGrid').datagrid({
			url:'${path}/user/findAll',
			queryParams:{"u_username":null},
			iconCls:'icon-save',
			pagination:true,
			pageSize:20,
			pageList:[20,40,80],
			fitColumns:true,
			nowarp:false,
			border:false,
			idField:'u_id',
			checkOnSelect:true,
			selectOnCheck:true,
			sortName:'u_id',
			sortOrder:'desc',
			toolbar:'#manager_tool',
			loadFilter: pagerFilter,
			/*  private Integer u_id; 
	private String u_username;
	private String u_password;
	
	private String u_name ;
	private String u_email;
	private String u_phone ;
	private String u_activeCode;
	private boolean u_status;
	private Timestamp u_createTime; */
			columns:[[{
				checkbox:true,
				field:'id',
				
			},{
				title:'编号',
				field:'u_id',
				width:100
			},
			{
				title:'账号',
				field:'u_username',
				width:100
			},{
				title:'姓名',
				field:'u_name',
				width:100
			},{
				title:'邮箱',
				field:'u_email',
				width:100
			},{
				title:'电话',
				field:'u_phone',
				width:100
			},{
				title:'状态',
				field:'u_status',
				width:100
			},{
				title:'创建时间',
				field:'u_createTime',
				width:100
			}]],
			toolbar:[{
				text:'增加',
				iconCls:'icon-add',
				handler:function(){
					$('#addu_h').show();
					$('#add_u').dialog('center');
					$('#add_u').dialog({
						width:400,
						height:260,
						closed:false,
						 buttons:[{
						    	text:'保存',
						    	handler:function(){
						    		$.messager.progress();
						    		$('#formAddu').form('submit',{
						    			url:'${path}/user/add',
						    			onSubmit:function(){
						    				var isValid =$(this).form('validate');
						    				if(isValid){
						    					var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
						    					var re = /\s/;//空格
						    					var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
						    					//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
						    					 if(!re.test($('#uname').val())&&!pattern.test($('#uname').val())){//排除空格和特殊字符
						    						 if(rp.test($('#upwd').val())){
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
						    					$('#userGrid').datagrid('reload');
						    					$('#add_u').dialog('close');
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
						    		$("#formAddu").form('reset');
						    		$('#add_u').dialog('close');
						    		$('#addu_h').hide();
						    	}
						    }]
					});
					
				}},{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var arr = $('#userGrid').datagrid('getSelections');
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
										$("#userGrid").datagrid('clearSelections');
										$('#userGrid').datagrid('reload');
									}else{
										$.messager.alert('提示',data);
										$("#userGrid").datagrid('clearSelections');
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
					var arr = $('#userGrid').datagrid('getSelections');
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
													$('#userGrid').datagrid('reload');
													$("#userGrid").datagrid('clearChecked');
												}
												$.messager.alert("提示","修改成功");
												
											}
										});
									}else{
										$.messager.alert("提示","账号或密码不能有特殊字符");
									} 
									
								}
							},{
								text:'退出',
								handler:function(){
									$("#userGrid").datagrid('clearChecked');
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
	    	$('#userGrid').datagrid('load',{
	    		"u_username":null
	    	});
	    }else{

	    		$('#userGrid').datagrid('load',{
		    		"u_username":value
		    	});

	    }  
	    },
	    prompt:'Please Input Value'
	});
	
</script>

<div align="center" id="add_u" class="easyui-dialog" title="用户新增" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
   <div id="addu_h" style="display: none">
   	 <form id="formAddu" action="${path}/user/add" method="post">
    	<table style="margin-top: 20px">
    <tr height="30" >
    	`
    </tr>
    <tr height="50">
    	<td>密码：</td><td><input id="upwd"  name="u_password" class="easyui-passwordbox"  data-options="required:true" /></td>
    </tr>
 	<tr height="50">
    	 <td><input type="radio" name="u_status" value="1"  checked="checked"/>启用</td><td><input type="radio" name="u_status" value="0" />禁用 </td> 
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
    <tr height="30" >
    	<td>账号：</td><td><input id="ename" name="adm_name" class="easyui-textbox"   data-options="required:true,iconCls:'icon-man'" /></td>
    </tr>
    <tr height="50">
    	<td>密码：</td><td><input id="epwd"  name="adm_password" class="easyui-passwordbox"  data-options="required:true" /></td>
    </tr>
 	<tr height="50">
    	 <td><input type="radio" name="u_status" value="1" id="raA"/>启用</td><td><input type="radio" name="u_status" value="0" id="raB"/>禁用 </td>
    </tr>
  	
    </table>
    </form>
    </div>
</div>
<div id="win"></div>
		
			&nbsp;&nbsp;&nbsp;&nbsp;账号：&nbsp;<input id="ss" class="easyui-searchbox" style="width:300px;"/><br/>
		<table id="userGrid" style="height: 500px;width: 100%"></table>
		
	

