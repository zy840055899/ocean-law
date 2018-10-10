$(function(){
	
	var $ROLE=undefined,$USERNO=undefined;
	
	$('#dg').datagrid({
	    url:$webURI+"/system/sysuser/sysUerList.action",   
	    width:'99%',
	    pagination:true,
	    rownumbers:true,
	    singleSelect:true,
	    pageSize:15,
	    pageList:[5,10,15,30],
	    columns:[[    
	        {field:'uno',title:'编号',width:'25%'},    
	        {field:'nicname',title:'名称',width:'25%'},    
	        {field:'urmsg',title:'权限角色',width:'25%'},    
	        {field:'isstop',title:'操作',width:'25%',formatter: function(value,row,index){
				return "<a href=\"##\" onclick=\"sysuser.update('"+row.uno+"',"+value+")\">"+(value==0?"禁用":"启用")+"</a>"
				+"&emsp;<a href=\"##\" onclick=\"sysuser.kl('"+row.uno+"')\">重设口令</a>"
				+"&emsp;<a href=\"##\" onclick=\"sysuser.role('"+row.uno+"','"+row.urole+"')\">角色赋予</a>";
			}}    
	    ]]    
	});
	
	$.post($webURI+"/system/sysrole/sysRoleList.action",function(data){
		var htmlt= "";$ROLE=data;
		for (var int = 0; int < data.length; int++) {
			htmlt+=("<option value=\""+data[int].id+"\" data=\""+int+"\">"+data[int].rname+"</option>");
		}
		$("#editrole").append(htmlt);
	});
	
	$("#userdialog").dialog({
		title:"用户操作",
		width:300,
		height:230,
		closed:true,
		modal:true,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				var index = $("#editrole :selected").attr("data");
				var tempin={
						uno:$USERNO,//用户编号
						urole:$ROLE[index].id//角色id
				};
				$.messager.progress();
				$.post($webURI+"/system/sysuser/sysUserUpdate.action",tempin,function(data){
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
				$("#userdialog").dialog('close');
			}
		}]
	});
	
	sysuser = {
		update:function(a,b){
			if(b==0){
				$.messager.confirm('确认','您确认想要禁用该用户吗？',function(r){
				    if (r){    
			           $.post($webURI+"/system/sysuser/sysUserUpdate.action",{uno:a,isstop:1},function(data){
			        	   if(data.code>0){
				        	   $('#dg').datagrid('reload');
			        	   }else{
			        		   $.messager.alert("消息",data.msg,"error");
			        	   }
			           });
				    }    
				});
			}else{
				$.post($webURI+"/system/sysuser/sysUserUpdate.action",{uno:a,isstop:0},function(data){
					if(data.code>0){
						$('#dg').datagrid('reload');
					}else{
						$.messager.alert("消息",data.msg,"error");
					}
		        });
			}
		},
		search:function(){
			var tempin={
					uno:$("#seauno").val(),
					nicname:$("#seaname").val(),
					isstop:$("#seastop").val()
			};
			$('#dg').datagrid({
				queryParams: tempin
			});
		},
		role:function(a,b){
			$USERNO=a;$("#editrole").val(b);
			$("#userdialog").dialog("openl");
		},
		kl:function(a){
			$.messager.confirm('确认','该账户登陆口令会设为默认值，您确认该操作吗？',function(r){    
			    if (r){    
			        $.post($webURI+"/system/sysuser/resetKL.action",{uno:a},function(){
			        	$.messager.alert("消息","账户口令重设成功，提醒用户重设新密码","info");
			        });
			    }    
			});
		}
	};
});