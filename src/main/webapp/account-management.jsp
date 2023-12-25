<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="css/account-management.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">系统管理员</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="SdFirstPageServlet">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#complaints">投诉信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AccountManagementServlet">账号管理</a>
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
                <div class="container mt-4 table-wrapper">
                    <h2>我的账号</h2>
                    <table class="table table-bordered myTable">
                        <tbody>
                        <tr>
                            <th scope="row">用户名</th>
                            <td><span id="username">${requestScope.user.username}</span></td>
                        </tr>
                        <tr>
                            <th scope="row">密码</th>
                            <td><span id="password">********</span></td>
                        </tr>
                        <tr>
                            <th scope="row">手机号</th>
                            <td><span id="phone">${requestScope.user.phoneNumber}</span></td>
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
                            <form id="modifyForm" action="AccountManagementServlet" method="post">
                                <div class="form-group">
                                    <label for="newUsername">新用户名</label>
                                    <input type="text" class="form-control" id="newUsername" name="newUsername">
                                </div>
                                <div class="form-group">
                                    <label for="newPassword">新密码</label>
                                    <input type="password" class="form-control" id="newPassword" name="newPassword">
                                </div>
                                <div class="form-group">
                                    <label for="newPhone">新手机号</label>
                                    <input type="text" class="form-control" id="newPhone" name="newPhone">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary" id="saveChanges">保存更改</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 用户管理部分 -->
            <section id="userManagement" class="account-section">
                <div class="header">
                    <h2>用户管理</h2>
                    <!-- 搜索框 -->
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="输入用户名进行搜索" id="searchInput">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="searchButton">搜索</button>
                        </div>
                    </div>
                </div>

                <!-- 用户列表表格 -->
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>手机号</th>
                        <th>身份</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 使用 JSTL 遍历 userMap 输出表格内容 -->
                    <c:forEach var="entry" items="${requestScope.userMap}">
                        <c:set var="user" value="${entry.value}" />
                        <tr>
                            <!-- 显示用户信息，包括其他列 -->
                            <td id="username_${user.id}">${user.username}</td>
                            <td id="password_${user.id}">*******</td> <!-- 这里用*代替密码 -->
                            <td id="phoneNumber_${user.id}">${user.phoneNumber}</td>
                            <td id="role_${user.id}">${user.role}</td>
                            <td>
                                <div class="btn-group">
                                    <!-- 编辑按钮，点击时弹出模态框 -->
                                    <button class="btn btn-info btn-sm btn-margin" data-toggle="modal" data-target="#editModal${user.id}" onclick="fillEditModal('${user.id}')">编辑</button>
                                    <button class="btn btn-danger btn-sm">删除</button>
                                </div>
                            </td>
                        </tr>

                        <!-- 模态框 -->
                        <div class="modal fade" id="editModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel${entry.key}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel${entry.key}">编辑用户信息</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 用户信息表单 -->
                                        <div class="modal-body">
                                            <!-- 用户信息表单 -->
                                            <input type="hidden" id="editUserId_${user.id}" value="${user.id}" >
                                            <div class="form-group">
                                                <label for="editUsername_${user.id}">用户名</label>
                                                <input type="text" class="form-control" id="editUsername_${user.id}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="editPassword_${user.id}">密码</label>
                                                <input type="password" class="form-control" id="editPassword_${user.id}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="editPhone_${user.id}">手机号</label>
                                                <input type="text" class="form-control" id="editPhone_${user.id}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="editRole_${user.id}">身份</label>
                                                <select class="form-control" id="editRole_${user.id}">
                                                    <option value="普通用户">普通用户</option>
                                                    <option value="食堂管理员">食堂管理员</option>
                                                </select>
                                            </div>
                                            <!-- 如果是食堂管理员，则显示管理的食堂 -->
                                            <div class="form-group" id="editCanteenSection_${user.id}" style="display: none;">
                                                <label for="CanteenSection_${user.id}">管理的食堂:</label>
                                                <select class="form-control" id="CanteenSection_${user.id}">
                                                    <c:forEach var="canteens" items="${requestScope.canteens}">
                                                        <option value="${canteens.id}">${canteens.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 添加用户按钮 -->
                <button class="btn btn-success" id="addUserButton" data-toggle="modal" data-target="#addUserModal">添加用户</button>
            </section>
        </div>
    </div>
</div>
<!-- 添加按钮模态框 -->
<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">添加用户</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 用户名输入框 -->
                <div class="form-group">
                    <label for="addUsername">用户名</label>
                    <input type="text" class="form-control" id="addUsername">
                </div>
                <!-- 密码输入框 -->
                <div class="form-group">
                    <label for="addPassword">密码</label>
                    <input type="password" class="form-control" id="addPassword">
                </div>
                <!-- 手机号输入框 -->
                <div class="form-group">
                    <label for="addPhone">手机号</label>
                    <input type="text" class="form-control" id="addPhone">
                </div>
                <!-- 身份选择框 -->
                <div class="form-group">
                    <label for="identity">身份</label>
                    <select class="form-control" id="identity">
                        <option value="普通用户">普通用户</option>
                        <option value="食堂管理员">食堂管理员</option>
                    </select>
                </div>
                <!-- 食堂选择框 -->
                <div class="form-group" id="canteenSelect" style="display: none;">
                    <label for="canteen">管理的食堂</label>
                    <select class="form-control" id="canteen">
                        <c:forEach var="canteens" items="${requestScope.canteens}">
                            <option value="${canteens.id}">${canteens.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveButton">保存</button>
            </div>
        </div>
    </div>
</div>

<script>
    // JavaScript 代码来处理点击切换
    $(document).ready(function() {
        $('.account-link').click(function() {
            let target = $(this).attr('href');
            $('.account-section').removeClass('active');
            $(target).addClass('active');
        });
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 监听修改按钮点击事件
        document.getElementById('modifyBtn').addEventListener('click', function() {
            // 获取当前账号信息并填充到模态框中
            let username = document.getElementById('username').textContent;
            let phone = document.getElementById('phone').textContent;

            document.getElementById('newUsername').value = username;
            document.getElementById('newPhone').value = phone;
        });

        // 监听保存更改按钮点击事件
        document.getElementById('saveChanges').addEventListener('click', function() {
            // 获取修改后的信息并更新到页面中
            let newUsername = document.getElementById('newUsername').value;
            let newPassword = document.getElementById('newPassword').value;
            let newPhone = document.getElementById('newPhone').value;

            document.getElementById('username').textContent = newUsername;
            document.getElementById('password').textContent = newPassword ? '********' : '';
            document.getElementById('phone').textContent = newPhone;

            // 关闭模态框
            $('#modifyModal').modal('hide');
        });
    });
</script>
<script>
    // 获取身份选择框和食堂选择框
    let identitySelect = document.getElementById('identity');
    let canteenSelect = document.getElementById('canteenSelect');

    // 添加事件监听器
    identitySelect.addEventListener('change', function() {
        // 获取当前所选身份
        let selectedIdentity = identitySelect.value;

        // 如果选择了食堂管理员，则显示食堂选择框，否则隐藏
        if (selectedIdentity === '食堂管理员') {
            canteenSelect.style.display = 'block';
        } else {
            canteenSelect.style.display = 'none';
        }
    });
</script>
<script>
    function fillEditModal(userId) {
        // 获取表格中的信息
        let editUsername = document.getElementById('username_' + userId).textContent;
        let editPhoneNumber = document.getElementById('phoneNumber_' + userId).textContent;
        let editRole = document.getElementById('role_' + userId).textContent;

        // 获取模态框中的表单元素
        let modalUsername = document.getElementById('editUsername_' + userId);
        let modalPassword = document.getElementById('editPassword_' + userId);
        let modalPhoneNumber = document.getElementById('editPhone_' + userId);
        let modalRole = document.getElementById('editRole_' + userId);
        let modalCanteenSection = document.getElementById('editCanteenSection_' + userId);

        // 填充模态框中的表单元素值
        modalUsername.value = editUsername;
        modalPassword.value = '*******'; // 这里用*代替密码
        modalPhoneNumber.value = editPhoneNumber;
        modalRole.value = editRole;
        // 添加事件监听器
        if(editRole === "食堂管理员"){
            modalCanteenSection.style.display = 'block';
        } else {
            modalCanteenSection.style.display = 'none';
        }
        modalRole.addEventListener('change', function() {
            // 获取当前所选身份
            let selectedIdentity = modalRole.value;
            // 如果选择了食堂管理员，则显示食堂选择框，否则隐藏
            if (selectedIdentity === '食堂管理员') {
                modalCanteenSection.style.display = 'block';
            } else {
                modalCanteenSection.style.display = 'none';
            }
        });
        // 将表单字段设置为可编辑状态
        document.getElementById('editUsername_' + userId).readOnly = false;
        document.getElementById('editPassword_' + userId).readOnly = false;
        document.getElementById('editPhone_' + userId).readOnly = false;
        document.getElementById('editRole_' + userId).readOnly = false;
        document.getElementById('editCanteen_' + userId).readOnly = false; // 如果需要食堂信息的话
    }
</script>
<script>
    function saveUserData(userId) {
        let username = document.getElementById('username' + userId).value;
        let password = document.getElementById('password' + userId).value;
        let phone = document.getElementById('phone' + userId).value;
        let role = document.getElementById('role' + userId).value;
        let canteen = document.getElementById('canteen' + userId).value; // 如果需要食堂信息的话

        // 构建表单数据对象
        let formData = new FormData();
        formData.append('userId', userId);
        formData.append('username', username);
        formData.append('password', password);
        formData.append('phone', phone);
        formData.append('role', role);
        formData.append('canteen', canteen); // 如果需要食堂信息的话

        // 使用 AJAX 发送表单数据到 Servlet
        let xhr = new XMLHttpRequest();
        xhr.open('POST', 'YourServletURL', true);
        xhr.onload = function () {
            // 处理响应，如果需要的话
        };
        xhr.send(formData);
    }
</script>
<script>
    document.getElementById('saveButton').addEventListener('click', function() {
        let username = document.getElementById('addUsername').value;
        let password = document.getElementById('addPassword').value;
        let phone = document.getElementById('addPhone').value;
        let identity = document.getElementById('identity').value;
        let canteenId = document.getElementById('canteen').value;

        let userData = {
            username: username,
            password: password,
            phone: phone,
            identity: identity,
            canteenId: canteenId
        };

        let xhr = new XMLHttpRequest();
        let url = 'AddAccountServlet'; // 替换为您的 Servlet 地址

        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    let responseJson = JSON.parse(xhr.responseText);
                    console.log(responseJson);
                    if (responseJson.redirect) {
                        window.location.href = responseJson.redirect;
                    }
                } else {
                    console.error('Error occurred while sending data!');
                }
            }
        };

        xhr.send(JSON.stringify(userData));
    });
