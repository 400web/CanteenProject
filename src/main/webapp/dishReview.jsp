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
    <title>菜品评价界面</title>
</head>
<body>
<div class="menu-item" >
        <img src="${dish.image}" alt="">
        <div class="menu-item-details">
            <h3>菜名：${dish.name}</h3>
            <p>菜系: ${dish.cuisine}</p>
            <p>价格: ${dish.price}</p>
            <p>评分: ${dish.score}</p>
        </div>
</div>
<div id="comments-section">
    <div class="comment">
        <div class="comment-header">
            <span class="user-name">${dishReview.userName}</span>
            <span class="comment-time">${dishReview.comment}</span>
        </div>
    </div>

    <!-- 添加更多评论 -->

</div>
</body>
</html>
