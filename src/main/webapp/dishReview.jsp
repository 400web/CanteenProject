<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/18
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/dishReview.css">
    <title>菜品评价界面</title>
</head>
<body>
<%--<div class="menu-item" >--%>
<%--        <img src="${dish.image}" alt="">--%>
<%--        <div class="menu-item-details">--%>
<%--            <h3>菜名：${dish.name}</h3>--%>
<%--            <p>菜系: ${dish.cuisine}</p>--%>
<%--            <p>价格: ${dish.price}</p>--%>
<%--            <p>评分: ${dish.score}</p>--%>
<%--        </div>--%>
<%--</div>--%>
<%--<div id="comments-section">--%>
<%--    <div class="comment">--%>
<%--        <div class="comment-header">--%>
<%--            <span class="user-name">${dishReview.userName}</span>--%>
<%--            <span class="comment-time">${dishReview.comment}</span>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- 添加更多评论 -->--%>

<%--</div>--%>
<div class="container">
    <div class="dish-item">
        <img class="dish-image" src="${dish.image}" alt="菜品图片">
        <div class="dish-info">
            <h2>菜名：${dish.name}</h2>
            <p>菜系: ${dish.cuisine}</p>
            <p>价格: ${dish.price}</p>
            <p>评分: ${dish.score}</p>
        </div>
    </div>

    <div class="review-section">
        <div class="user-review">
            <h3>${dishReview.userName}</h3>
            <p>${dishReview.comment}</p>
        </div>

        <!-- 可以继续添加更多评价 -->
    </div>
</div>
</body>
</html>
