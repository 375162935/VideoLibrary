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

        .form-div select {
            text-indent: 45%;
        }

        .error-span {
            position: absolute;
            right: 30px;
            top: 10px;
            font-size: 13px;
            display: none;
            color: red;
        }
    </style>
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>注册账号</h1>
            <form action="" class="form" id="submit-form">
                <div class="form-div" style="position: relative">
                    <span>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</span>
                    <input type="text" placeholder="请输入您的账号" name="username" value="${userInfo.username}">
                </div>
                <div class="form-div" style="position: relative">
                    <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
                    <input type="text" placeholder="请输入您的密码" name="password" value="${userInfo.password}">
                </div>
                <div class="form-div" style="position: relative">
                    <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</span>
                    <input type="text" placeholder="请输入您的昵称" name="name" value="${userInfo.name}">
                </div>
                <div class="form-div" style="position: relative">
                    <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</span>
                    <select name="sex">
                        <option>男</option>
                        <option>女</option>
                    </select>
                </div>
                <div class="form-div" style="position: relative">
                    <span>真实姓名:</span>
                    <input type="text" placeholder="请输入您的真实姓名" name="trueName" value="${userInfo.trueName}">
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
        var $username = $("input[name=username]");
        var $password = $("input[name=password]");
        var $name = $("input[name=name]");
        var $sex = $("select[name=sex]");
        var $trueName = $("input[name=trueName]");
        var username_status=true;
        var password_status=true;
        var name_status=true;
        var trueName_status=true;
        $username.blur(function () {
            if ($username.val() == "") {
                $username.after("<span class='error-span'>账号不能为空</span>")
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/register_username.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        username: $username.val()
                    }, success: function (data) {
                        $username.next("span").remove();
                        if (data.result == "1") {
                            username_status=false;
                            console.log("可注册")
                        } else {
                            $username.after("<span class='error-span'>账号已存在</span>")
                        }
                    }
                })
            }
        })
        $password.blur(function () {
            $password.next("span").remove();
            if ($password.val() == "") {
                $password.after("<span class='error-span'>密码不能为空</span>")
            }else {
                password_status=false;
            }
        })
        $name.blur(function () {
            $name.next("span").remove();
            if ($name.val() == "") {
                $name.after("<span class='error-span'>昵称不能为空</span>")
            }else {
                name_status=false;
            }
        })
        $trueName.blur(function () {
            $trueName.next("span").remove();
            if ($trueName.val() == "") {
                $trueName.after("<span class='error-span'>真实姓名不能为空</span>")
            }else {
                trueName_status=false;
            }
        })

        $(".submit").on("click", function () {
            var sex=$sex.val();
            if (username_status) {
                alert("请输入账号");
                return;
            }
            if (password_status) {
                alert("请输入密码");
                return;
            }
            if (name_status) {
                alert("请输入昵称");
                return;
            }
            if (trueName_status) {
                alert("请输入真实姓名");
                return;
            }
            if (sex == "男") {
                sex = 1;
            } else if (sex == "女") {
                sex = 2;
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/register.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        username: $username.val(),
                        password: $password.val(),
                        name: $name.val(),
                        sex: sex,
                        trueName: $trueName.val()
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
