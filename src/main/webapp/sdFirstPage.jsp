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
    <style>
        .add-button {
            width: 300px;
            height: 300px;
            border: 1px dashed #ccc;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .add-card {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .horizontal-line, .vertical-line {
            position: absolute;
            background-color: #ccc;
            z-index: 1;
        }

        .horizontal-line {
            width: 80px;
            height: 2px;
            top: 48%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .vertical-line {
            width: 1px;
            height: 80px;
            top: 50%;
            left: 48%;
            transform: translate(-50%, -50%);
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
                <a class="nav-link" href="SdFirstPageServlet">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="canteenReviewServlet">投诉信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="PostServlet">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AccountManagementServlet">账号管理</a>
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
        <c:forEach var="canteen" items="${requestScope.canteens}" varStatus="loop">
            <div class="col-md-3 canteen-card">
                <a class="nav-link" href="CanteenDetailServlet?id=${canteen.id}">
                    <img src="${canteen.image}" alt="${canteen.id}">
                    <h4>${canteen.name}</h4>
                </a>
            </div>
            <c:if test="${loop.index % 3 == 2}">
                <div class="row"></div>
            </c:if>
        </c:forEach>
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
                <form id="addCanteenForm" action="SdFirstPageServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="canteenImageInput">食堂图片</label>
                        <input type="file" class="form-control-file" id="canteenImageInput" name="canteenImageInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenNameInput">食堂名称</label>
                        <input type="text" class="form-control" id="canteenNameInput" name="canteenNameInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenLocationInput">食堂位置</label>
                        <input type="text" class="form-control" id="canteenLocationInput" name="canteenLocationInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenDescriptionInput">食堂简介</label>
                        <textarea class="form-control" id="canteenDescriptionInput" name="canteenDescriptionInput" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="canteenOpeningInput">开门时间</label>
                        <input type="text" class="form-control" id="canteenOpeningInput" name="canteenOpeningInput">
                    </div>
                    <div class="form-group">
                        <label for="canteenClosingInput">关门时间</label>
                        <input type="text" class="form-control" id="canteenClosingInput" name="canteenClosingInput">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" id="saveCanteenChanges">保存更改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

i