$(function(){
	
	var $CURRENTNODE={},$MENU={};
	
	$("#tree").tree({
	    url: $webURI + "/system/menus/menutree.action",
	    onLoadSuccess:function(){
	    	$('#tree').tree('expandAll');
	    },
	    onClick: function(node){
	    	node.levels=easyui_tree_options.getLevel(this, node);
	    	$CURRENTNODE=node;
			$.post($webURI+"/system/menus/getMenu.action",{id:node.id},function(data){
				$("#mtitle").text(data.title);
				$("#murl").text(data.url);
				$("#msort").text(data.sort);
				$("#mnew").text((data.isnewpage==0?"否":"是"));
			});
		}
	});
	
	$("#menudialog").dialog({
		title:"菜单操作",
		width:500,
		height:260,
		closed:true,
		modal:true,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				var tempin={
						id:$MENU.id,//菜单id
						title:$.trim($("#edittitle").val()),//菜单标题
						url:$.trim($("#editurl").val()),//菜单url
						parentid:$MENU.parentid,//菜单父节点
						sort:$.trim($("#editsort").val()),//菜单父节点
						isnewpage:$("#editopen").prop("checked")?1:0//打开新窗口
				};
				if(tempin.title==""){
					$.messager.alert("消息","标题不能为空","warning");
					return false;
				}
				$.messager.progress();
				$.post($webURI+"/system/menus/addUpdateMenu.action",tempin,function(data){
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
				$("#menudialog").dialog('close');
			}
		}],
		onClose:function(){
			$("#menudialog input").val("");
		}
	});
	
	menu={
			beforeedit:function(){
				if($.isEmptyObject($CURRENTNODE)){
					$.messager.alert("消息","请选择一个菜单","warning");
					return false;
				}
				$.post($webURI+"/system/menus/getMenu.action",{id:$CURRENTNODE.id},function(data){
					$MENU=data;
					$("#edittitle").val(data.title);
					$("#editurl").val(data.url);
					$("#editsort").val(data.sort);
					$("#editopen").prop("checked",data.isnewpage==1);
					$("#menudialog").dialog("openl");
				});
			},
			delete1:function(){
				if($.isEmptyObject($CURRENTNODE)){
					$.messager.alert("消息","请选择一个菜单","warning");
					return false;
				}
				$.messager.confirm('消息','您确认想要删除记录吗？',function(r){   
				    if (r){
						$.post($webURI+"/system/menus/deleteMenu.action",{id:$CURRENTNODE.id},function(data){
							window.location.reload();
						});
				    }    
				});
			},
			addpmenu:function(){
				$MENU.id=undefined;
				$MENU.parentid=0;
				$("#menudialog").dialog("openl");
			},
			addcmenu:function(){
				if($.isEmptyObject($CURRENTNODE) || $CURRENTNODE.levels!=1){
					$.messager.alert("消息","请选择一个主菜单","warning");
					return false;
				}
				$MENU.id=undefined;
				$MENU.parentid=$CURRENTNODE.id;
				$("#menudialog").dialog("openl");
			}
	};
	
});
//获得tree的层数  
var easyui_tree_options = {  
    length : 0,  //层数  
    getLevel : function(treeObj, node){ //treeObj为tree的dom对象，node为选中的节点  
        while(node != null){  
            node = $(treeObj).tree('getParent', node.target);
            easyui_tree_options.length++;  
        }  
        var length1 = easyui_tree_options.length;  
        easyui_tree_options.length = 0;     //重置层数  
        return length1;  
    }  
};