(function($) {
                	
    $.post($webURI+"/system/index/getMainPage.action",function(data){
		//页面缓存
		//$("#cacheDATA").data("PAGECACHE",data);
		var mhtml = "";
		for (var int = 0; int < data.length; int++) {
			mhtml += "<li>";
			mhtml += ("<a  onclick=\"main.click('"+data[int].url+"','"+data[int].isnewpage+"','"+data[int].title+"')\"  id=\"index_"+int+"\" href=\"##\">"
			+"<i class=\"fa\"><img src=\""+$staticURI+"/portal/main/images/menu_1.png\"/></i>"+data[int].title+"<div class=\"menu_libg\"></div></a>");
			if(data[int].cmenus.length>0){
				mhtml += ("<ul class=\"submenu\">");
				for (var int2 = 0; int2 < data[int].cmenus.length; int2++) {
    				mhtml += ("<li><a class=\"noactive\" onclick=\"main.click('"+data[int].cmenus[int2].url+"','"+data[int].cmenus[int2].isnewpage+"','"+data[int].cmenus[int2].title+"',this)\" id=\"indexs_"+int+"_"+int2+"\" href=\"##\">"+data[int].cmenus[int2].title+"</a></li>");
    			}
				mhtml += ("</ul>");
			}
			mhtml += "</li>";
		}
		$("#demo-list").append(mhtml);
		
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
		
		//初始化打开第一项
		$("#index_0").click();
		$("#indexs_0_0").click();
	},"json");
    
    main={
    		click:function(a,b,c,d){
    			if(a==""){
        			return  false;
        		}else{
        			if(b==0){
        				$(".noactive").removeClass("active");
        				$(d).addClass("active");
        				openWin(c,a);
        			}else{
        				window.open($webURI+a);
        			}
        		}
    		}
    };
    
    showTime();
    
})(jQuery);

function quitlog(){
	$.messager.confirm('确认','您确认退出吗？',function(r){
	    if (r){    
	    	$.post($webURI+"/system/index/quitlog.action",function(data){
	    		top.location.href=$webURI;
	    	});
	    }    
	});
};
function changekl(){
	openWin("修改口令","/system/index/toPage.action?page=changekl");
};

function openWin(a,b){
	$("#content_title").text(a);
	$("#content").attr("src",$webURI+b);
};
   
function showTime(){
  var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
  var time=new Date();
  var year=time.getFullYear();
  var month=time.getMonth();
  var date=time.getDate();
  var day=time.getDay();
  var hour=time.getHours();
  var minutes=time.getMinutes();
  var second=time.getSeconds();
  month=month+1;
  month<10?month='0'+month:month;
  hour<10?hour='0'+hour:hour;
  minutes<10?minutes='0'+minutes:minutes;
  second<10?second='0'+second:second;
  var now_time=year+'年'+month+'月'+date+'日'+'&emsp;'+show_day[day]+'&emsp;'+hour+':'+minutes+':'+second;
  document.getElementById('showtime').innerHTML=now_time;
  setTimeout("showTime();",1000); //动态调取时间
}