<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" id="add_g" class="easyui-dialog" title="水源新增"
	style="width: 600px; height: 220px;"
	data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	<div id="addg_h" style="display: none">
		<form id="formAddg" action="${path}/goods/upload" method="post"
			enctype="multipart/form-data">
			<table style="margin-top: 0px">
				<tr height="50">
					<input type="hidden" name="himg"  value="" />
					<input type="hidden" id="hd" name="g_id" />
					<td>名称:&nbsp;&nbsp;<input id="gname" name="g_name"
						class="easyui-textbox" data-options="required:true" /></td>
					<td>种类:&nbsp;&nbsp;<input class="easyui-combobox" id="c"
						name="category" editable="false" data-options="required:true"
						style="width: 175px;"></td>
				</tr>
				<tr height="50">
					<td>价格:&nbsp;&nbsp;<input id="gprice" name="g_price"
						class="easyui-textbox" data-options="required:true" /></td>
					<td>品牌:&nbsp;&nbsp;<input class="easyui-combobox" id="b"
						name="brand" editable="false" data-options="required:true"
						style="width: 175px;"></td>
				</tr>
				<tr height="50">
					<td>图片:&nbsp;&nbsp;<input id="gimg" name="g_imgUrl"
						class="easyui-filebox"
						data-options="required:true,buttonText:'文件'" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<div align="center" id="gedit" class="easyui-dialog" title="水源编辑"
	style="width: 500px; height: 220px;"
	data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	<div id="editg_h" style="display: none">
		<form id="formEditg" method="post" enctype="multipart/form-data">
			<table style="margin-top: 0px">
				<tr height="50">
					<input type="hidden" id="hid" name="g_id" />

					<td>名称:&nbsp;&nbsp;<input id="gename" name="g_name"
						class="easyui-textbox" data-options="required:true" /></td>
					<td>品牌:&nbsp;&nbsp;<input class="easyui-combobox" id="eb"
						name="brand" editable="false" data-options="required:true"
						style="width: 175px;"></td>
					
				</tr>
				<tr height="50">
					<input type="hidden" name="himg" id="himg" value="" />
					<td>种类:&nbsp;&nbsp;<input class="easyui-combobox" id="ec"
						name="category" editable="false" data-options="required:true"
						style="width: 175px;"></td>
					<td>价格:&nbsp;&nbsp;<input id="geprice" name="g_price"
						class="easyui-textbox" data-options="required:true" /></td>
					
				</tr>
				<tr>
					<td>图片:&nbsp;&nbsp;<input id="geimg" name="g_imgUrl"
						class="easyui-filebox"
						data-options="required:true,buttonText:'文件'" /></td>
				</tr>

			</table>
		</form>
	</div>
</div>

<form id="sform">
<table style="padding: 10px;">
<tr>
	<td>名称:&nbsp;<input id="ns" class="easyui-textbox" style="width: 175px;" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;种类:&nbsp;<input class="easyui-combobox" id="cs" name="category" 
	style="width: 175px;">
&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><a href="#" onclick="sou($('#ns').val(),$('#cs').val())"
	class="easyui-linkbutton" data-options="iconCls:'icon-search'"
	style="width: 80px">搜 索</a>&nbsp;&nbsp;</td>
	<td><a id="cz" href="#" 
	class="easyui-linkbutton" 
	style="width: 80px">重 置</a></td>
	</tr>
	</table>
</form>

