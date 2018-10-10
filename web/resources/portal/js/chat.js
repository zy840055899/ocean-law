// JavaScript Document
var chatMasters = {};
var queryFlag = false;
var lastTime = 0;
var currentMasterId = '';
var currentChatType = '';
var contactHtml = "";// 联系人信息
var allNotReadNum = 0;
$(document).ready(function(){
	setInterval("handleChat()", 3000);
	handleChat();
	queryContacts();
});

/**
 * 通讯录信息
 */
function queryContacts()
{
	$.ajax({
		//url: _bp + '/chatManager.do?method=queryContacts',
		url: $webURI+"/portal/chat/queryContacts.action",
		type: 'post',
		dataType:'json',
		error:function(){
		},
		success:function(data){
			if (data)
			{
				var masters = data.masters;
				var allUsers = data.allUsers;
				handleContacts(masters, allUsers);
			}
		}
	});
}
/**
 * 联系人信息
 * @param masters 群组信息
 * @param allUsers 联系人
 */
function handleContacts(masters, allUsers)
{
	contactHtml = "";
	if (masters && masters.length > 0)
	{
		for (var i = 0; i < masters.length; i++)
		{
			contactHtml += '<div onclick="changeChatMaster(this)" chatType="groupchat" masterName="' + masters[i].masterName + '" masterId="' + masters[i].masterId + '" class="nav_view_list" ><span>' + masters[i].masterName + '</span></div>';
		}
	}
	if (allUsers && allUsers.length > 0)
	{
		for (var i = 0; i < allUsers.length; i++)
		{
			contactHtml += '<div onclick="changeChatMaster(this)" chatType="privatechat" masterName="' + allUsers[i].lawerName + '" masterId="' + allUsers[i].masterId + '" userName="' + allUsers[i].userName + '" class="nav_view_list"><span>' + allUsers[i].lawerName + '</span></div>';
		}
	}
	$("#contactDIV").html(contactHtml);
}

/**
 * 获取最新聊天信息
 */
function handleChat()
{
	if (!queryFlag)
	{
		queryFlag = true;
		$.ajax({
			//url: _bp + '/chatManager.do?method=queryChatMsgs',
			url: $webURI+"/portal/chat/queryChatMsgs.action",
			type: 'post',
			data:{lastTime:lastTime},
			dataType:'json',
			error:function(){
				queryFlag = false;
			},
			success:function(data){
				if (data)
				{
					var masters = data.masters;
					var messages = data.messages;
					var lastTimeT = data.lastTime;
					if (lastTimeT && parseFloat(lastTimeT))
					{
						lastTime = parseFloat(lastTimeT);
					}
					handleNewMsgs(masters, messages);
				}
				queryFlag = false;
				handleMsgSpan();
			}
		});
	}
}

function handleMsgSpan()
{
	if (allNotReadNum > 0)
	{
		$("#msgSpan").html("有新消息");
		$("#msgSpan").css("color","#CC0000");
	}
	else
	{
		$("#msgSpan").html("互动聊天");
		$("#msgSpan").css("color","#000000");
	}
}

/**
 * 处理新消息
 * @param masters
 * @param messages
 */
