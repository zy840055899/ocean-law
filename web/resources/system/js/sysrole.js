var $ROLEID=undefined;
$(function(){
	
	$ROLE={};
	
	$('#dg').datagrid({
	    url:$webURI+"/system/sysrole/sysRoleList.action",    
	    width:'99%',
	    rownumbers:true,
	    singleSelect:true,
	    columns:[[    
	        {field:'rname',title:'名称',width:'30%'},    
	        {field:'msg',title:'权限描述',width:'40%'},    
	        {field:'id',title:'操作',width:'30%',formatter: function(value,row,index){
				return "<a href=\"##\" onclick=\"role.beforedeit("+value+")\">更新</a>&emsp;<a href=\"##\" onclick=\"role.tree("+value+")\">页面权限赋予</a>";
			}}    
	    ]]    
	});
	
	role = {
			add:function(){
				$ROLE.id=undefined;
				$("#roledialog").dialog("openl");
			},
			beforedeit:function(a){
				$.post($webURI+"/system/sysrole/getRole.action",{id:a},function(data){
					$ROLE=data;
					$("#editrole").val(data.rname);
					$("#editmsg").val(data.msg);
					$("#roledialog").dialog("openl");
				});
			},
			tree:function(a){
				$ROLEID=a;
				$("#roletreedialog").dialog({
					href:$webURI+"/system/index/toPage.action?page=roletree"
				}).dialog("openl");
			}
	};
	
	$("#roledialog").dialog({
		title:"角色操作",
		width:500,
		height:260,
		closed:true,
		modal:true,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				var tempin={
						id:$ROLE.id,
						rname:$.trim($("#editrole").val()),//角色
						msg:$("#editmsg").val()//角色描述
				};
				if(tempin.rname==""){
					$.messager.alert("消息","角色名称不能为空","warning");
					return false;
				}
				$.messager.progress();
				$.post($webURI+"/system/sysrole/addUpdateRole.action",tempin,function(data){
					if(data.code>0){
						window.location.reload();
					}else{
						$.messager.progress("close");
						$.messager.alert("消息",data.msg,"warning");
					}
				});
			}
		},{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$("#roledialog").dialog('close');
			}
		}],
		onClose:function(){
			$("#roledialog input").val("");
		}
	});
	$("#roletreedialog").dialog({
		title:"权限赋予",
		width:350,
		height:500,
		closed:true,
		modal:true,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				var datemps = $('#roletree').tree('getChecked',['checked','indeterminate']);
		    	var tempindata={id:$ROLEID};
		    	var temparr="";
		    	$.each(datemps,function(i,val){
		    		temparr+=(","+val.id);
		    	});
		    	temparr = temparr.replace(",", "");
		    	tempindata.page=temparr;
				$.messager.progress(); 
		    	$.post($webURI+"/system/sysrole/updateRoleTree.action",tempindata,function(data){
		    		$.messager.progress('close');
		    		$.messager.alert('消息','修改成功','info');
		    		$("#roletreedialog").dialog('close');
		    	});
			}
		},{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$("#roletreedialog").dialog('close');
			}
		}]
	});
});