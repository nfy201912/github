<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div align="center" id="add_c" class="easyui-dialog" title="种类新增"
	data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	<div id="addc_h" style="display: none">
		<form id="formAddc" action="${path}/category/add" method="post"
			enctype="multipart/form-data">
			<table style="margin-top: 0px">
				<tr height="50">
					<td>名称:&nbsp;&nbsp;<input id="cname" name="c_name"
						class="easyui-textbox" data-options="required:true" /></td>
					
				</tr>
				
			</table>
		</form>
	</div>
</div>
<div align="center" id="cedit" class="easyui-dialog" title="种类编辑"
	data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	<div id="editc_h" style="display: none">
		<form id="formEditc" method="post" enctype="multipart/form-data">
			<table style="margin-top: 0px">
				<tr height="50">
					<input id="hc_id" type="hidden" name="c_id"/>
					<td>名称:&nbsp;&nbsp;<input id="cename" name="c_name"
						class="easyui-textbox" data-options="required:true" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<table id="categoryGrid" style="width: 100%"></table>
<script type="text/javascript">
	$(function(){
		$('#categoryGrid').datagrid({
			url : '${path}/category/findAll',
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30 ],
			fitColumns : false,
			rownumbers:true,
			nowarp : false,
			border : false,
			idField : 'c_id',
			checkOnSelect : true,
			selectOnCheck : true,
			sortName : 'c_id',
			sortOrder : 'desc',
			toolbar : '#manager_tool',
			loadFilter : pagerFilter,
			columns : [ [
							{
								checkbox : true,
								field : 'id',

							},
							/* {
								title : 'ID',
								field : 'c_id',
								width : 100
							}, */
							{
								title : '名称',
								field : 'c_name',
								width : 100
							}]],
							toolbar : [
											{
												text : '增加',
												iconCls : 'icon-add',
												handler : function() {
													$('#hd').attr("value", 0);
													$('#addc_h').show();
													$('#add_c').dialog('center');
													$('#add_c')
															.dialog(
																	{
																		width : 300,
																		height : 140,
																		closed : false,
																		buttons : [
																				{
																					text : '保存',
																					handler : function() {
																						$.messager
																								.progress();
																						$(
																								'#formAddc')
																								.form(
																										'submit',
																										{
																											url : '${path}/category/add',
																											onSubmit : function() {
																												var isValid = $(
																														this)
																														.form(
																																'validate');
																												if (isValid) {
																													//var rn = ^({0,1}d.d{1,8})$|^(d{1,2})$;
																													var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
																													var re = /\s/;//空格
																													//var pattern  = /^[\w\u4e00-\u9fa5]+$/gi;//匹配中文 数字 字母 下划线   
																													var pattern = new RegExp(
																															"[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
																													//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
																													if (!re
																															.test($(
																																	'#cname')
																																	.val())
																															&& !pattern
																																	.test($(
																																			'#cname')
																																			.val())&&$(
																																			'#cname')
																																			.val().indexOf('"')<0) {//排除空格和特殊字符

																														

																													} else {
																														$.messager
																																.alert(
																																		'提示',
																																		'名称不能包含特殊字符');
																														$.messager
																																.progress('close');
																														return false;

																													}

																												} else {

																													$.messager
																															.progress('close');
																													return false;
																												}
																											},
																											success : function(
																													data) {
																												if ("success" == data) {
																													$.messager
																															.progress('close');
																													$.messager
																															.show({
																																title : '提示',
																																msg : '添加成功!',
																																timeout : 1000,
																																showType : 'slide'
																															});
																													$(
																															"#formAddc")
																															.form(
																																	'reset');
																													$(
																															'#categoryGrid')
																															.datagrid(
																																	'reload');
																													$(
																															'#add_c')
																															.dialog(
																																	'close');
																												} else {
																													$.messager
																															.progress('close');
																													$.messager
																															.alert(
																																	'提示',
																																	data);
																												}
																											}

																										});

																					}
																				},
																				{
																					text : '退出',
																					handler : function() {
																						$(
																								"#formAddc")
																								.form(
																										'reset');
																						$(
																								'#add_c')
																								.dialog(
																										'close');
																						$(
																								'#addc_h')
																								.hide();
																					}
																				} ]
																	});

												}
											},
											{
												text : '删除',
												iconCls : 'icon-remove',
												handler : function() {
													var arr = $('#categoryGrid').datagrid(
															'getSelections');
													if (arr.length == 0) {
														$.messager.alert('提示',
																'请选择要删除的数据');
													} else {
														$.messager
																.confirm(
																		"删除确认",
																		"你确定要删除选中的数据吗？",
																		function(f) {
																			if (f) {
																				var arry = new Array();
																				for (i = 0; i < arr.length; i++) {
																					var category = arr[i];

																					arry.push(category.c_id);

																				}

																				$.post(
																								"${path}/category/delete",
																								{
																									"array[]" : arry
																								},
																								function(
																										data) {
																									//console.log(data)
																									if ("success" == data) {
																										$(
																												"#categoryGrid")
																												.datagrid(
																														'clearSelections');
																										$(
																												'#categoryGrid')
																												.datagrid(
																														'reload');
																									} else {
																										$.messager
																												.alert(
																														'提示',
																														data);
																										$(
																												"#categoryGrid")
																												.datagrid(
																														'clearSelections');
																									}

																								});
																			}

																		});

													}

												}
											},
											{
												text : '编辑',
												iconCls : 'icon-edit',
												handler : function() {
													var arr = $('#categoryGrid').datagrid(
															'getSelections');
													if (arr.length == 0) {
														$.messager.alert('提示',
																'请选择要编辑的数据');
													} else if (arr.length > 1) {
														$.messager
																.alert('提示', '编辑不能多选');
													} else {
														$('#editc_h').show();
														var c_id = arr[0].c_id;
														$('#hc_id').attr("value",c_id);//设置隐藏id值传输
														$('#formEditc').form('load','${path}/category/load?c_id='+c_id);//加载选中数据
														$('#cedit')
																.dialog(
																		{
																			width : 300,
																			height : 140,
																			closed : false,
																			buttons : [
																					{
																						text : '保存',
																						handler : function() {

																							$(
																									'#formEditc')
																									.form(
																											'submit',
																											{
																												url : '${path}/category/edit',
																												onSubmit : function() {
																													var isValid = $(
																															this)
																															.form(
																																	'validate');
																													if (isValid) {
																														//var rn = ^({0,1}d.d{1,8})$|^(d{1,2})$;
																														var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
																														var re = /\s/;//空格
																														//var pattern  = /^[\w\u4e00-\u9fa5]+$/gi;//匹配中文 数字 字母 下划线   
																														var pattern = new RegExp(
																																"[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
																														//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
																														if (!re
																																.test($(
																																		'#cename')
																																		.val())
																																&& !pattern
																																		.test($(
																																				'#cename')
																																				.val())&&$(
																																				'#cename')
																																				.val().indexOf('"')<0) {//排除空格和特殊字符

																															

																														} else {
																															$.messager
																																	.alert(
																																			'提示',
																																			'名称不能包含特殊字符');
																															$.messager
																																	.progress('close');
																															return false;

																														}

																													} else {

																														$.messager
																																.progress('close');
																														return false;
																													}
																												},
																												success : function(
																														data) {

																													if ("success" == data) {
																														$.messager
																														.show({
																															title : '提示',
																															msg : '修改成功!',
																															timeout : 1000,
																															showType : 'slide'
																														});
																														$(
																																'#cedit')
																																.dialog(
																																		'close');
																														$(
																																'#categoryGrid')
																																.datagrid(
																																		'reload');
																														$(
																																"#categoryGrid")
																																.datagrid(
																																		'clearChecked');
																													} else {
																														$.messager
																																.alert(
																																		"提示",
																																		data);
																													}

																												}
																											});

																						}
																					},
																					{
																						text : '退出',
																						handler : function() {
																							$(
																									"#categoryGrid")
																									.datagrid(
																											'clearChecked');
																							$(
																									'#cedit')
																									.dialog(
																											'close');
																							$(
																									'#editc_h')
																									.hide();
																						}
																					} ]
																		});
														

													}
												}
											} ]
		})
	});
	
	//分页实现
	function pagerFilter(data) {
		//console.log(data.rows[0].category.c_name)
		if (typeof data.length == 'number' && typeof data.splice == 'function') {
			//typeof判断变量类型的，12是数字，所以输出的结果是number
			data = {
				total : data.length,
				rows : data
			}
		}
		var dg = $(this);
		var opts = dg.datagrid('options'); //返回参数对象
		var pager = dg.datagrid('getPager');
		pager.pagination({
			onSelectPage : function(pageNum, pageSize) {
				opts.pageNumber = pageNum;
				opts.pageSize = pageSize;
				pager.pagination('refresh', {
					pageNumber : pageNum,
					pageSize : pageSize
				});
				dg.datagrid('loadData', data);
			}
		});
		if (!data.originalRows) {
			if (data.rows)
				data.originalRows = (data.rows);
			else if (data.data && data.data.rows)
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