<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/22
  Time: 19:50
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
    function searchDishes() {
        const canteenId = document.getElementById('canteen').value;
        const cuisine = document.getElementById('cuisine').value;
        const minPrice = document.getElementById('minPrice').value;
        const maxPrice = document.getElementById('maxPrice').value;
        const dishName = document.getElementById('dishName').value;
        const requestData = {
            canteenId: canteenId,
            cuisine: cuisine,
            minPrice: minPrice,
            maxPrice: maxPrice,
            dishName: dishName
        };
        console.log(requestData);

        // 发送Fetch请求
        fetch('DishSearchServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json()) // 假设返回JSON格式的数据
            .then(data => {
                // 清空表格内容
                const tableBody = document.getElementById('dishTableBody');
                tableBody.innerHTML = '';
                console.log(data);
                let reg;
                const key = document.getElementById("dishName").value;
                if (key) {
                    reg = new RegExp(key, 'gi');
                }
                data.forEach(dish => {
                    let name = dish.name;
                    if (reg) {
                        name = name.replace(reg, (key) => '<em>' + key + '</em>');
                        console.log(key);
                    }
                    const tableBody = document.getElementById('dishTableBody');
                    const row = document.createElement('tr');
                    let html = '';
                    html += '<td><img src="' + dish.image + '" alt="' + dish.name + '" style="width: 50px; height: 50px;"></td>';
                    html += '<td>' + name + '</td>';
                    html += '<td>' + dish.canteenName + '</td>';
                    html += '<td>' + dish.cuisine + '</td>';
                    html += '<td>' + dish.price + '</td>';
                    html += '<td>' + dish.score + '</td>';
                    html += '<td>' + dish.introduction + '</td>';
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
    <div class="row mb-3">
        <div class="col-md-2">
            <label for="canteen" class="form-label">食堂名称：</label>
            <select name="canteen" id="canteen" class="form-select">
                <option value="">不选择</option> <!-- 默认选项 -->
                <c:forEach var="canteen" items="${canteenList}">
                    <option value="${canteen.id}">${canteen.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-2">
            <label for="cuisine" class="form-label">菜系：</label>
            <select name="cuisine" id="cuisine" class="form-select">
                <option value="">不选择</option> <!-- 默认选项 -->
                <option value="川菜">川菜</option>
                <option value="湘菜">湘菜</option>
            </select>
        </div>
        <div class="col-md-1">
            <label for="minPrice" class="form-label">最小价格：</label>
            <input type="number" name="minPrice" id="minPrice" class="form-control">
        </div>
        <div class="col-md-1">
            <label for="maxPrice" class="form-label">最大价格：</label>
            <input type="number" name="maxPrice" id="maxPrice" class="form-control">
        </div>
        <div class="col-md-3">
            <label for="dishName" class="form-label">菜品名字：</label>
            <input type="text" name="dishName" id="dishName" class="form-control">
        </div>
        <div class="col-md-1 d-flex align-items-end">
            <button type="submit" class="btn btn-primary" onclick="searchDishes()">检索</button>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">图片</th>
            <th scope="col">菜品名</th>
            <th scope="col">食堂名</th>
            <th scope="col">菜系</th>
            <th scope="col">价格</th>
            <th scope="col">评分分值</th>
            <th scope="col">简介</th>
        </tr>
        </thead>
        <tbody id="dishTableBody">
        <c:forEach var="dish" items="${dishList}">
            <tr>
                <td><img src="${dish.image}" alt="${dish.name}" style="width: 50px; height: 50px;"></td>
                <td>${dish.name}</td>
                <td>${dish.canteenName}</td>
                <td>${dish.cuisine}</td>
                <td>${dish.price}</td>
                <td>${dish.score}</td>
                <td>${dish.introduction}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
