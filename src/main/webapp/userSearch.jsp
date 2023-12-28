<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/28
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户检索</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .chat-history {
            overflow-y: scroll;
            height: 300px;
            border: 1px solid #ccc;
            padding: 10px;
        }
        .search-results {
            margin-top: 20px;
        }
        .search-results .list-group-item {
            cursor: pointer;
        }
        .search-results .list-group-item:hover {
            background-color: #f0f0f0;
        }
        body{
            display: flex;
            justify-content: center;
            align-content: center;
            height: 100vh;
            background-image: linear-gradient(200deg,rgb(213,216,53),rgb(216,102,115));
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">User Search</h1>
    <form>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="输入用户名搜索" id="searchInput">
            <button class="btn btn-primary" type="button" onclick="searchUsers()">Search</button>
        </div>
    </form>

    <div class="chat-history">
        <h4>聊过的人</h4>
        <div class="list-group">
            <c:forEach var="user" items="${chatHistoryUsers}">
                <a href="ChatServlet?id=${user.id}" class="list-group-item list-group-item-action">
                    <strong>${user.username}</strong>
                </a>
            </c:forEach>
        </div>
    </div>

    <div class="search-results">
        <h4>用户列表</h4>
        <div class="list-group" id="searchResults">
            <c:forEach var="user" items="${allUsers}">
                <a href="ChatServlet?id=${user.id}" class="list-group-item list-group-item-action">
                    <strong>${user.username} - ${user.role}</strong>
                </a>
            </c:forEach>
            <c:if test="${empty allUsers}">
                <p class="text-muted">用户不存在</p>
            </c:if>
        </div>
    </div>
</div>

<script src="bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
    function searchUsers() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const searchResults = document.querySelectorAll('#searchResults .list-group-item');

        searchResults.forEach(result => {
            const username = result.querySelector('strong').innerText.toLowerCase();
            if (username.includes(searchInput)) {
                result.style.display = 'block';
            } else {
                result.style.display = 'none';
            }
        });
    }
</script>
</body>
</html>
