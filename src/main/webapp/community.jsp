<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/18
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>评论页面</title>
</head>
<style>
    .hidden {
        display: none;
    }
</style>
<script>
    const socket = new WebSocket('ws://' + window.location.host + '/canteenproject_war_exploded' + '/updatesCommunity');
    socket.onopen = function () {
        console.log("socket连接成功");
    }
    socket.onerror = () => {
        console.log("socket连接错误");
    }
    socket.onmessage = function (ev) {
        console.log(ev.data);
        const message = JSON.parse(ev.data);
        console.log(message);
        console.log(parentInfo.replyId);
        if (message.replyMessageId === parentInfo.replyId) {
            addReplyToFirstComment(message);
        } else {
            console.log(true);
            addReplyToComment(message);
        }
    }
    socket.onclose = function () {
        console.log("socket已关闭");
    }
    var replyInfo = null;
    var parentInfo = null;
    document.addEventListener('DOMContentLoaded', function () {
        // 在这里获取元素的值并存储在 replyInfo 对象中
        const parentMessageId = document.getElementById('parentMessageId');
        const parentMessageName = document.getElementById('parentMessageName');
        // 确保元素存在后才将值赋给 replyInfo
        if (parentMessageId && parentMessageName) {
            parentInfo = {
                replyId: parentMessageId.textContent,
                replyName: parentMessageName.textContent,
                parentId: parentMessageId.textContent
            };
        }
    });

    function toggleReplies(id) {
        const replies = document.getElementById('replies-' + id);
        replies.classList.toggle('hidden');
    }

    function reply(replyId, replyName, parentId) {
        const commentContent = document.getElementById('comment-content');
        replyInfo = {
            replyId: replyId,
            replyName: replyName,
            parentId: parentId
        };
        console.log(replyInfo);
        commentContent.placeholder = "回复" + replyName;
    }

    function deselect() {
        const commentContent = document.getElementById('comment-content');
        replyInfo = null;
        commentContent.placeholder = "请输入";
    }

    function addReplyToFirstComment(message) {
        // 获取评论区容器
        const commentsSection = document.getElementById('comments-section');

        // 创建新评论的外部容器元素
        const newCommentElement = document.createElement('div');
        newCommentElement.classList.add('comment');

        // 创建评论头部元素
        const commentHeader = document.createElement('div');
        commentHeader.classList.add('comment-header', 'd-flex', 'justify-content-between');
        commentHeader.innerHTML = '<span class="user-name fw-bold">' + message.name + '</span>' +
            '<span class="comment-time text-muted">发表于: ' + message.publishTime + '</span>';

        // 创建评论内容元素
        const commentContent = document.createElement('div');
        commentContent.classList.add('comment-content');
        commentContent.innerHTML = message.content +
            '<a href="javascript:void(0)" class="text-decoration-none" onclick="reply(' + message.id + ', \'' + message.name + '\', ' + message.id + ')">回复</a>' +
            '<button class="btn btn-primary reply-button" onclick="toggleReplies(this)">显示回复(' + message.comments + ')</button>' +
            '<div class="replies hidden" id="replies-' + message.id + '"></div>';
        console.log(message.id);
        // 将评论头部和内容添加到新评论的容器中
        newCommentElement.appendChild(commentHeader);
        newCommentElement.appendChild(commentContent);

        // 将新评论添加到评论区容器中
        commentsSection.appendChild(newCommentElement);
    }

    function addReplyToComment(message) {
        const repliesContainer = document.getElementById(`replies-` + message.parentId);
        console.log(message.parentId);
        // 创建新的评论元素
        const newReplyElement = document.createElement('div');
        newReplyElement.classList.add('reply');
        newReplyElement.innerHTML = '\
    <span class="user-name fw-bold">' + message.name + ' -> ' + message.replyName + '</span>\
    <span class="comment-time text-muted">回复于：' + message.publishTime + '</span>\
    <div class="reply-content">' + message.content + '</div>\
    <a href="javascript:void(0)" class="text-decoration-none" onclick="reply(' + message.id + ',\'' + message.name + '\',' + message.parentId + ')">回复</a>\
';
        // 添加新评论至指定的二级评论区域
        repliesContainer.appendChild(newReplyElement);
    }

    function submit() {
        const username = document.getElementById('username');
        const commentContent = document.getElementById('comment-content');

        const data = {
            username: username.value,
            'comment-content': commentContent.value,
            replyId: replyInfo ? replyInfo.replyId : parentInfo.replyId,
            replyName: replyInfo ? replyInfo.replyName : parentInfo.replyName,
            parentId: replyInfo ? replyInfo.parentId : parentInfo.replyId
        };
        console.log(data);

        fetch('SubmitCommunityServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('网络错误');
                }
                console.log('评论已提交');
                replyInfo = null;
                username.textContent = "";
                commentContent.textContent = "";
                commentContent.placeholder = "请输入";
                return response.json();
            })
            .then(data => {
                // 在这里处理从服务器返回的数据
                console.log('从服务器返回的数据:', data);
                socket.send(JSON.stringify(data));
            })
            .catch(error => {
                console.error('发生错误:', error);
            });
    }
