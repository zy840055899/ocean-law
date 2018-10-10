$.extend($.fn.dialog.methods, {    
    openl: function(jq){    
        return jq.each(function(){
            $(this).dialog('open');    
        });    
    }    
});
$.extend($.fn.pagination.defaults, {    
	buttons:[{
		iconCls:'icon-search',
		text:'GO',
		handler:function(){
			var e = jQuery.Event("keydown");//模拟一个键盘事件
            e.keyCode =13;//keyCode=13是回车
			$(this).parents("tr").find(".pagination-num").trigger(e);
		}
	}]
});
$(function(){
	$(document).on("click","img.imgyt",function(){
		window.open($(this).prop("src"));
	});
	
	$(document).on("click","img.vidyt",function(){
		window.open($(this).attr("data"));
	});
	
	$(document).on("mousemove","img.vidyt",function(){
		$(this).prop("src",$staticURI+"/imgs/sp2.png");
	});
	$(document).on("mouseout","img.vidyt",function(){
		$(this).prop("src",$staticURI+"/imgs/sp1.png");
	});
	
});

function strsubX(a,b){
	if(a.length>b){
		return a.substr(0,b)+" ..."
	}else{
		return a;
	}
};
function isEmpty(a){
	if (a == null || a == undefined || a == '') { 
		return false; 
	} else{
		return true;
	}
};