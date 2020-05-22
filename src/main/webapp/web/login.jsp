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
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login-styles.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery1.8.1.js" type="text/javascript"></script>
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>

            <form action="" class="form" id="submit-form" method="post">
                <input type="text" placeholder="username" name="username" value="${userInfo.username}">
                <input type="password" placeholder="password" name="password" value="${userInfo.password}">
                <button type="button" class="submit" id="login-button">登录</button>
                <button type="button" onclick="register()">注册</button>
            </form>
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

<script type="text/javascript">
    function register() {
        window.location.href = "${pageContext.request.contextPath}/web/register.jsp";
    }

    $(function () {
        $(".submit").on("click", function () {
            var username = $("input[name=username]").val();
            var password = $("input[name=password]").val();
            var code;
            if (username == "") {
                alert("请输入账号");
                return;
            }
            if (password == "") {
                alert("请输入密码");
                return;
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/login.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        username: username,
                        password: password
                    }, success: function (data, event) {
                        if (data.result == "0") {
                            alert("账号不纯在")
                        } else if (data.result == "1") {
                            alert("密码输入错误")
                        } else {
                            // event.preventDefault();
                            $('form').fadeOut(500);
                            $('.wrapper').addClass('form-success');
                            $('#submit-form').submit();
                            window.location.href = '${pageContext.request.contextPath}/web/main.jsp';
                        }
                    }, error: function (data) {
                        alert(data)
                    }
                })
            }
        })
    })
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
    <h1>数据管理系统</h1>
</div>
</body>
</html>
