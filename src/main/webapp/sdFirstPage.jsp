<%--
  Created by IntelliJ IDEA.
  User: 86189
  Date: 2023/12/11
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统管理员操作页面</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sdFirstPage.css" rel="stylesheet">
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)">
    <a class="navbar-brand" href="#">系统管理员</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#home">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#complaints">投诉信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#account-management">账号管理</a>
            </li>
        </ul>
    </div>
</nav>

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
                <img src="css/usst3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
</section>

<!-- 分隔线与标题 -->
<div class="container">
    <div class="section-divider">
        <div class="section-title">食堂信息基本管理</div>
    </div>
</div>

<!-- 食堂信息基本管理 -->
<section class="container">
    <div class="row justify-content-center">
        <div class="col-md-3 canteen-card">
            <img src="canteen1.jpg" alt="食堂1">
            <h4>食堂名称1</h4>
        </div>
        <div class="col-md-3 canteen-card">
            <img src="canteen2.jpg" alt="食堂2">
            <h4>食堂名称2</h4>
        </div>
        <div class="col-md-3 canteen-card">
            <img src="canteen3.jpg" alt="食堂3">
            <h4>食堂名称3</h4>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-3 canteen-card">
            <img src="canteen4.jpg" alt="食堂4">
            <h4>食堂名称4</h4>
        </div>
        <div class="col-md-3 canteen-card">
            <img src="canteen5.jpg" alt="食堂5">
            <h4>食堂名称5</h4>
        </div>
        <div class="col-md-3 canteen-card">
            <img src="canteen6.jpg" alt="食堂6">
            <h4>食堂名称6</h4>
        </div>
    </div>

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


</section>
<!-- 引入Bootstrap的JavaScript库 -->
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

