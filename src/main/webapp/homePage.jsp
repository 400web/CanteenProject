<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/13
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生页面</title>
    <link rel="stylesheet" href=css/homePage.css>
    <!-- 引入 Bootstrap 样式表 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="section-title" style="color: #051b11">食堂菜品</div>
    </div>
</div>
<script>
    // 获取所有具有data-canteen属性的链接元素
    const canteenLinks = document.querySelectorAll('[data-canteen]');

    // 获取用于显示食堂的元素
    const canteenTitle = document.querySelector('.section-title');

    // 添加点击事件处理程序以更新食堂菜品位置的文本
    canteenLinks.forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 防止链接跳转

            // 获取所选食堂的值
            const selectedCanteen = this.getAttribute('data-canteen');

            // 更新食堂菜品位置的文本
            canteenTitle.textContent = "第" + selectedCanteen + "食堂";
        });
    });
</script>


<!-- 轮播图 -->
<section id="home" class="container-fluid">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="css/usst.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="css/usst1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="css/usst2.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
</section>


<%--//嵌套主界面的jsp--%>
<div id="content1" style="display: block;">
    <%-- 内嵌JSP页面1的内容 --%>
    <jsp:include page="interface.jsp"/>
</div>
<div id="content2" style="display: none;">
    <%-- 内嵌JSP页面2的内容 --%>
    <jsp:include page="questionnaire.jsp"/>
</div>
<%--<jsp:include page="questionnaire.jsp"/>--%>

<script>
    function switchContent(contentId) {
    document.getElementById("content1").style.display = (contentId === "content1") ? "block" : "none";
    document.getElementById("content2").style.display = (contentId === "content2") ? "block" : "none";
}</script>


    <!-- 分页栏 -->
    <nav aria-label="Page navigation example" class="col-md-12">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>



<!-- 引入Bootstrap的JavaScript库 -->
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>