function handleNewMsgs(masters, messages)
{
	if (masters && masters.length > 0)
	{
		console.log(chatMasters);
		for (var i = 0; i < masters.length; i++)
		{
			var masterId = masters[i].masterId;
			var master = null;
			if (masterId)
			{
				master = chatMasters[masterId];
				if (master)
				{// 存在 先将原来的聊天主体remove在插入新的
					$("#"+masterId).remove();
					master.lastType = masters[i].lastType;
					master.lastContent = masters[i].lastContent;
					master.senderName = masters[i].senderName;
					master.lastTime = masters[i].lastTime;
				}
				else
				{// 不存在新建
					master = {
						masterId: masterId,
						masterName: masters[i].masterName,
						chatType: masters[i].chatType,
						lastType: masters[i].lastType,
						lastContent : masters[i].lastContent,
						senderName: masters[i].senderName,
						lastTime: masters[i].lastTime,
						chatUserName: masters[i].chatUserName,
						creatUser: masters[i].creatUser,
						creatUserName: masters[i].creatUserName,
						readCount: 0,
						chatHtml: "", // 聊天内容页面html
						memberHtml: "" // 聊天成员信息
					};
					chatMasters[masterId] = master;
				}
				var masterHtml = '	<div onclick="changeHistoryMaster(this)" id="' + masterId + '" class="nav_view_list">';
				if (master.chatType == "privatechat")
				{
					if (currentUser == master.creatUser)
					{
						masterHtml += '			<span>' + master.chatUserName + '</span>';
					}
					else
					{
						masterHtml += '			<span>' + master.creatUserName + '</span>';
					}
				}
				else
				{
					masterHtml += '			<span>' + master.masterName + '</span>';
				}
				masterHtml += '			<i style="display: none;" id="msgNum' + masterId + '">' + master.readCount + '</i>';
				if (master.lastType == 'TXT')
				{
					masterHtml += '		<div class="nav_view_list_div">' + master.senderName + ':' + master.lastContent + '</div>';
				}
				else if (master.lastType == 'IMAGE')
				{
					masterHtml += '		<div class="nav_view_list_div">' + master.senderName + ':[图片]</div>';
				}
				else if (master.lastType == 'VOICE')
				{
					masterHtml += '		<div class="nav_view_list_div">' + master.senderName + ':[语音]</div>';
				}
				masterHtml += '		</div>';
				
				document.getElementById("masterDIV").insertAdjacentHTML("afterBegin", masterHtml);
			}
		}
		
		if (messages && messages.length > 0)
		{
			for (var i = 0; i < messages.length; i++)
			{
				var masterId = messages[i].masterId;
				if (masterId)
				{
					var master = chatMasters[masterId];
					if (master)
					{
						var chatHtml = '';
						if (messages[i].sender)
						{
							if (messages[i].sender == currentUser)
							{// 我发的
								if (messages[i].type == "TXT")
								{
									chatHtml += '<div class="le_cont_right_date">' + dateFormatUtil(messages[i].sendTime) + '</div>';
									chatHtml += '<div class="le_cont_right_me">';
									chatHtml += '	<div class="le_cont_right_name">' + messages[i].senderName + '</div>';
									chatHtml += '	<div class="le_cont_right_detail"><i></i>';
									chatHtml += '		<div class="le_cont_right_detail_text">' + messages[i].content + '</div>';
									chatHtml += '	</div>';
									chatHtml += '</div>';
								}
								else
								{
									
								}
							}
							else
							{// 别人发的
								if (messages[i].type == "TXT")
								{
									master.readCount = master.readCount + 1;
									allNotReadNum++;
									chatHtml += '<div class="le_cont_right_date">' + dateFormatUtil(messages[i].sendTime) + '</div>';
									chatHtml += '<div class="le_cont_right_other">';
									chatHtml += '	<div class="le_cont_right_name">' + messages[i].senderName + '</div>';
									chatHtml += '	<div class="le_cont_right_detail"><i></i>';
									chatHtml += '		<div class="le_cont_right_detail_text">' + messages[i].content + '</div>';
									chatHtml += '	</div>';
									chatHtml += '</div>';
								}
								else
								{
									var finish = messages[i].fileMsg.finish;
									if (finish && finish == 1)
									{
										master.readCount = master.readCount + 1;
										allNotReadNum++;
										chatHtml += '<div class="le_cont_right_date">' + dateFormatUtil(messages[i].sendTime) + '</div>';
										chatHtml += '<div class="le_cont_right_other">';
										chatHtml += '	<div class="le_cont_right_name">' + messages[i].senderName + '</div>';
										if (messages[i].type == "IMAGE")
										{// 图片
											chatHtml += '	<div class="le_cont_right_detail" style="cursor: pointer;"><i></i>';
											chatHtml += '		<img onclick="showBigPic(this)" src="'+ messages[i].fileMsg.url + '" />';
											chatHtml += '	</div>';
										}
										else if (messages[i].type == "VOICE")
										{// 语音
											chatHtml += '	<div class="le_cont_right_detail" style="cursor: pointer; padding:2px;"><i></i>';
											chatHtml += '		<img name="voicePlay" style="float:left; width:14px; height:20px;" showTime="' + messages[i].fileMsg.length + '" onclick="play(this)" src="'+$staticURI+'/imgs/sound.png" wavURL="' + messages[i].fileMsg.url + '" /><div style="padding-left:5px; float:left; height:20px; line-height:20px;"> 语音：' + messages[i].fileMsg.length / 1000 + '秒</div>';
											chatHtml += '	</div>';
										}
										chatHtml += '</div>';
									}
								}
							}
						}
						master.chatHtml = master.chatHtml + chatHtml;
						if (currentMasterId == masterId)
						{
							master.readCount = 0;
							$("#msgNum" + masterId).hide();
						}
						else
						{
							$("#msgNum" + masterId).show();
						}
						$("#msgNum" + masterId).html(master.readCount);
					}
				}
				
			}
		}
		
		if (currentMasterId)
		{
			$("#" + currentMasterId).click();
		}
	}
}

