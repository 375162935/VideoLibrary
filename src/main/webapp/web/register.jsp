<%--
  Created by IntelliJ IDEA.
  User: yyn
  Date: 2020/4/4
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login-styles.css">
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>注册账号</h1>

            <form action="${pageContext.request.contextPath}/user/register.do" class="form" id="submit-form">
                <input type="text" placeholder="username" name="username" value="${userInfo.username}">
                <input type="text" placeholder="password" name="password" value="${userInfo.password}">
                <button type="submit" id="login-button">注册</button>
            </form>
            <p style="color: red;margin-bottom: 10px;font-weight:bold">${error}</p>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

<script src="../js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
    $('#login-button').click(function (event) {
        event.preventDefault();
        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
        $('#submit-form').submit();
    });

    function register() {
        window.location.href = ''
    }
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
    <h1>数据管理系统</h1>
</div>
</body>
</html>
