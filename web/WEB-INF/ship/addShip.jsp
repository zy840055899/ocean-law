<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2018/9/28
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>Title</title>
</head>
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script>
    $(function () {
        $("#submitForm").on("click", function () {
            alert($("input[name='hasFishingLic']:checked").val());
        });
    })
</script>
<body>

<form action="<%=path%>/ship/addShip.do" method="post" enctype="multipart/form-data">
    船名：<input type="text" name="shipName">
    船东名：<input type="text" name="shipOwner">
    电话：<input type="text" name="phone">

    <input type="radio" value="1" name="hasFishingLic">有
    <input type="radio" value="0" name="hasFishingLic">无

    选择文件:<input type="file" name="file">
    <br>




    <input type="button" id="submitForm" value="button">
    <input type="submit" value="submit">
</form>

lll
</body>
</html>
