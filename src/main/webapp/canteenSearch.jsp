<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/22
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>食堂检索</title>
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap-4.3.1.min.js"></script>
</head>
<style>
    em {
        color: #f40;
        font-style: normal;
        font-weight: bold;
    }
    body{
        height: 100vh;
        background-image: linear-gradient(120deg, #84fab0, #8fd3f4);
    }
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)">
    <a class="navbar-brand" href="#">食堂检索</a>
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
                <a class="nav-link" href="ViewUserDetailServlet">账号详情</a>
            </li>
        </ul>
    </div>
</nav>
<script>
    function searchCanteens() {
        const name = document.getElementById('canteenName').value;

        // 发送Fetch请求
        fetch('CanteenSearchServlet', {
            method: 'POST',
            body: 'canteenName=' + encodeURIComponent(name),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
            .then(response => response.json())
            .then(data => {
                // 清空表格内容
                const tableBody = document.getElementById('canteenTableBody');
                tableBody.innerHTML = '';
                console.log(data);
                let reg;
                const key = document.getElementById("canteenName").value;
                if (key) {
                    reg = new RegExp(key, 'gi');
                }
                data.forEach(canteen => {
                    let name = canteen.name;
                    if (reg) {
                        name = name.replace(reg, (key) => '<em>' + key + '</em>');
                        console.log(key);
                    }
                    const tableBody = document.getElementById('canteenTableBody');
                    const row = document.createElement('tr');
                    let html = '';
                    html += '<td><img src="' + canteen.image + '" alt="' + canteen.name + '" style="width: 50px; height: 50px;"></td>';
                    html += '<td>' + name + '</td>';
                    html += '<td>' + canteen.location + '</td>';
                    html += '<td>' + canteen.openingTime + '</td>';
                    html += '<td>' + canteen.closingTime + '</td>';
                    html += '<td>' + canteen.rating + '</td>';
                    html += '<td>' + canteen.introduction + '</td>';
                    row.innerHTML = html;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('发生错误:', error);
            });
    }
</script>
<div class="container mt-4">
    <div class="col-md-8">
        <div class="input-group">
            <label for="canteenName" class="form-label">食堂名字：</label>
            <input type="text" name="canteenName" id="canteenName" class="form-control" aria-label="Search for...">
            <button class="btn btn-primary" type="button" onclick="searchCanteens()">检索</button>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">图片</th>
            <th scope="col">食堂名</th>
            <th scope="col">位置</th>
            <th scope="col">开门时间</th>
            <th scope="col">关门时间</th>
            <th scope="col">评分</th>
            <th scope="col">简介</th>
        </tr>
        </thead>
        <tbody id="canteenTableBody">
        <c:forEach var="canteen" items="${canteenList}">
            <tr>
                <td><img src="${canteen.image}" alt="${canteen.name}" style="width: 50px; height: 50px;"></td>
                <td>${canteen.name}</td>
                <td>${canteen.location}</td>
                <td>${canteen.openingTime}</td>
                <td>${canteen.closingTime}</td>
                <td>${canteen.rating}</td>
                <td>${canteen.introduction}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