/**
 * 发送消息
 */
function sendMsg()
{
	var msg = $("#sendMsgTV").val();
	if (msg)
	{
		msg = $.trim(msg);
		if (!msg)
		{
			alert("请先输入要发送的内容");
			return;
		}
	}
	else
	{
		alert("请先输入要发送的内容");
		return;
	}
	
	if (currentMasterId)
	{
		$("#sendMsgTV").val("");
		var param = {masterId:currentMasterId, content:msg, type:"TXT"};
		$.ajax({
			//url: _bp + '/chatManager.do?method=saveMessage',
			url: $webURI+"/portal/chat/addMessage.action",
			type: 'post',
			data: param,
			dataType:'json',
			error:function(){
				alert("发送消息异常");
			},
			success:function(data){
				if (data)
				{
					if (data.code >0)
					{
						handleChat();
					}
					else
					{
						alert(data.msg);
					}
				}
				else
				{
					alert("发送消息失败");
				}
			}
		});
	}
	else
	{
		alert("请先选择聊天的对象");
		return;
	}
}

/**
 * 点击联系人后改变ui与聊天对象信息
 * @param obj
 */
function changeChatMaster(obj)
{
	$(obj).addClass("active").siblings().removeClass("active");
	$(".member").hide();
	$("#chatTitleDIV").attr("class", "le_cont_right_title_btn");
	var chatType = $(obj).attr("chatType");
	var masterId = $(obj).attr("masterId");
	var masterName = $(obj).attr("masterName");
	if (!masterName)
	{
		masterName = "";
	}
	$("#msgContentDiv").html("");
	$("#memberDIV").html("");
	if (masterId!=null && masterId!="undefined" && masterId!="")
	{
		currentMasterId = masterId;
		currentChatType = chatType;
		var masterObj = chatMasters[currentMasterId];
		if (masterObj)
		{// 本地存在聊天信息 则将对应的聊天信息覆盖
			currentChatType = masterObj.chatType;
			allNotReadNum = allNotReadNum - masterObj.readCount;
			$("#msgContentDiv").html(masterObj.chatHtml);
			masterObj.readCount = 0;
			$("#msgNum" + masterId).html("0");
			$("#msgNum" + masterId).hide();
			var msgContentDiv = document.getElementById("msgContentDiv");
			msgContentDiv.scrollTop = msgContentDiv.scrollHeight;
		}
		handleMsgSpan();
	}
	else
	{
		currentMasterId = "";
		currentChatType = "";
		if (chatType == "groupchat")
		{
			alert("群组信息错误");
		}
		else if (chatType == "privatechat")
		{
			var userName = $(obj).attr("userName");
			if (!userName)
			{
				return;
			}
			var param = {chatUser:userName};
			$.ajax({
				//url: _bp + '/chatManager.do?method=createPrivateMaster',
				url: $webURI+"/portal/chat/createPrivateMaster.action",
				type: 'post',
				data: param,
				async: false,
				dataType:'json',
				error:function(){
					alert("数据异常");
				},
				success:function(data){
					if (data)
					{
						if (data.code>0)
						{
							currentMasterId = data.master.masterId;
							currentChatType = data.master.chatType;
							$(obj).attr("masterId", currentMasterId);
						}
						else
						{
							alert(data.msg);
						}
					}
					else
					{
						alert("发起聊天异常！");
					}
				}
			});
		}
	}
	$("#chatTitle").html(masterName);
}

/**
 * 历史聊天记录点击事件
 * @param obj
 */
