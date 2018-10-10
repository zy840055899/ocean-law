<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
    var $path = '<%=path%>';
    if (window.frames.length != parent.frames.length) {
        top.location.href=$path;
    }
</script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="<%=path%>/resources/jquery-easyui-1.5.2/themes/default/easyui.css"/>
	<link type="text/css" rel="stylesheet" href="<%=path%>/resources/jquery-easyui-1.5.2/themes/icon.css"/>
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/main/styles/global.css"/>
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/main/styles/other.css"/>
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/css/share.css"/>
	<link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/css/chatstyle.css"/>
	<title>海洋智能执法系统</title>
	<script type="text/javascript" src="<%=path%>/resources/js/base/jquery.min-1.11.3.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/portal/main/js/jquery-accordion-menu.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/portal/main/js/page.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/portal/main/js/details.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/portal/js/chat.js"></script>
     <script type="text/javascript">
    	<%--var currentUser = '${LOGSYSUSER.nicname }';--%>
	</script>
</head>

<body style="overflow:hidden;">
    <div class="top">
        <a href="#" class="logo" style="color: #ffffff;">海洋智能执法系统</a>
        <div class="top_date" id="showtime"></div>
        <div class="top_right">
            <a href="#">
                <img class="top_head" src="<%=path%>/resources/portal/main/images/top_head.png" />
                <span class="top_name">Hi , ${LOGSYSUSER.nicname }</span>
                <b><img src="<%=path%>/resources/portal/main/images/top_head_sanjiao.png" /></b>
                <ul class="top_right_hide">
                    <li class="hide_key"><a href="##" onclick="changekl()">修改口令</a></li>
                    <li class="hide_quit"><a href="##" onclick="quitlog()">退出登录</a></li>
                </ul>
            </a>
        </div>
    </div>
    <!--top end-->
    
    <div class="left">
        <div class="amenu">
            <div id="jquery-accordion-menu" class="jquery-accordion-menu red">
                <ul id="demo-list">
					<li><a onclick="main.click('','0','行政执法')" id="index_0" href="##" class=""><span class="ink animate-ink"
																									 style="height: 230px; width: 230px; top: -81px; left: 18px;"></span><i
							class="fa"><img src="/XZZFStatic/resources/portal/main/images/menu_1.png"></i>行政执法
						<div class="menu_libg"></div>
						<span class="submenu-indicator">&gt;</span></a>
						<ul class="submenu" style="display: none;">
							<li><a class="noactive active" onclick="main.click('/portal/itask/toPage.action?p=itask','0','执法计划',this)"
								   id="indexs_0_0" href="##">执法计划</a></li>
							<li><a class="noactive"
								   onclick="main.click('/portal/casem/topage.action?p=/portal/casem/casem','0','案件管理',this)" id="indexs_0_1"
								   href="##">案件管理</a></li>
							<li><a class="noactive" onclick="main.click('/portal/casehanding/toPage.action','0','案件办理',this)"
								   id="indexs_0_2" href="##">案件办理</a></li>
							<li><a class="noactive" onclick="main.click('/portal/revicew/toPage.action','0','整改复查',this)" id="indexs_0_3"
								   href="##">整改复查</a></li>
							<li><a class="noactive" onclick="main.click('/portal/checkrecord/toPage.action','0','检查记录',this)"
								   id="indexs_0_4" href="##">检查记录</a></li>
						</ul>
					</li>
					<li><a onclick="main.click('','0','知识库')" id="index_2" href="##"><i class="fa"><img
							src="/XZZFStatic/resources/portal/main/images/menu_1.png"></i>知识库
						<div class="menu_libg"></div>
						<span class="submenu-indicator">&gt;</span></a>
						<ul class="submenu" style="">
							<li><a class="noactive" onclick="main.click('/portal/laws/topage.action?p=/portal/laws/laws','0','法律法规',this)"
								   id="indexs_2_0" href="##">法律法规</a></li>
							<li><a class="noactive" onclick="main.click('/portal/danger/toDanger.action','0','危化特性',this)" id="indexs_2_1"
								   href="##">危化特性</a></li>
							<li><a class="noactive" onclick="main.click('/portal/laws/topage.action?p=/portal/laws/laws2','0','标准规范',this)"
								   id="indexs_2_2" href="##">标准规范</a></li>
						</ul>
					</li>
					<li><a onclick="main.click('','0','统计分析')" id="index_3" href="##"><i class="fa"><img
							src="/XZZFStatic/resources/portal/main/images/menu_1.png"></i>统计分析
						<div class="menu_libg"></div>
						<span class="submenu-indicator">&gt;</span></a>
						<ul class="submenu" style="">
							<li><a class="noactive" onclick="main.click('/portal/count/topage.action?p=plant','0','执法任务统计',this)"
								   id="indexs_3_0" href="##">执法任务统计</a></li>
							<li><a class="noactive" onclick="main.click('/portal/count/topage.action?p=case','0','执法案件统计',this)"
								   id="indexs_3_1" href="##">执法案件统计</a></li>
							<li><a class="noactive" onclick="main.click('/portal/count/topage.action?p=map','0','执法情况分布',this)"
								   id="indexs_3_2" href="##">执法情况分布</a></li>
						</ul>
					</li>
					<li><a onclick="main.click('','0','系统管理')" id="index_6" href="##"><i class="fa"><img
							src="/XZZFStatic/resources/portal/main/images/menu_1.png"></i>系统管理
						<div class="menu_libg"></div>
						<span class="submenu-indicator">&gt;</span></a>
						<ul class="submenu" style="">
							<li><a class="noactive" onclick="main.click('/system/index/toPage.action?page=syslog','0','系统登陆日志',this)"
								   id="indexs_6_0" href="##">系统登陆日志</a></li>
						</ul>
					</li>
				</ul>
            </div>
            <script type="text/javascript" src="<%=path%>/resources/portal/main/js/main.js"></script>
        </div>
    </div>
    <!--left end-->

    <div class="right">
        <div class="right_content">
        <div class="right_top">
            <dl class="breadcrumb">
                <dt>当前位置：</dt>
                <dd><a href="##" id="content_title" onclick="content.window.location.reload()">首页</a></dd>
            </dl>
            <div style="position:fixed; right: 0px; top: 80%; height:30px; width:100px; background: #ffffff; text-align: center; ">
			<a href="javascript:void(0)" onclick="openChatWin()" style="cursor:hand;"><img style="float: left;" src="<%=path%>/resources/portal/imgs/lt.png" alt="在线聊天" width="35px" height="30px" /><span id="msgSpan" style="float: left;text-align: center; line-height: 30px; padding-left: 5px; color: #000000;">互动聊天</span></a>
		</div>
		<!-- 聊天 -->
		<div id="msgInfoWin" style="display:none; width:850px;height:550px; background: #fafafa;">
			<div id="layoutDiv" class="easyui-layout" fit="true" style="width: 100%; height: 100%; overflow: auto;">
				<div class="lt_cont">
					<div class="le_cont_left">
			            <div class="le_cont_left_header">
			            </div>
			            <div class="search_bar">
			                <i></i>
			                <input type="text" placeholder="搜索" />
			            </div>
			            <!--/search_bar-->
			            <div class="nav_tab">
			                <div class="nav_tab_item">
			                    <a class="active" title="聊天"><i class="web_wechat_tab_chat"></i></a>
			                </div>
			                <div class="nav_tab_item nav_tab_item2">
			                    <a title="通讯录"><i class="web_wechat_tab_friends"></i></a>
			                </div>
			            </div>
			            <div class="nav_cont show" style="top: 120px;">
			               <div id="masterDIV" class="nav_view"></div>
			            </div>
			            <div class="nav_cont qunzu" style="top: 120px;">
			                <div id="contactDIV" class="nav_view">
			                </div>
			            </div>
			        </div>
			        <div class="le_cont_right">
			            <div class="le_cont_right_title">
			                <div class="le_cont_right_title_btn" id="chatTitleDIV"><a id="chatTitle"></a><i></i></div>
			            </div>
			            <!--/le_cont_left-->
			            <!--/隐藏内容 群组成员-->
			            <div id="memberDIV" class="member">
			                
			            </div>
			            <!--/隐藏内容end-->
			            <div id="msgContentDiv" class="le_cont_right_top">
			                
			            </div>
			            <div class="le_cont_right_foot">
			                <div class="le_cont_right_foot_sc"><a class="le_cont_right_foot_sc_btn"></a></div>
			                <div class="le_cont_right_foot_cont">
			                    <textarea id="sendMsgTV"></textarea>
			                </div>
			                <div class="le_cont_right_foot_action"><a onclick="sendMsg()" id="sendBtn">发送</a></div>
			            </div>
			        </div>
				</div>
			</div>
		</div>
		
		<div id="imgWin" style="display:none; width:800px;height:500px; background: #fafafa;">
			<div class="easyui-layout" fit="true" style="width: 100%; height: 100%; overflow: auto;">
				<img id="bigImg" src="" alt="大图" style="display: inline-block; height: auto; max-width: 100%; " />
			</div>
		</div>
        </div>
        <div id="frameDIV">
        	<iframe id="content" name="content"></iframe>
        </div>
        </div>
    </div>
    <!--right end-->
    <div style="clear: both;"></div>
    <div style="width: 100%;height: 25px;line-height: 30px;text-align: center;color: #ffffff">
		海洋智能执法系统&emsp;&emsp;&emsp;系统研发：江苏金鸽网络科技有限公司&emsp;&emsp;&emsp;Copyright © 2010-2020 JINGE Corporation, All Rights Reserved
	</div>
    <!--bottom end-->
    
    <script type="text/javascript">
    	var tempch = document.body.clientHeight;
		$("#frameDIV").css({"height":tempch-59-100-5-25});
		$("#content").css({"height":"100%","width":"100%"});
		//选项卡切换
        $(".nav_tab_item a").click(function(){
            $(this).addClass("active").parent().siblings().find("a").removeAttr("class");
        });
        $(".nav_tab_item").click(function(){
            $(".nav_cont").eq($(".nav_tab_item").index(this)).addClass("show").siblings().removeClass('show'); 
        });
        $(".le_cont_right_title_btn").click(function(){
            $(this).toggleClass("le_cont_right_title_btn_active");
        });
        window.onload = function () {
        	
        	$(window).resize(function(){
        		var tempch2 = document.body.clientHeight;
        		$("#frameDIV").css({"height":tempch2-59-100-5-25});
        		$("#content").css({"height":"100%","width":"100%"});
        		/**让datagrade重新加载*/
        		content.window.location.reload();
        	}); 
        	
        	
            document.onclick = function (e) {
                  $(".mmpop").hide();
                  $(".member").hide();
            }
            $(".le_cont_left_header a").bind("click", function (e) {
				if ($(".mmpop").css("display") == "none") 
				{
					$(".mmpop").show();
				} 
				else 
				{
					$(".mmpop").hide();
				}
				e = e || event; stopFunc(e);
            });
            
			$(".le_cont_right_title_btn").bind("click", function (e) {
				if ($(".member").css("display") == "none") 
                {
					if(currentMasterId && currentChatType == "groupchat")
					{
						$(".member").show();
						var masterObj = chatMasters[currentMasterId];
						if (masterObj && masterObj.memberHtml && masterObj.memberHtml != '')
						{
							$("#memberDIV").html(masterObj.memberHtml);
						}
						else
						{
							$("#memberDIV").html('<img src="<%=path%>/resources/portal/imgs/load.gif" /><span>正在获取成员信息。。。</span>');
							var param = {masterId:currentMasterId};
							$.ajax({
								url: $webURI+"/portal/chat/getMasterMembers.action",
								//url: _bp + '/chatManager.do?method=getMasterMembers',
								type: 'post',
								data: param,
								async: false,
								dataType:'json',
								error:function(){
									$("#memberDIV").html('数据异常');
								},
								success:function(data){
									if (data)
									{
										if (data.code>0)
										{
											var memberHtml = '';
											if (data.members)
											{
												var members = data.members;
												if (members && members.length > 0)
												{
													memberHtml = '<ul id="memberUL" class="member_list">';
													for (var i = 0; i < members.length; i++)
													{
														memberHtml += '<li userName="' + members[i].memberUser + '"><a href=""></a>' + members[i].memberUserName + '</li>';
													}
													memberHtml += '</ul>';
												}
											}
											if (masterObj)
											{
												masterObj.memberHtml = memberHtml;
											}
											$("#memberDIV").html(memberHtml);
										}
										else
										{
											$("#memberDIV").html(data.content);
										}
									}
									else
									{
										alert("数据异常！");
									}
								}
							});
						}
					}
                } 
                else 
                {
					$(".member").hide();
                }
                e = e || event; stopFunc(e);
			});
			//阻止向上传递事件
            $(".mmpop").bind("click", function (e) {
                  e = e || event; stopFunc(e);
            });
			//阻止向上传递事件
			$(".member").bind("click", function (e) {
                e = e || event; stopFunc(e);
			});
		}
		
		function stopFunc(e) 
		{
            e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
		}
		function openChatWin()
		{
			showWindowBox($("#msgInfoWin"), "即时聊天", 850, 550);
			var msgContentDiv = document.getElementById("msgContentDiv");
			msgContentDiv.scrollTop = msgContentDiv.scrollHeight;
		}
		function openImgWin(imgUrl)
		{
			$("#bigImg").attr("src", imgUrl);
			showWindowBox($("#imgWin"), "即时聊天", 800, 500);
		}
		function showWindowBox(obj,title,width,height)
	  	{
		  	obj.show();
			obj.window({
				title : title,
				top:($(window).height() - height) * 0.5 + $(document).scrollTop(),
				left:($(window).width() - width) * 0.5,
				//icon:"icon-save",
				draggable:true,
				resizable:true,
				modal:true,
				shadow:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				onBeforeOpen:function(){
					$("body").css("overflow", "hidden");
				},
				onBeforeClose:function(){
					$("body").css("overflow", "auto");
				}
			});
		}
	</script>
</body>
</html>