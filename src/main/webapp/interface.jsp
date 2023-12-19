<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/interfaceStyles.css">
    <title>食堂界面</title>
</head>
<body>
<%--<header>--%>
<%--    <div class="canteen-info">--%>
<%--        <h1>${canteen.name}</h1>--%>
<%--        <p>开始营业时间：${canteen.openingTime} 结束营业时间:${canteen.closeingTime}</p>--%>
<%--    </div>--%>
<%--    <p>${canteen.introduction}</p>--%>
<%--</header>--%>
<section id="announcements">
    <h2>食堂简介</h2>
    <p>${canteen.introduction}</p>
</section>
<section id="announcements">
    <h2>活动公告</h2>
    <p>${canteen.activity}</p>
</section>




<!-- 在菜品栏中添加图片、菜名、菜系和价格 -->
<section id="menu">
    <h2>菜品栏</h2>
    <div id="scrollable-menu" class="menu-container">
            <div class="menu-item" >
                <c:forEach var="dish" items="${dishList}">
                   <a href="dishReviewServlet?id=${dish.id}"> <img src="${dish.image}" alt=""></a>
                <div class="menu-item-details">
                    <h3>菜名：${dish.name}</h3>
                    <p>菜系: ${dish.cuisine}</p>
                    <p>价格: ${dish.price}</p>
                </div>
                </c:forEach>>
            </div>
    </div>
</section>
<section id="comments">
    <h2>评论区</h2>
<%--    <c:forEach var="review" items="${canteenReviewList}">--%>
    <div id="comment-section">
        <div class="comment">${canteenReviewList[0].evaluatorId}:${canteenReviewList[0].id}</div>
        <div class="comment">${canteenReviewList[1].evaluatorId}:${canteenReviewList[1].id}</div>
        <a href="comments.jsp？canteenReviewList=${canteenReviewList}">查看更多食堂评论</a>
    </div>
</section>

</body>
</html>