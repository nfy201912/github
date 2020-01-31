<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" charset="utf-8">

	var goodsGrid;
	$(function(){
		$('#goodsGrid').datagrid({
			url:'${path}/goods/findAll',
			queryParams:{"g_name":null},
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
				title:'ID',
				field:'g_id',
				width:100
			},
			{
				title:'名称',
				field:'g_name',
				width:100
			},{
				title:'种类',
				field:'category',
				width:100,
				formatter: function(value,row,index){
						value = row.category.c_name;
						return value;
					}
				
			},{
				title:'单价',
				field:'g_price',
				width:100
			},{
				title:'图片',
				field:'g_imgUrl',
				width:100,
				formatter: function(value,row,index){
					if(row.g_imgUrl!=null){
						value = "<img style='width:80px;height:50px;' border='1' src='"+row.g_imgUrl+"'/>";
						return value;
					}
					
				}
			}]],
			toolbar:[{
				text:'增加',
				iconCls:'icon-add',
				handler:function(){
					
					$('#addg_h').show();
					$('#add_g').dialog('center');
					$('#add_g').dialog({
						width:600,
						height:200,
						closed:false,
						 buttons:[{
						    	text:'保存',
						    	handler:function(){
						    		$.messager.progress();
						    		$('#formAddg').form('submit',{
						    			url:'${path}/goods/upload',
						    			 onSubmit:function(){
						    				var isValid =$(this).form('validate');
						    				if(isValid){
						    					//var rn = ^({0,1}d.d{1,8})$|^(d{1,2})$;
						    					var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
						    					var re = /\s/;//空格
						    					var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
						    					//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
						    					 if(!re.test($('#gname').val())&&!pattern.test($('#gname').val())){//排除空格和特殊字符
						    						 
						    					 if(changeNum($('#gprice'))){
						    						 $.messager.progress('close');
						    						 return true;
						    					 }else{
							    						$.messager.alert('提示','价格输入有误');
								    					$.messager.progress('close');
								    					return false;
								    					
							    					}
						    				
						    					}else{
						    						$.messager.alert('提示','名称不能包含特殊字符');
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
						    					$("#formAddg").form('reset');
						    					$('#goodsGrid').datagrid('reload');
						    					$('#add_g').dialog('close');
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
						    		$("#formAddg").form('reset');
						    		$('#add_g').dialog('close');
						    		$('#addg_h').hide();
						    	}
						    }]
					});
					
				}},{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var arr = $('#goodsGrid').datagrid('getSelections');
					if(arr.length==0){
						$.messager.alert('提示','请选择要删除的数据');
					}else{
						$.messager.confirm("删除确认","你确定要删除选中的数据吗？",function(f){
							if(f){
								var arry = new Array();
								for(i=0;i<arr.length;i++){
									var user = arr[i];
							
									arry.push(user.u_id);
									
								}
								
								$.post("${path}/user/delete",{"array[]":arry},function(data){
									//console.log(data)
									if("success"==data){
										$("#goodsGrid").datagrid('clearSelections');
										$('#goodsGrid').datagrid('reload');
									}else{
										$.messager.alert('提示',data);
										$("#goodsGrid").datagrid('clearSelections');
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
					var arr = $('#goodsGrid').datagrid('getSelections');
					if(arr.length==0){
						$.messager.alert('提示','请选择要编辑的数据');
					}else if(arr.length>1){
						$.messager.alert('提示','编辑不能多选');
					}else{
						$('#edit_h').show();
						var u_id =arr[0].u_id;
						//console.info(arr[0].adm_id);
						 $('#uedit').dialog({
							width:600,
							height:280,
							closed:false,
							buttons:[{
								text:'保存',
								handler:function(){
									/* console.log($('#ename').val());
									console.log($('#epwd').val());
									console.log(isFitCheck($('#ename').val(),$('#epwd').val())) */
									 if(isFitCheck($('#ename').val(),$('#epwd').val())){
										$('#formEditu').form('submit',{
											url:'${path}/user/edit',
											success:function(data){
												
												if("success"==data){
													$('#uedit').dialog('close');
													$('#goodsGrid').datagrid('reload');
													$("#goodsGrid").datagrid('clearChecked');
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
									$("#goodsGrid").datagrid('clearChecked');
									$('#uedit').dialog('close');
									$('#edit_h').hide();
								}
							}]
						}); 
						 $('#formEditu').form('load','${path}/user/load?u_id='+u_id);//加载选中数据
						 
						 
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
	
	function changeNum(obj) {
		
	    
	    var rn =/[^\d.]/g;
	  
	    if(rn.test(obj.val())){
	    	return false;
	    }
	    if(obj.val() != ''){
	    	if ( obj.val().substr(0, 1) == '.'||obj.val().substr(0, 1) == 0) {
	  	      return false;
	  	    }
	    } 
	    var value = obj.val();
	    var vl = value.replace(/\.{2,}/g,".");//this.value.replace(/\.{2,}/g,".")
	    alert(vl)
	    obj.attr("value",value.replace(/^0*(0\.|[1-9])/, '$1'));//粘贴不生效
	    obj.attr("value",value.replace(/[^\d.]/g, ""));  //清除“数字”和“.”以外的字符
	    $('#gprice').attr("value",value.replace(/\.{2,}/g, "")) ; //只保留第一个. 清除多余的
	    obj.attr("value",value.replace(".", "$#$").replace(/\./g, "").replace("$#$", "."));
	    obj.attr("value",value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'));//只能输入两个小数
	    if (obj.val().indexOf(".") < 0 && obj.val() != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
	      if (obj.val().substr(0, 1) == '0' && obj.val().length == 2) {
	    	  $('#gprice').attr("value",obj.val().substr(1, obj.val().length));
	      }
	    }  
	    return true;
	  }

	//分页实现
	function pagerFilter(data) {  
		//console.log(data.rows[0].category.c_name)
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
	$('#gss').searchbox({
	    searcher:function(value){
	   //console.log(value)
	      if(value==''){
	    	$('#goodsGrid').datagrid('load',{
	    		"g_name":null
	    	});
	    }else{

	    		$('#goodsGrid').datagrid('load',{
		    		"g_name":value
		    	});

	    }  
	    },
	    prompt:'Please Input Value'
	});
	$("#c").combobox({
		url :"${path}/category/findCategory",				
		valueField :"c_id",
		textField :"c_name",
		//multiple:true,//多选
		panelHeight:'200',
		panelWidth:'300',
		
	});
	
	
	
</script>
<input type="hidden" id="path" value="${pageContext.request.contextPath }"/>
<div align="center" id="add_g" class="easyui-dialog" title="水源新增" style="width:600px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
   <div id="addg_h" style="display: none">
   	 <form id="formAddg" action="${path}/goods/upload" method="post" enctype="multipart/form-data">
    	<table style="margin-top:0px">
   <tr height="50" >
    	<td>名称:&nbsp;&nbsp;<input id="gname"  name="g_name" class="easyui-textbox"  data-options="required:true" /></td>
    	<td>种类:&nbsp;&nbsp;<input class="easyui-combobox" id="c" name="category" data-options="required:true" style="width:175px;" ></td>
    </tr> 
      <tr height="50" >
     	 <td>价格:&nbsp;&nbsp;<input id="gprice"  name="g_price" class="easyui-textbox"  data-options="required:true" /></td>
    	<td>图片:&nbsp;&nbsp;<input id="gimg"  name="g_imgUrl" class="easyui-filebox"  data-options="required:true,buttonText:'文件'" /></td>
    </tr>
    </table>
    </form>
   </div>
</div>
<div align="center" id="gedit" class="easyui-dialog" title="用户编辑" style="width:500px;height:220px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
    <div id="edit_h" style="display: none">
    	   <form id="formEditg" action="" method="post">
    	<table style="margin-top:0px">
    <tr height="50" >
    	<td>账号:&nbsp;&nbsp;<input id="uename"  name="u_username" class="easyui-textbox"  data-options="readonly:'true',iconCls:'icon-man'" /></td>
    	<td>密码:&nbsp;&nbsp;<input id="uepwd"  name="u_password" class="easyui-passwordbox"  data-options="required:true" /></td>
    </tr>
    <tr height="50">
    	<td>姓名:&nbsp;&nbsp;<input id="uerelname"  name="u_name" class="easyui-textbox"  data-options="required:true" /></td>
    	<td>邮箱:&nbsp;&nbsp;<input id="ueEmail"  name="u_email" class="easyui-textbox"  data-options="required:true,validType:'email'" /></td>
    </tr>
    <tr height="50">
    	<td>电话:&nbsp;&nbsp;<input id="uephone"  name="u_phone" class="easyui-textbox"  data-options="required:true" /></td>
    	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="u_status" value="1"  checked="checked"/>启用&nbsp;&nbsp;<input type="radio" name="u_status" value="0" />禁用 </td> 
    </tr>
 	
  	
    </table>
    </form>
    </div>
</div>
<div id="win"></div>
		
			&nbsp;&nbsp;&nbsp;&nbsp;名称：&nbsp;<input id="gss" class="easyui-searchbox" style="width:300px;"/><br/>
		<table id="goodsGrid" style="height: 500px;width: 100%"></table>
		
	

