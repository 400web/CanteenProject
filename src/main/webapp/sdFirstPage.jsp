<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="css/sdFirstPage.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">系统管理员</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="sdFirstPage.jsp">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#complaints">投诉信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="account-management.jsp">账号管理</a>
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
                <img src="css/usst2.jpg" class="d-block w-100" alt="...">
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
            <a class="nav-link" href="canteenDetail.jsp?id=1">
                <img src="canteen1.jpg" alt="食堂1">
                <h4>食堂名称1</h4>
            </a>
        </div>
        <div class="col-md-3 canteen-card">
            <a class="nav-link" href="canteen_detail.jsp?id=2">
                <img src="canteen2.jpg" alt="食堂2">
                <h4>食堂名称2</h4>
            </a>
        </div>
        <div  class="col-md-3 canteen-card">
            <a class="nav-link" href="canteen_detail.jsp?id=3">
                <img src="canteen3.jpg" alt="食堂3">
                <h4>食堂名称3</h4>
            </a>
        </div>
        <div class="col-md-3 canteen-card">
            <a class="nav-link" href="canteen_detail.jsp?id=4">
                <img src="canteen4.jpg" alt="食堂4">
                <h4>食堂名称4</h4>
            </a>
        </div>
        <div class="col-md-3 canteen-card">
            <a class="nav-link" href="canteen_detail.jsp?id=5">
                <img src="canteen5.jpg" alt="食堂5">
                <h4>食堂名称5</h4>
            </a>
        </div>
        <div class="col-md-3 canteen-card">
            <a class="nav-link" href="canteen_detail.jsp?id=6">
                <img src="canteen6.jpg" alt="食堂6">
                <h4>食堂名称6</h4>
            </a>
        </div>
        <!-- 添加按钮 -->
        <div class="col-md-3 canteen-card add-card">
            <button class="btn add-button" id="addCanteenBtn" data-toggle="modal" data-target="#addCanteenModal">
                <span class="horizontal-line"></span>
                <span class="vertical-line"></span>
            </button>
        </div>
    </div>
</section>
<!-- 模态框 -->
<div class="modal fade" id="addCanteenModal" tabindex="-1" role="dialog" aria-labelledby="addCanteenModalLabel" aria-hidden="true">
    <!-- 模态框内容 -->
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCanteenModalLabel">添加新食堂</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 编辑食堂信息的表单 -->
                <form id="addCanteenForm">
                    <div class="form-group">
                        <label for="canteenImageInput">食堂图片</label>
                        <input type="file" class="form-control-file" id="canteenImageInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenNameInput">食堂名称</label>
                        <input type="text" class="form-control" id="canteenNameInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenLocationInput">食堂位置</label>
                        <input type="text" class="form-control" id="canteenLocationInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenDescriptionInput">食堂简介</label>
                        <textarea class="form-control" id="canteenDescriptionInput" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="canteenOpeningHoursInput">营业时间</label>
                        <input type="text" class="form-control" id="canteenOpeningHoursInput">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveCanteenChanges">保存更改</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

