
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/19
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问卷列表</title>
    <link rel="stylesheet" href="css/questionnaire.css">
    <link rel="stylesheet" href=css/homePage.css>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)"  >
    <a class="navbar-brand" href="#">USST食堂系统首页</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="switchContent('content1');">首页</a>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    食堂
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#canteen1" data-canteen="1">食堂1</a>
                    <a class="dropdown-item" href="#canteen2" data-canteen="2">食堂2</a>
                    <a class="dropdown-item" href="#canteen3" data-canteen="3">食堂3</a>
                    <!-- 添加更多食堂选项 -->
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="switchContent('content2');">问卷</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#account-management">账号管理</a>
            </li>
        </ul>
    </div>
</nav>


<!-- 分隔线与标题 -->
<div class="container" >
    <div class="section-divider" style="color: red">
        <div class="section-title" style="color: #051b11"> ${survey.surveyContent}</div>
    </div>
</div>

<div class="question-container">
    <h2>${survey.surveyContent}</h2>
    <p>发布时间：${survey.publishTime}</p>

    <c:forEach var="question" items="${survey.questionList}">
        <div class="question-title">${question.questionContent}</div>
        <c:forEach var="option" items="${question.optionList}">
            <div class="option">
                <span class="option-text">${option.optionContent}</span>
            </div>
        </c:forEach>
    </c:forEach>
</div>

</body>
</html>