</script>
<body>
<div class="page-wrapper pt-4 pb-4">
    <div class="container-sm">
        <div id="comments-section">
            <p id="parentMessageId" style="display: none">${parentMessage.id}</p>
            <h1 id="parentMessageContent" class="fw-bold">${parentMessage.content}</h1>
            <h2 id="parentMessageName" class="text-primary">${parentMessage.name}</h2>
            <h2 class="text-muted">发布时间: ${parentMessage.publishTime}</h2>
            <c:forEach var="message" items="${replyList}">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row justify-content-between">
                            <div class="col">
                                <h5 class="card-title fw-bold">${message.name}</h5>
                            </div>
                            <div class="col-auto">
                                <h6 class="card-subtitle mb-2 text-muted">${message.publishTime}</h6>
                            </div>
                        </div>
                        <p class="card-text">${message.content}</p>
                        <div class="row justify-content-between mt-3">
                            <div class="col-auto">
                                <a href="javascript:void(0)" class="text-decoration-none"
                                   onclick="reply(${message.id},${message.name},${message.parentId})">回复</a>
                                <button class="btn btn-primary reply-button" onclick="toggleReplies(${message.id})">
                                    显示回复(${message.comments})
                                </button>
                            </div>
                            <div class="row">
                                <div class="replies col-12 hidden" id="replies-${message.id}">
                                    <!-- 这里是回复内容 -->
                                    <c:forEach var="cm" items="${message.replyList}">
                                        <div class="card bg-secondary text-white mb-2">
                                            <div class="card-body">
                                                <div class="row justify-content-between">
                                                    <div class="col">
                                                        <h5 class="card-title fw-bold">${cm.name} -> ${cm.replyName}</h5>
                                                    </div>
                                                    <div class="col-auto">
                                                        <h6 class="card-subtitle mb-2 text-muted">回复于: ${cm.publishTime}</h6>
                                                    </div>
                                                </div>
                                                <p class="card-text">${cm.content}</p>
                                                <a href="javascript:void(0)" class="text-decoration-none"
                                                   onclick="reply(${cm.id},${cm.name},${cm.parentId})">回复</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="comment-form">
            <h3 class="text-primary">发表评论</h3>
            <p id="replyId" style="display: none;">${parentMessage.id}</p>
            <p id="replyName" style="display: none">${parentMessage.name}</p>
            <p id="parentId" style="display: none">${parentMessage.id}</p>
            <label for="username" class="form-label">用户名：</label>
            <input type="text" id="username" name="username" class="form-control" required>
            <label for="comment-content" class="form-label">评论内容：</label>
            <textarea id="comment-content" name="comment-content" class="form-control" required></textarea>
            <button id="submit-comment" class="btn btn-success" onclick="submit()">发表评论</button>
            <button id="deselect" class="btn btn-success" onclick="deselect()">取消选择回复</button>
        </div>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </div>
</div>
</body>
</html>
