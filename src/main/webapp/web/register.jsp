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
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery1.8.1.js" type="text/javascript"></script>
    <style>
        .form-div span {
            width: 80px;
            display: inline-block;
        }

        .form-div input {
            display: inline-block;
        }

        form select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            outline: 0;
            border: 1px solid rgba(255, 255, 255, 0.4);
            background-color: rgba(255, 255, 255, 0.2);
            width: 250px;
            border-radius: 3px;
            padding: 10px 15px;
            margin: 0 auto 10px auto;
            display: inline;
            text-align: center;
            font-size: 18px;
            color: white;
            -webkit-transition-duration: 0.25s;
            transition-duration: 0.25s;
            font-weight: 300;
        }

        form select:hover {
            background-color: rgba(255, 255, 255, 0.4);
        }

        form select:focus {
            background-color: white;
            width: 300px;
            color: #53e3a6;
        }
    </style>
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>注册账号</h1>

            <form action="" class="form" id="submit-form">
                <div class="form-div">
                    <span>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</span>
                    <input type="text" placeholder="username" name="username" value="${userInfo.username}">
                </div>
                <div class="form-div">
                    <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
                    <input type="text" placeholder="password" name="password" value="${userInfo.password}">
                </div>
                <div class="form-div">
                    <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</span>
                    <input type="text" placeholder="name" name="name" value="${userInfo.name}">
                </div>
                <div class="form-div">
                    <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</span>
                    <select name="sex">
                        <option>男</option>
                        <option>女</option>
                    </select>
                </div>
                <div class="form-div">
                    <span>真实姓名:</span>
                    <input type="text" placeholder="trueName" name="trueName" value="${userInfo.trueName}">
                </div>
                <button type="button" class="submit" id="login-button">注册</button>
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

<script>
    // $('#login-button').click(function (event) {
    //     event.preventDefault();
    //     $('form').fadeOut(500);
    //     $('.wrapper').addClass('form-success');
    //     $('#submit-form').submit();
    // });
    $(function () {
        $(".submit").on("click", function () {
            var username = $("input[name=username]").val();
            var password = $("input[name=password]").val();
            var name = $("input[name=name]").val();
            var sex = $("select[name=sex]").val();
            var trueName = $("input[name=trueName]").val();
            if (username == "") {
                alert("请输入账号");
                return;
            }
            if (password == "") {
                alert("请输入密码");
                return;
            }
            if (name == "") {
                alert("请输入昵称");
                return;
            }
            if (sex == "男") {
                sex = 1;
            } else if (sex == "女") {
                sex = 2;
            }
            if (trueName == "") {
                alert("请输入真实姓名");
                return;
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/register.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        username: username,
                        password: password,
                        name: name,
                        sex: sex,
                        trueName: trueName
                    }, success: function (data) {
                        if (data.result == "0") {
                            alert("账号已注册")
                        } else {
                            alert("注册成功")
                            // $('form').fadeOut(500);
                            // $('.wrapper').addClass('form-success');
                            // $('#submit-form').submit();
                            window.location.href = '${pageContext.request.contextPath}/web/login.jsp';
                        }
                    }, error: function (error) {
                        alert(error)
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
