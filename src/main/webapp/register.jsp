<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/10
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-wideh,initial-scale">
    <link rel="stylesheet" href=css/register.css>
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <title>USST食堂注册系统</title>

</head>

<script>

</script>

<body>
<section>
    <!--背景色-->
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="box">

        <!--登录框-->
        <div class="container">
            <div class="form">
                <h2>USST食堂注册系统</h2>
                <form action="registerServlet" method="post">
                    <div class="inputBox">
                        <input type="text" placeholder="用户名" name="username">
                    </div>
                    <div class="inputBox">
                        <input type="text" placeholder="手机号" name="phoneNumber">
                    </div>
                    <div class="inputBox">
                        <input type="password" placeholder="密码" name="password">
                    </div>
                    <div class="inputBox">
                        <input type="password" placeholder="重复密码" name="password1">
                    </div>

                    <div class="inputBox">
                        <input type="submit" value="注册">
                    </div>

                    <span style="text-align: center">${msg}</span>
                </form>

            </div>
        </div>
    </div>
</section>
</body>

</html>
