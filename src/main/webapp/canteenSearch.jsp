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
    <title>菜品检索</title>
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<style>
    em {
        color: #f40;
        font-style: normal;
        font-weight: bold;
    }
</style>
<body>
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
