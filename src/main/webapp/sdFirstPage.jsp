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
    <style>
        /* 自定义样式 */
        body {
            background-color: #f0f0f0;
        }
        .navbar {
            background-color: #343a40;
            border-bottom: 1px solid #dee2e6;
        }
        .navbar-brand {
            font-weight: bold;
            color: #ffffff;
        }
        .nav-link {
            color: #ffffff;
        }
        .carousel-item img {
            height: calc(100vh / 4); /* 占据屏幕的四分之一 */
            object-fit: cover;
        }
        .canteen-card {
            text-align: center;
            margin-bottom: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .canteen-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        .canteen-card img:hover {
            transform: scale(1.05);
        }
        .canteen-card h4 {
            margin-top: 15px;
            color: #333333;
        }
        .pagination {
            margin-top: 30px;
        }
        /* 新增样式 */
        .section-divider {
            border-top: 4px solid #343a40;
            margin-top: 30px;
            margin-bottom: 30px;
            position: relative;
            text-align: center;
        }
        .section-title {
            background-color: #ffffff;
            color: #333333;
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
        }
    </style>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark">
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
                <img src="image1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image3.jpg" class="d-block w-100" alt="...">
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

