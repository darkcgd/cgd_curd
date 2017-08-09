<%--
  Created by IntelliJ IDEA.
  User: szmg
  Date: 17/8/9
  Time: 下午6:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="http://localhost:8080/file/upload" method="post" enctype="multipart/form-data">
    选择文件:<input type="file" name="file" width="120px">
    <input type="submit" value="上传">
</form>
<hr>
<form action="http://localhost:8080/file/down" method="get">
    <input type="submit" value="下载">
</form>
</body>
</html>