</script>
<script>
    // 获取所有模态框中的保存按钮
    let saveButtons = document.querySelectorAll('[id^="editModal"] .btn-primary');

    // 为每个保存按钮添加点击事件监听器
    saveButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            // 获取当前保存按钮所在模态框的用户ID
            let modalId = this.closest('.modal').id; // 获取最近的模态框的ID
            let userId = modalId.replace('editModal', ''); // 从模态框ID中提取用户ID

            // 使用提取的用户ID构建表单元素ID，并获取表单数据
            let editedUsername = document.getElementById('editUsername_'+userId).value;
            let editedPassword = document.getElementById('editPassword_'+userId).value;
            let editedPhone = document.getElementById('editPhone_'+userId).value;
            let editedRole = document.getElementById('editRole_'+userId).value;
            let editedCanteen = document.getElementById('CanteenSection_'+userId).value;

            document.getElementById('username_'+userId).textContent = editedUsername;
            document.getElementById('phoneNumber_'+userId).textContent = editedPhone;
            document.getElementById('role_'+userId).textContent = editedRole

            // 创建包含用户编辑数据的对象
            let editedUserData = {
                userId: userId,
                editedUsername: editedUsername,
                editedPassword: editedPassword,
                editedPhone: editedPhone,
                editedRole: editedRole,
                editedCanteenId: editedCanteen
            };

            let xhr = new XMLHttpRequest();
            let url = 'UpdateAccountServlet'; // 替换为您的 Servlet 地址

            xhr.open('POST', url, true);
            xhr.setRequestHeader('Content-Type', 'application/json');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        console.log('Data sent successfully!');
                        // 可以在此处编写成功后的逻辑
                    } else {
                        console.error('Error occurred while sending data!');
                    }
                }
            };
            xhr.send(JSON.stringify(editedUserData));
            // 关闭模态框
            $('#editModal'+userId).modal('hide');
        });
    });

</script>
</body>
</html>