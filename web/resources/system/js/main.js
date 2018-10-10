$(function(){
	
	/**
	 * 初始化
	 */
	$.post($webURI+"/system/index/getMainPage.action",function(data){
		//页面缓存
		//$("#cacheDATA").data("PAGECACHE",data);
		var mhtml = "";
		for (var int = 0; int < data.length; int++) {
			mhtml += "<li>";
			mhtml += ("<p data=\""+data[int].url+"\" isopen=\""+data[int].isnewpage+"\">"+data[int].title);
			if(data[int].cmenus.length>0){
				mhtml += ("<img src=\""+$staticURI+"/system/imgs/8.png\"></p>");
			}else{
				mhtml += ("</p>");
			}
			for (var int2 = 0; int2 < data[int].cmenus.length; int2++) {
				mhtml += ("<div data=\""+data[int].cmenus[int2].url+"\" isopen=\""+data[int].cmenus[int2].isnewpage+"\">"+data[int].cmenus[int2].title+"</div>");
			}
			mhtml += "</li>";
		}
		$("#left ul").append(mhtml);
		
		//初始化打开第一项
		var fdom = $("#left li:first p").attr("data");
		if(fdom==""){
			$("#left li:first p").click();
			$("#left li:first div:first").click();
		}else{
			$("#left li:first p").click();
		}
		
	},"json");
	
	/**
	 * 点击左侧右侧打开或更新tabs
	 */
	$(document).on("click","#left ul li div,#left ul li p",function(){
		if($(this).attr("data")==""){
			$(this).nextAll().toggle("fast");
		}else{
			var titles = $(this).text(),newopen = $(this).attr('isopen'),urls = $webURI+$(this).attr('data');
			if(newopen==0){
				openTab(titles,urls);
			}else{
				window.open(urls);
			}
		}
	});
	/**
	 * 初始化tabs
	 */
	$('#right').tabs({
	    border:false, 
	    height:'89%',
	    plain:true
	});  
});
/**
 * 新增或更新tabs方法
 */
function openTab(title,href){
    var e = $('#right').tabs('exists',title);
    if(e){
    	$("#right").tabs('select',title);
        var tab = $("#right").tabs('getSelected');
        $('#right').tabs('update',{
            tab:tab,
            options:{
                title:title,
                content:'<iframe src="'+href+'" width="100%" height="100%"></iframe>',
                closable:true,
                selected:true
            }
        });
    }else{
        $('#right').tabs('add',{
            title:title,
            content:'<iframe src="'+href+'" width="100%" height="100%"></iframe>',
            iconCls:'',
            closable:true
        });
    }
};
function quitlog(){
	$.messager.confirm('确认','您确认退出吗？',function(r){
	    if (r){
	    	$.post($webURI+"/system/index/quitlog.action",function(data){
	    		window.location.href=$webURI;
	    	});
	    }    
	});
};
function changekl(){
	var urlt = $webURI+"/system/index/toPage.action?page=changekl";
	openTab("修改口令",urlt);
};
