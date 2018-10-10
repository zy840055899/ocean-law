<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
    var $path = '<%=path%>';
    if (window.frames.length != parent.frames.length) {
    	top.location.href=$path;
    }
</script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>login</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/main/styles/global.css"/>
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/main/styles/other.css"/>
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/portal/main/styles/login.css"/>
    <script type="text/javascript" src="<%=path%>/resources/js/base/jquery.min-1.11.3.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/base/MD5.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/base/base64.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/portal/main/js/login.js"></script>
</head>

<body class="login_bg">
    <input type="hidden" id="ran1" value="${fl }"/>
	<div class="wrap_width">
		<div class="login_title">综合行政执法监管平台</div>
		<div class="login_left"><img src="<%=path%>/resources/portal/main/images/login_left.png" /></div>
	<form onsubmit="javascript:return false;">
        <div class="login">
        	<div class="login_filter_bg"></div>
            <div class="login_right_title">用户登录</div>
            <ul>
                <li>
                    <input class="login_inp login_head" type="text" id="nicname" placeholder="请输入用户名" />
                </li>
                <li>
                    <input class="login_inp login_key" type="password" id="pass" autocomplete="off" placeholder="请输入密码" />
                </li>
                <li>
                    <input class="login_inp login_inp_yzm" type="text" placeholder="请输入验证码" id="incode" autocomplete="off"/>
                    <!-- <img class="login_pic_yzm" src="images/bg.jpg" /> -->
                    <div class="login_pic_yzm" id="code1" onclick="changecode()"></div>
                </li>
            </ul>
            <div class="login_btn">
                <input type="submit" id="sublog" value="登 录" />
            </div>
        </div>
    </form>
    </div>
</body>
</html>