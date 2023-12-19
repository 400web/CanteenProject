<%--
  Created by IntelliJ IDEA.
  User: 86189
  Date: 2023/12/19
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号管理</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
        }
        .navbar {
            background: linear-gradient(to bottom, #fce4e4, #651616);
            border-bottom: 1px solid #dee2e6;
        }
        .navbar-brand {
            font-weight: bold;
            color: #ffffff;
        }
        .nav-link {
            color: #ffffff;
        }
        /* 添加自定义的样式 */
        .account-wrapper {
            display: flex;
            height: 100vh; /* 100%视窗高度 */
            padding: 20px 0; /* 上下留白为 20px，左右留白为 0 */
        }

        .nav-column {
            flex: 0 0 auto;
            width: max-content;
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 8px;
            margin-right: 20px; /* 右边留白 */
        }

        .content-column {
            flex: 1;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9; /* 背景色 */
        }

        .account-nav {
            list-style-type: none;
            padding-left: 0;
        }

        .account-nav li {
            margin-bottom: 10px;
        }

        .account-nav li a {
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .account-nav li a:hover {
            color: blue;
            background-color: #e0e0e0;
        }

        .account-section {
            display: none;
            padding: 20px;
        }

        .account-section.active {
            display: block;
        }

        .account-list h2 {
            margin-bottom: 20px;
        }

        .account-list ul {
            list-style: none;
            padding-left: 0;
        }

        .account-list ul li {
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn {
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-margin {
            margin-right: 5px;
        }
    </style>
</head>

<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">系统管理员</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="sdFirstPage.jsp">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#complaints">投诉信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="account-management.jsp">账号管理</a>
            </li>
        </ul>
    </div>
</nav>


<!-- 我的账号和用户管理部分 -->
<div class="container-fluid mt-4">
    <div class="row account-wrapper">
        <!-- 左侧导航栏 -->
        <div class="col-md-1 nav-column">
            <ul class="account-nav">
                <li><a href="#myAccount" class="account-link">我的账号</a></li>
                <li><a href="#userManagement" class="account-link">用户管理</a></li>
            </ul>
        </div>

        <!-- 右侧内容 -->
        <div class="col-md-11 content-column">
            <!-- 我的账号部分 -->
            <section id="myAccount" class="account-section active">
                <!-- 表格 -->
                <div class="container mt-4">
                    <h2>我的账号</h2>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <th scope="row">用户名</th>
                            <td><span id="username">JohnDoe</span></td>
                        </tr>
                        <tr>
                            <th scope="row">密码</th>
                            <td><span id="password">********</span></td>
                        </tr>
                        <tr>
                            <th scope="row">手机号</th>
                            <td><span id="phone">123-456-7890</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <!-- 修改按钮，触发模态框 -->
                    <button id="modifyBtn" class="btn btn-primary" data-toggle="modal" data-target="#modifyModal">修改</button>
                </div>
            </section>

            <!-- 修改账号信息的模态框 -->
            <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modifyModalLabel">修改账号信息</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- 修改账号信息的表单 -->
                            <form id="modifyForm">
                                <div class="form-group">
                                    <label for="newUsername">新用户名</label>
                                    <input type="text" class="form-control" id="newUsername">
                                </div>
                                <div class="form-group">
                                    <label for="newPassword">新密码</label>
                                    <input type="password" class="form-control" id="newPassword">
                                </div>
                                <div class="form-group">
                                    <label for="newPhone">新手机号</label>
                                    <input type="text" class="form-control" id="newPhone">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="saveChanges">保存更改</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 用户管理部分 -->
            <section id="userManagement" class="account-section">
                <h2 class="mb-4">用户管理</h2>

                <!-- 搜索框 -->
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="输入用户名进行搜索" id="searchInput">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="searchButton">搜索</button>
                    </div>
                </div>

                <!-- 用户列表表格 -->
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>手机号</th>
                        <th>身份</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="userList">
                    <!-- 这里是动态添加的用户列表 -->
                    <tr>
                        <td>用户1</td>
                        <td>123-456-7890</td>
                        <td>管理员</td>
                        <td>
                            <div class="btn-group">
                                <button class="btn btn-info btn-sm btn-margin">编辑</button>
                                <button class="btn btn-danger btn-sm">删除</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>用户2</td>
                        <td>987-654-3210</td>
                        <td>普通用户</td>
                        <td>
                            <div class="btn-group">
                                <button class="btn btn-info btn-sm btn-margin">编辑</button>
                                <button class="btn btn-danger btn-sm">删除</button>
                            </div>
                        </td>
                    </tr>
                    <!-- ... 可以根据实际情况添加更多用户信息 -->
                    </tbody>
                </table>

                <!-- 添加用户按钮 -->
                <button class="btn btn-success" id="addUserButton">添加用户</button>
            </section>
        </div>
    </div>
</div>

<!-- 引入Bootstrap的JavaScript库和jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // JavaScript 代码来处理点击切换
    $(document).ready(function() {
        $('.account-link').click(function() {
            var target = $(this).attr('href');
            $('.account-section').removeClass('active');
            $(target).addClass('active');
        });
    });
</script>

<script>
    // 监听修改按钮点击事件
    document.getElementById('modifyBtn').addEventListener('click', function() {
        // 获取当前账号信息并填充到模态框中
        var username = document.getElementById('username').textContent;
        var phone = document.getElementById('phone').textContent;

        document.getElementById('newUsername').value = username;
        document.getElementById('newPhone').value = phone;
    });

    // 监听保存更改按钮点击事件
    document.getElementById('saveChanges').addEventListener('click', function() {
        // 获取修改后的信息并更新到页面中
        var newUsername = document.getElementById('newUsername').value;
        var newPassword = document.getElementById('newPassword').value;
        var newPhone = document.getElementById('newPhone').value;

        document.getElementById('username').textContent = newUsername;
        document.getElementById('password').textContent = newPassword ? '********' : '';
        document.getElementById('phone').textContent = newPhone;

        // 关闭模态框
        $('#modifyModal').modal('hide');
    });
</script>
</body>
</html>