<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cp.GetCanteen" %>
<%@ page import="com.cp.domain.Canteen" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>食堂界面</title>
</head>
<body>
<%GetCanteen getCanteen=new GetCanteen();
Canteen canteen=getCanteen.getCanteenByName("第一食堂");
String name=canteen.getName();
String businessTime=canteen.getBusinessTime();
String activity=canteen.getActivity();
String introduction=canteen.getIntroduction();
%>
<header>
    <div class="canteen-info">
        <h1><%=name%></h1>
        <p>运营时间: <%=businessTime%></p>
    </div>
    <p><%=introduction%></p>
</header>

<section id="announcements">
    <h2>活动公告</h2>
    <p><%=activity%></p>
</section>

<!-- 在菜品栏中添加图片、菜名、菜系和价格 -->
<%--<section id="menu">--%>
<%--    <h2>菜品栏</h2>--%>
<%--    <div id="scrollable-menu" class="menu-container">--%>
<%--        <div class="menu-column">--%>
<%--            <div class="menu-item">--%>
<%--                <img src="css/usst.jpg" alt="菜品1">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3></h3>--%>
<%--                    <p>菜系: 川菜</p>--%>
<%--                    <p>价格: ¥20.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- 添加更多菜品 -->--%>
<%--        </div>--%>
<section id="menu">
    <h2>菜品栏</h2>
    <div id="scrollable-menu" class="menu-container">
        <div class="menu-column">
            <div class="menu-item">
                <img src="css/usst.jpg" alt="菜品1">
                <div class="menu-item-details">
                    <h3></h3>
                    <p>菜系: 川菜</p>
                    <p>价格: ¥20.00</p>
                </div>
            </div>
        </div>
        <div class="menu-column">
            <div class="menu-item">
                <c:forEach var="dish" items = "">

                </c:forEach>
                <img src="css/usst.jpg" alt="菜品1">
                <div class="menu-item-details">
                    <h3></h3>
                    <p>菜系: 川菜</p>
                    <p>价格: ¥20.00</p>
                </div>
            </div>
            </div>
        <div class="menu-column">
            <!-- 第二列菜品 -->
            <div class="menu-item">
                <img src="css/usst.jpg" alt="菜品1">
                <div class="menu-item-details">
                    <h3>菜品1</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥20.00</p>
                </div>
            </div>
        </div>
        <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 上海菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
    </div>
</section>
<section id="comments">
    <h2>评论区</h2>
    <div id="comment-section">
        <div class="comment">评论1</div>
        <div class="comment">评论2</div>
        <a href="comments.jsp">查看更多评论</a>
    </div>
</section>
<%--<script src="script.js"></script>--%>
</body>
</html>