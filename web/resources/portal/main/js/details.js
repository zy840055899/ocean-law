 $(document).ready(function(){
	    //点击.top_right b时要阻止冒泡，否则.top_right_hide是不显示的，
        //因为冒泡了，会执行到下面的方法。
        function stopPropagation(e) {
            var ev = e || window.event;
            if (ev.stopPropagation) {
                ev.stopPropagation();
            }
            else if (window.event) {
                window.event.cancelBubble = true;//兼容IE
            }
        }
        $(".top_right b").click(function (e) {
            $(".top_right_hide").show();
            stopPropagation(e);
        });
        $(document).bind('click', function () {
            $(".top_right_hide").hide();
        });
        $(".top_right_hide").click(function (e) {
            stopPropagation(e);
        });
		
     
        //左侧导航菜单二级菜单点击状态
        $("#demo-list li ul li a").click(function(){
            $(".active").removeClass("active");
            $(this).addClass("active");
        });

    });


