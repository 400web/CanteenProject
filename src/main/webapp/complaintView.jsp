<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/26
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>投诉信息查看</title>
    <!-- 引入 Bootstrap 样式 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap-4.3.1.min.js"></script>
    <style>
        .card-body p {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)">
    <a class="navbar-brand" href="#">投诉查看</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <span class="badge bg-primary">Lv.${oUser.level} ${user.username}</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="homeServlet">首页</a>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    食堂
                </a>

                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach var="oneCanteen" items="${navbarAllCanteen}">
                        <a class="dropdown-item" href="canteenServlet?id=${oneCanteen.id}">${oneCanteen.name}</a>
                    </c:forEach>
                </div>

            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="naDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    社区
                </a>
                <div class="dropdown-menu" aria-labelledby="naDropdown">
                    <a class="dropdown-item" href="PostServlet">论坛</a>
                    <a class="dropdown-item" href="UserViewServlet">聊天室</a>
                </div>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="nDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    检索
                </a>
                <div class="dropdown-menu" aria-labelledby="nDropdown">
                    <a class="dropdown-item" href="CanteenSearchServlet">食堂检索</a>
                    <a class="dropdown-item" href="DishSearchServlet">菜品检索</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="questionnaireServlet">问卷</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ComplaintViewServlet">投诉查看</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ViewUserDetailServlet">账号详情</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container mt-4">
    <h1>投诉信息</h1>
    <div class="row">
        <c:forEach var="complaint" items="${complaints}">
            <div class="col-md-6 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">投诉ID: ${complaint.id}</h5>
                        <p class="card-text">投诉人姓名: ${complaint.name}</p>
                        <p class="card-text">食堂名称: ${complaint.canteenName}</p>
                        <p class="card-text">投诉时间: ${complaint.complainTime}</p>
                        <p class="card-text">投诉信息: ${complaint.complaintInfo}</p>
                        <p class="card-text">投诉反馈: ${complaint.feedback}</p>
                        <p class="card-text">回复信息: ${complaint.responseInfo}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