<table id="goodsGrid" style=" width: 100%"></table>
<script type="text/javascript" charset="utf-8">
	
	
	function sou(n, c) {
		if(""==c){
			c=0;
		}
		$('#goodsGrid').datagrid('load', {
			"g_name" : n,
			"c_id" : c
		});

	}
	var goodsGrid;
	$(function() {
		$('#cz').click(function(){
			$('#sform').form('reset')
		});
		$('#goodsGrid')
				.datagrid(
						{
							url : '${path}/goods/findAll',
							queryParams : {
								"g_name" : "",
								"c_id":0
							},
							pagination : true,
							pageSize : 20,
							pageList : [ 20, 40, 80 ],
							fitColumns : true,
							rownumbers:true,
							nowarp : false,
							border : false,
							idField : 'g_id',
							checkOnSelect : true,
							selectOnCheck : true,
							remoteSort: false,
							sortName : 'g_price',
							sortOrder : 'asc',
							toolbar : '#manager_tool',
							loadFilter : pagerFilter,
							columns : [ [
									{
										checkbox : true,
										field : 'id',

									},
									/* {
										title : 'ID',
										field : 'g_id',
										width : 100
									}, */
									{
										title : '名称',
										field : 'g_name',
										width : 100
									},
									{
										title : '品牌',
										field : 'brand',
										width : 100,
										formatter : function(value, row, index) {
											value = row.brand.b_name;
											return value;
										}

									},
									{
										title : '种类',
										field : 'category',
										width : 100,
										formatter : function(value, row, index) {
											value = row.category.c_name;
											return value;
										}

									},
									{
										title : '单价',
										field : 'g_price',
										width : 100,
										sortable:true
									},
									{
										title : '图片',
										field : 'g_imgUrl',
										width : 100,
										formatter : function(value, row, index) {
											if (row.g_imgUrl != null) {
												value = "<img style='width:80px;height:50px;' border='1' src='"+row.g_imgUrl+"'/>";
												return value;
											}

										}
									} ] ],
							toolbar : [
									{
										text : '增加',
										iconCls : 'icon-add',
										handler : function() {
											$('#hd').attr("value", 0);
											$('#addg_h').show();
											$('#add_g').dialog('center');
											$('#add_g')
													.dialog(
															{
																width : 600,
																height : 200,
																closed : false,
																buttons : [
																		{
																			text : '保存',
																			handler : function() {
																				$.messager
																						.progress();
																				$(
																						'#formAddg')
																						.form(
																								'submit',
																								{
																									url : '${path}/goods/upload',
																									onSubmit : function() {
																										var isValid = $(
																												this)
																												.form(
																														'validate');
																										if (isValid) {
																											//var rn = ^({0,1}d.d{1,8})$|^(d{1,2})$;
																											var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
																											var re = /\s/;//空格
																											var pattern = new RegExp(
																													"[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
																											//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
																											if (!re
																													.test($(
																															'#gname')
																															.val())
																													&& !pattern
																															.test($(
																																	'#gname')
																																	.val())&&$(
																																'#gname')
																																.val().indexOf('"')<0) {//排除空格和特殊字符

																												if (changeNum($('#gprice')) == "success") {
																													$.messager
																															.progress('close');
																													return true;
																												} else {
																													if (changeNum($('#gprice')) == 1) {
																														$.messager
																																.alert(
																																		'提示',
																																		'价格只能输入正数或0');
																														$.messager
																																.progress('close');
																														return false;
																													} else {
																														$.messager
																																.alert(
																																		'提示',
																																		'价格只能保留两位小数');
																														$.messager
																																.progress('close');
																														return false;

																													}

																												}

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
																													"#formAddg")
																													.form(
																															'reset');
																											$(
																													'#goodsGrid')
																													.datagrid(
																															'reload');
																											$(
																													'#add_g')
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
																						"#formAddg")
																						.form(
																								'reset');
																				$(
																						'#add_g')
																						.dialog(
																								'close');
																				$(
																						'#addg_h')
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
											var arr = $('#goodsGrid').datagrid(
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
																			var goods = arr[i];

																			arry
																					.push(goods.g_id);

																		}

																		$
																				.post(
																						"${path}/goods/delete",
																						{
																							"array[]" : arry
																						},
																						function(
																								data) {
																							//console.log(data)
																							if ("success" == data) {
																								$(
																										"#goodsGrid")
																										.datagrid(
																												'clearSelections');
																								$(
																										'#goodsGrid')
																										.datagrid(
																												'reload');
																							} else {
																								$.messager
																										.alert(
																												'提示',
																												data);
																								$(
																										"#goodsGrid")
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
											var arr = $('#goodsGrid').datagrid(
													'getSelections');
											if (arr.length == 0) {
												$.messager.alert('提示',
														'请选择要编辑的数据');
											} else if (arr.length > 1) {
												$.messager
														.alert('提示', '编辑不能多选');
											} else {
												$('#editg_h').show();
												var g_id = arr[0].g_id;
												$('#hid').attr("value", g_id);
												
														$.post(
																"${path}/goods/load",
																{
																	"g_id" : g_id
																},
																function(data) {
																	var json = eval("("
																			+ data
																			+ ")");//转换成json对象
																	$('#gename')
																			.textbox(
																					"setValue",
																					json.g_name);
																	$('#ec')
																			.textbox(
																					"setValue",
																					json.category.c_id);
																	$('#ec')
																			.textbox(
																					"setText",
																					json.category.c_name);
																	$('#eb').textbox(
																			"setValue",
																			json.brand.b_id);
																	$('#eb').textbox(
																			"setText",
																			json.brand.b_name);
																	
																	$('#geprice')
																			.textbox(
																					"setValue",
																					json.g_price);
																	name = json.g_imgUrl;
																	pos = name
																			.lastIndexOf('\\');//'/所在的最后位置'
																	str = name
																			.substr(pos + 1)//截取文件名称字符串
																	//url = name.substr(0,pos)//截取路径字符
																	//$('#img').attr("src","${path}/img/"+str);
																	$('#himg')
																			.attr(
																					"value",
																					str);
																	$('#geimg')
																			.textbox(
																					"setValue",
																					str);

																});

												//console.info(arr[0].adm_id);
												$('#gedit')
														.dialog(
																{
																	width : 600,
																	height : 200,
																	closed : false,
																	buttons : [
																			{
																				text : '保存',
																				handler : function() {

																					$(
																							'#formEditg')
																							.form(
																									'submit',
																									{
																										url : '${path}/goods/upload',
																										onSubmit : function() {
																											var isValid = $(
																													this)
																													.form(
																															'validate');
																											if (isValid) {
																												//var rn = ^({0,1}d.d{1,8})$|^(d{1,2})$;
																												//var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
																												var re = /\s/;//空格
																												var pattern = new RegExp(
																														"[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
																												//console.info(!re.test($('#name').val())&&!pattern.test($('#name').val()))
																												if (!re
																														.test($(
																																'#gename')
																																.val())
																														&& !pattern
																																.test($(
																																		'#gename')
																																		.val())) {//排除空格和特殊字符

																													if (changeNum($('#geprice')) == "success") {
																														$.messager
																																.progress('close');
																														return true;
																													} else {
																														if (changeNum($('#gprice')) == 1) {
																															$.messager
																																	.alert(
																																			'提示',
																																			'价格只能输入正数或0');
																															$.messager
																																	.progress('close');
																															return false;
																														} else {
																															$.messager
																																	.alert(
																																			'提示',
																																			'价格只能保留两位小数');
																															$.messager
																																	.progress('close');
																															return false;

																														}

																													}

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
																														'#gedit')
																														.dialog(
																																'close');
																												$(
																														'#goodsGrid')
																														.datagrid(
																																'reload');
																												$(
																														"#goodsGrid")
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
																							"#goodsGrid")
																							.datagrid(
																									'clearChecked');
																					$(
																							'#gedit')
																							.dialog(
																									'close');
																					$(
																							'#edit_h')
																							.hide();
																				}
																			} ]
																});
												//$('#formEditg').form('load','${path}/goods/load?g_id='+g_id);//加载选中数据

											}
										}
									} ]
						});
	});

	function isFitCheck(name, pwd) {
		var rp = /[^\w\/]/ig;//匹配除字母下划线中划线斜杠以外的字符						 					
		var re = /\s/;//空格
		var pattern = new RegExp(
				"[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");//特殊字符
		return !re.test(name) && !pattern.test(name) && !rp.test(pwd);
	}

	function changeNum(obj) {
		let
		reg = /^([0]|([1-9][0-9]*)|(([0]\.\d{1,}|[1-9][0-9]*\.\d{1,})))$/;
		if (!reg.test(obj.val())) {
			console.warn('只能输入正数或零')
			return 1;
		}
		reg = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
		if (!reg.test(obj.val())) {
			console.warn('请保留2位小数')
			return 2;
		}

		return "success";
	}

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

	$('input[name="category"]').combobox({
		url : "${path}/category/findCategory",
		valueField : "c_id",
		textField : "c_name",
		//multiple:true,//多选
		panelHeight : '200',
		panelWidth : '300',

	});
	$('input[name="brand"]').combobox({
		url : "${path}/category/findBrands",
		valueField : "b_id",
		textField : "b_name",
		//multiple:true,//多选
		panelHeight : '200',
		panelWidth : '300',

	});
</script>




