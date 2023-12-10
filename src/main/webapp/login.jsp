
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-wideh,initial-scale">
    <link rel="stylesheet" href=css/login.css>
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <title>USST食堂登录系统</title>
    <script type="text/javascript">
        $(function () {
            $("#pagecode").click(function () {
                $("#pagecode").attr("src","/qfshop_war_exploded/code?method=createCode&t="+Math.random());
            });
        })
    </script>
</head>

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
                <h2>USST食堂系统</h2>
                <form action="loginServlet" method="post">
                    <div class="inputBox">
                        <input type="text" placeholder="手机号" name="phoneNumber" required>
                    </div>
                    <div class="inputBox">
                        <input type="password" placeholder="密码" name="password" required>
                    </div>

                    <div >
                        <input type="checkbox" id="autoLogin" name="auto" />记住密码
                        <span id="autoLoginMsg" ></span>
                    </div>
                    <div class="inputBox">
                        <input type="submit" value="登录">
                    </div>
                    <p class="forget">没有账户？
                        <a href="register.jsp">点击注册</a>
                    </p>
                    <span style="text-align: center">${msg}</span>
                </form>

            </div>
        </div>
    </div>
</section>
</body>

</html>

