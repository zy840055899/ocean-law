<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/base/static.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/css/share.css?v=${v}">
<title>案件类型</title>
<style type="text/css">

.pushpage{
	font-size: 12px; 
}
#creditInfo tr td input{
padding-left: 5px;
}
</style>
</head>
<body>
<div class="tabsearchdiv">
	<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">新增案件类型</a>
</div>
<table id="creditList"></table>  

<div id="creditdialog" class="inputform ea-daiv">
	<ul>
		<li>&emsp;案件类型名称：<input class="w172" id="dname"><span class="red">*	</span></li>
		<li>&emsp;&emsp;&emsp;&emsp;&emsp;备注：<textarea class="w172" id="annotation" rows="3" cols=""></textarea> </li>
	</ul>
</div>

<div id="detailsDialog" class="inputform ea-daiv">
	<ul>
		<li>&emsp;&emsp;&emsp;职务名称：<input class="w172" id="detailsDname" readonly="readonly"></li>
		<li>&emsp;&emsp;&emsp;&emsp;&emsp;备注：<textarea class="w172" id="detailsAnnotation" rows="3" cols="" readonly="readonly"></textarea> </li>
	</ul>
</div>

<script type="text/javascript">
$(function(){
	//表格初始化
	$("#creditList").datagrid({
		//title:"职务管理",
		url:$path + "/dic/queryAllCaseType.do",
		//width:532,
		width:'99%',
	    pagination:true,
	    rownumbers:true,
	    singleSelect:true,
	    pageList:[5,10,15,30],
	    nowrap:false,
	    columns:[[    
	        {field:'caseType',title:'案件类型',width:'35%'},
	        {field:'remark',title:'备注',width:'35%'},
	        {field:'null',title:'操作',width:'30%',formatter: function(value,row,index){
	            	var remark = row.remark==null?"":row.remark;
	        		return '<a href="#" onclick="update(\'' + row.id + '\',\''+ row.caseType + '\',\''+ remark + '\')">修改</a>&nbsp;&nbsp;'
	        				+"<a href='##' onclick='del("+row.id+")'>删除</a>&nbsp;&nbsp;";
	        				// +"<a href='##' onclick='details("+row.id+")'>详情</a>";
	        	}
	        }
	    ]]
	});
	
	//新增（修改）职务管理弹框初始化
	$("#creditdialog").dialog({
		title:"新增案件来源",
		width:450,
		height:220,
		closed:true,
		modal:true,
		resizable:true
	});
	
	//详情弹框初始化
	$("#detailsDialog").dialog({
		title:"职务管理详情",
		width:450,
		height:180,
		closed:true,
		modal:true,
		resizable:true
	});
});
	//新增数据
	function add(){
		//清空dialog
		clearDialog();
		$("#creditdialog").dialog({
			buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
					var dname = $("#dname").val();
		        	var annotation = $("#annotation").val();
		        	if(dname==''){
		        		$.messager.alert("消息","案件来源名称不能为空","warning");
		        		return;
		        	}
		        	$.messager.progress(); 
		        	$.ajax({
						type : "POST",
						dataType : "JSON",
						url : $path +"/dic/addCaseFrom.do",
						data : {caseFrom:dname,remark:annotation},
						success : function(data) {
							$.messager.progress("close");
							if (data.resultCode="0000") {
								$.messager.alert("消息","添加成功","info");
								$("#creditList").datagrid("reload");
								$("#creditdialog").dialog("close");
							} else {
								$.messager.alert("错误", data.resultDesc,"error");
							}
						},
						error:function(){
							$.messager.progress("close");
							$.messager.alert("错误", "服务异常","error");
						}
					});
				}
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					$("#creditdialog").dialog('close');
				}
			}]
		}).dialog("openl");
	}
	//修改数据
	function update(id, dname, remark){
		$("#creditdialog").dialog({
			title:"修改职务管理"
		});
		//清空dialog
		clearDialog();
		//取值
        $("#dname").val(dname);
        $("#annotation").val(remark);
		//保存
		$("#creditdialog").dialog({
			buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
					var dname = $("#dname").val();
		        	var annotation = $("#annotation").val();
		        	
		        	if(dname==''){
		        		$.messager.alert("消息","职务名称不能为空","warning");
		        		return;
		        	}
		        	$.messager.progress(); 
		        	$.ajax({
						type : "POST",
						dataType : "JSON",
						url : $path +"/dic/updateCaseFrom.do",
						data : {id:id,caseFrom:dname,remark:annotation},
						success : function(data) {
							$.messager.progress("close");
							if (data.resultCode=="0000") {
								$.messager.alert("消息","修改成功","info");
								$("#creditList").datagrid("reload");
								$("#creditdialog").dialog("close");
							} else {
								$.messager.alert("错误", data.resultDesc,"error");
							}
						},
						error:function(){
							$.messager.progress("close");
							$.messager.alert("错误", "服务异常","error");
						}
					});
				}
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					$("#creditdialog").dialog('close');
				}
			}]
			
		}).dialog("openl");
	}
	//删除数据
	function del(id){
		$.messager.confirm('确认','您确定要删除这条数据吗？',function(r){
		    if (r){    
	           $.post($path+"/dic/delCaseFrom.do",{id:id},function(data){
		        	$.messager.alert("消息","删除成功","info");
		       		$('#creditList').datagrid('reload');
	           });
		    }    
		});
	}
	
	//详情
	function details(id){
		$.ajax({
			type : "POST",
			dataType : "JSON",
			url : $path +"/portal/DutyManage/findById.action",
			data : {id:id},
			success : function(data) {
				$("#detailsDname").val(data.dname);
			    $("#detailsAnnotation").val(data.annotation);
			},
			error:function(){
				$.messager.progress("close");
				$.messager.alert("错误", "服务异常","error");
			}
		});
		$("#detailsDialog").dialog("openl");
	}
	
	//填充数据
	function fillInfo(id){
		$.ajax({
			type : "POST",
			dataType : "JSON",
			url : $path +"/portal/DutyManage/findById.action",
			data : {id:id},
			success : function(data) {
				$("#dname").val(data.dname);
			    $("#annotation").val(data.annotation);
			},
			error:function(){
				$.messager.progress("close");
				$.messager.alert("错误", "服务异常","error");
			}
		});
	}
	//清空数据
	function clearDialog(){
		$("#dname").val("");
		$("#annotation").val("");
	}
</script>
</body>
</html>