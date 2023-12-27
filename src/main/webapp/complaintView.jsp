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
    <style>
        .card-body p {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1>投诉信息</h1>
    <div class="row">
        <c:forEach var="complaint" items="${complaintList}">
            <div class="col-md-6 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">投诉ID: ${complaint.id}</h5>
                        <p class="card-text">投诉人ID: ${complaint.complainantId}</p>
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
<!-- 引入 Bootstrap 的 JavaScript 包 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

