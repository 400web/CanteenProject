<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/19
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问卷列表</title>
    <link rel="stylesheet" href="css/questionnaire.css">
    <link rel="stylesheet" href=css/homePage.css>
    <!-- 引入 Bootstrap 样式表 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap-4.3.1.min.js"></script>
<body>

<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)">
    <a class="navbar-brand" href="#">问卷列表</a>
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


<!-- 分隔线与标题 -->
<div class="container" >
    <div class="section-divider" style="color: red">
        <div class="section-title" style="color: #051b11"> 调查问卷</div>
    </div>
</div>

<div class="survey-list">

    <c:forEach var="survey" items="${surveys}">
    <div class="survey-item">
        <div class="survey-content">
                 <a href="viewSurveyServlet?id=${survey.id}">${survey.surveyContent}</a>
        </div>
        <div class="survey-publish-date">
            发布时间：${survey.publishTime}
        </div>
    </div>
    </c:forEach>

</div>

</body>
</html>


