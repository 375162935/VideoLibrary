<%--
  Created by IntelliJ IDEA.
  User: yyn
  Date: 2020/4/4
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>这是主界面</h1>
<p>欢迎${user.username}</p>
<a href="${pageContext.request.contextPath}/user/exit.do">点我退出</a>
</body>
</html>
