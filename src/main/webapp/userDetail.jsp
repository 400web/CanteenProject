<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/28
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>账号详情</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap-4.3.1.min.js"></script>
    <style>
        .container {
            margin-top: 50px;
        }

        .card {
            margin-bottom: 20px;
        }
        body{
            height: 100vh;
            background-image: linear-gradient(120deg, #ff6e7f, #bfe9ff);
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)">
    <a class="navbar-brand" href="#">账号详情</a>
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
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="#" onclick="switchContent('content2');">问卷</a>--%>
            <%--            </li>--%>
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
<div class="container">
    <h1 class="mb-4">账号详情</h1>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">基本信息</h5>
            <p><strong>用户名: </strong>${user.username}</p>
            <p><strong>手机号码: </strong>${user.phoneNumber}</p>
            <p><strong>角色: </strong>${user.role}</p>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">用户统计信息</h5>
            <p><strong>登录次数: </strong>${oUser.loginTimes}</p>
            <p><strong>评价次数: </strong>${oUser.evaluationTimes}</p>
            <p><strong>社区交流次数: </strong>${oUser.communityInteractionTimes}</p>
            <p><strong>用户等级: </strong>${oUser.level}</p>
        </div>
    </div>
</div>
</body>
</html>