function changeHistoryMaster(obj)
{
	var masterId = $(obj).attr("id");
	if (!masterId)
	{
		return;
	}
	$("#memberDIV").html("");
	var masterObj = chatMasters[masterId];
	if (masterObj)
	{
		currentMasterId = masterId;
		currentChatType = masterObj.chatType;
		$(obj).addClass("active").siblings().removeClass("active");
		$(".member").hide();
		$("#chatTitleDIV").attr("class", "le_cont_right_title_btn");
		// 本地存在聊天信息 则将对应的聊天信息覆盖
		allNotReadNum = allNotReadNum - masterObj.readCount;
		handleMsgSpan();
		$("#chatTitle").html($(obj).find('span').html());
		$("#msgContentDiv").html(masterObj.chatHtml);
		masterObj.readCount = 0;
		$("#msgNum" + masterId).html("0");
		$("#msgNum" + masterId).hide();
		var msgContentDiv = document.getElementById("msgContentDiv");
		msgContentDiv.scrollTop = msgContentDiv.scrollHeight;
	}
}

/**
 * 显示大图
 * @param obj
 */
function showBigPic(obj)
{
	var imgUrl = $(obj).attr("src");
	if (imgUrl)
	{
		openImgWin(imgUrl);
	}
}

/**
 * 事件转换
 * @param longTypeDate
 * @returns {String}
 */
function dateFormatUtil(longTypeDate)
{  
    var dateTypeDate = "";  
    var date = new Date();  
    date.setTime(longTypeDate);  
    dateTypeDate += getMonth(date);//月   
    dateTypeDate += "-" + getDay(date);//日  
    dateTypeDate += " " + getHours(date);//时
    dateTypeDate += ":" + getMinutes(date);//分
    dateTypeDate += ":" + getSeconds(date);//秒
    return dateTypeDate;  
}

/**
 * 返回 01-12 的月份值  
 * @param date
 * @returns {String}
 */
function getMonth(date)
{  
    var month = "";
    month = date.getMonth() + 1; //getMonth()得到的月份是0-11
    if(month < 10)
    {
        month = "0" + month;
    }
    return month;
}
  
/**
 * 返回01-30的日期
 * @param date
 * @returns {String}
 */
function getDay(date)
{
    var day = "";
    day = date.getDate();
    if(day < 10)
    {
        day = "0" + day;
    }
    return day;
}

/**
 *  返回小时
 * @param date
 * @returns {String}
 */
function getHours(date)
{
	var hour = "";
	hour = date.getHours();
	if (hour < 10)
	{
		hour = "0" + hour;
	}
	return hour;
}

/**
 * 获取时间分钟
 * @param date 
 * @returns {String}
 */
function getMinutes(date)
{
	var minutes = "";
	minutes = date.getMinutes();
	if (minutes < 10)
	{
		minutes = "0" + minutes;
	}
	return minutes;
}

/**
 * 获取秒数
 * @param date
 * @returns {String}
 */
function getSeconds(date)
{
	var seconds = "";
	seconds = date.getSeconds();
	if (seconds < 10)
	{
		seconds = "0" + seconds;
	}
	return seconds;
}
// 语音播放
var audioCtx;
function play(obj)
{
	$("img[name='voicePlay']").attr("src", _bp +"/images/sound.png");
	$(obj).attr("src", _bp +"/images/sound.gif");
	//var showTime = parseInt($(obj).attr("showTime"));
	var xhr = new XMLHttpRequest();
    xhr.open('GET', $(obj).attr("wavURL"));
    xhr.responseType = 'blob';
    xhr.onload = function() {
    	//if (showTime)
    	//{
    	//	setTimeout();
    	//}
        playAmrBlob(this.response);
    };
    xhr.send();
}
function playAmrBlob(blob, callback)
{
    readBlob(blob, function(data) {
      playAmrArray(data);
    });
}

function readBlob(blob, callback)
{
    var reader = new FileReader();
    reader.onload = function (e) {
        var data = new Uint8Array(e.target.result);
        callback(data);
    };
    reader.readAsArrayBuffer(blob);
}

function playAmrArray(array) 
{
	if (audioCtx && audioCtx.state == 'running')
	{
		audioCtx.close();
		audioCtx = null;
	}
    var samples = AMR.decode(array);
    if (!samples) 
    {
        alert('Failed to decode!');
        return;
    }
    playPcm(samples);
}

function playPcm(samples) 
{
	audioCtx = new AudioContext();
    var src = audioCtx.createBufferSource();
    var buffer = audioCtx.createBuffer(1, samples.length, 8000);
    buffer.copyToChannel(samples, 0, 0);
    src.buffer = buffer;
    src.connect(audioCtx.destination);
    src.start();
}