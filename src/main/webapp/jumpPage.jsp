<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/22
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href=css/jumpPage.css>
    <!-- 引入 Bootstrap 样式表 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>带有倒计时的自动跳转页面</title>
    <script type="text/javascript">
        // 设置倒计时的总时间（以秒为单位）
        var count = 5;

        // 更新页面上显示的倒计时
        function updateCountdown() {
            var countdownElement = document.getElementById('countdown');
            countdownElement.innerHTML = count + '秒后跳转到首页';
            count--;

            // 当倒计时结束时，跳转到指定的URL
            if (count < 0) {
                window.location = 'homePage.jsp'; // 替换为你的目标URL
            }
        }

        // 每秒调用一次updateCountdown函数
        setInterval(updateCountdown, 1000);
    </script>

</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)"  >
    <a class="navbar-brand" href="#">USST食堂系统首页</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="switchContent('content1');">首页</a>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    食堂
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#canteen1" data-canteen="1">食堂1</a>
                    <a class="dropdown-item" href="#canteen2" data-canteen="2">食堂2</a>
                    <a class="dropdown-item" href="#canteen3" data-canteen="3">食堂3</a>
                    <!-- 添加更多食堂选项 -->
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="#" onclick="switchContent('content2');">问卷</a>--%>
            <%--            </li>--%>
            <li class="nav-item">
                <a class="nav-link" href="questionnaireServlet">问卷</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#account-management">账号管理</a>
            </li>
        </ul>
    </div>
</nav>


<!-- 分隔线与标题 -->
<div class="container" >
    <div class="section-divider" style="color: red">
        <div class="section-title" style="color: #051b11">//////</div>
    </div>
</div>

<div class="page-container">
    <div class="container1">
        <div class="content1">
            <span class="red-text">${sessionScope.rebackMessage}</span>
            <h4>页面将在 <span id="countdown">5秒后跳转到首页</span></h4>
            <button class="back-button" onclick="goBack()">返回</button>
        </div>
</div>

</div>
</body>
<script>
    // JavaScript函数用于返回上一页
    function goBack() {
        window.history.back();
    }
</script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</html>

