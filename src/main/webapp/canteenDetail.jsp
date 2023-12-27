<%--
  Created by IntelliJ IDEA.
  User: 86189
  Date: 2023/12/20
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>食堂详情</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="css/canteenDetail.css" rel="stylesheet">
    <script src=javascript/canteenDetail.js></script>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand">系统管理员</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="SdFirstPageServlet">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#complaints">投诉信息</a>
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
        <div class="section-title">${requestScope.canteen.name}</div>
    </div>
</div>

<div class="container mt-4">
    <!-- 图片展示 -->
    <div class="card" style="max-width: 400px; margin: 0 auto;">
        <img id="mainImage" src="${requestScope.canteen.image}" alt="Your Image" class="img-fluid">
    </div>

    <!-- 表格布局 -->
    <div class="table-wrapper">
        <table class="table table-bordered mt-4">
            <tbody>
            <tr>
                <th>名称</th>
                <td id="nameCell">${requestScope.canteen.name}</td>
            </tr>
            <tr>
                <th>位置</th>
                <td id="locationCell">${requestScope.canteen.location}</td>
            </tr>
            <tr>
                <th>简介</th>
                <td id="descriptionCell">${requestScope.canteen.introduction}</td>
            </tr>
            <tr>
                <th>营业时间</th>
                <td id="openingHoursCell">${requestScope.canteen.openingTime}-${requestScope.canteen.closingTime}</td>
            </tr>
            <tr>
                <th>管理员用户名</th>
                <td id="adminUsernameCell">具体内容5</td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- 按钮组 -->
    <div class="btn-group">
        <button id="modifyBtn" type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#editModal">
            修改
        </button>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteConfirmModal">
            删除
        </button>
    </div>
</div>
<!-- 修改食堂信息模态框 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">修改食堂信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-muted">修改食堂管理员请在用户管理界面进行</p>
                <form id="editForm" action="CanteenDetailServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="newNameInput">新名称</label>
                        <input type="text" class="form-control" id="newNameInput" name="newNameInput">
                    </div>
                    <div class="form-group">
                        <label for="newLocationInput">新位置</label>
                        <input type="text" class="form-control" id="newLocationInput" name="newLocationInput">
                    </div>
                    <div class="form-group">
                        <label for="newDescriptionInput">新简介</label>
                        <input type="text" class="form-control" id="newDescriptionInput" name="newDescriptionInput">
                    </div>
                    <div class="form-group">
                        <label for="newOpeningHoursInput">新营业时间</label>
                        <input type="text" class="form-control" id="newOpeningHoursInput" name="newOpeningHoursInput">
                    </div>
                    <div class="form-group">
                        <label for="newCanteenImage">新食堂照片</label>
                        <input type="file" class="form-control-file" id="newCanteenImage" name="newCanteenImage">
                    </div>
                    <div class="card mb-3" style="max-width: 400px; margin: 0 auto;">
                        <img id="previewImage" src="${requestScope.canteen.image}" alt="Your Image" class="card-img-top">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" id="saveChanges">保存更改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 删除确认模态框 -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog custom-modal" role="document">
        <div class="modal-content">
            <form action="DeleteCanteenServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <p>是否确认删除？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-danger" id="confirmDeleteBtn">确认删除</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
