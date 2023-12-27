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
    <script src="lottie/lottie.min.js"></script>
    <title>评论页面</title>
</head>
<style>
    .hidden {
        display: none;
    }

    .heart-container {
        width: 60px; /* 设置心形图标容器的宽度 */
        height: 60px; /* 设置心形图标容器的高度 */
        cursor: pointer; /* 设置鼠标样式为手型 */
        display: inline-block; /* 将容器设置为行内块元素 */
        vertical-align: middle; /* 垂直对齐方式为中间 */
    }

    .reply-button {
        margin-right: 10px; /* 调整显示回复按钮的右边距 */
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
        const message = JSON.parse(ev.data);
        if (message.replyMessageId === parentInfo.replyId) {
            addReplyToFirstComment(message);
        }
        if(message.replyMessageId !== parentInfo.replyId){
            addReplyToComment(message);
        }
    }
    socket.onclose = function () {
        console.log("socket已关闭");
    }
    var replyInfo = null;
    var parentInfo = {
        replyId:`${parentMessage.id}`,
        replyName:`${parentMessage.name}`,
        parentId:`${parentMessage.id}`
    }
    console.log(parentInfo);

    function addAnimationHeart(heartContainer,initialLikedState){
        let isLiked = (initialLikedState === 'true');
        let animationHeart = bodymovin.loadAnimation({
            container: heartContainer,
            renderer: 'svg',
            loop: false,
            autoplay: false,
            path: "animations/heart.json"
        });
        if (isLiked) {
            animationHeart.goToAndPlay(30, true); // 播放动画至结束
        } else {
            animationHeart.goToAndStop(0, true)// 停止动画在第一帧
        }
        heartContainer.addEventListener('click', function () {
            const id = heartContainer.getAttribute('value');
            console.log(id);
            if (!isLiked) {
                animationHeart.goToAndPlay();
                isLiked = true;
                like("点赞", id);
            } else {
                animationHeart.goToAndStop(0); // 停止动画在第一帧
                isLiked = false;
                like("取消点赞", id);
            }
        });
    }
    document.addEventListener("DOMContentLoaded", function () {
        // 获取所有的评论组件
        const parent=document.getElementById("parent_heart");
        addAnimationHeart(parent,`${parentMessage.like}`);
        const commentContainers = document.querySelectorAll('.card');
        commentContainers.forEach(function (commentContainer) {
            const heartContainer = commentContainer.querySelector('.heart-container');
            const initialLikedState = commentContainer.dataset.initialLikedState; // 获取评论的初始点赞状态
            addAnimationHeart(heartContainer, initialLikedState);
        });
    });

    function toggleReplies(id) {
        const replies = document.getElementById('replies-' + id);
        replies.classList.toggle('hidden');
    }

    function deselect(){
        const commentContent = document.getElementById('comment-content');
        replyInfo = null;
        commentContent.placeholder = "请输入评论内容";
    }

    function reply(replyId, replyName, parentId) {
        const commentContent = document.getElementById('comment-content');
        replyInfo = {
            replyId: replyId,
            replyName: replyName,
            parentId: parentId
        };
        console.log(replyInfo);
        commentContent.placeholder = "当前回复" + replyName;
    }

    function like(action, id) {
        fetch(`SubmitCommunityServlet?action=` + action + `&id=` + id, {
            method: "GET",
            headers: {
                "Content-Type": "text/plain"
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('网络错误');
                }
            })
            .catch(error => {
                console.error('发生错误:', error);
            });

    }

    function addReplyToFirstComment(message) {
        const commentsSection = document.getElementById('comments-section');
        const newCommentElement = document.createElement('div');
        newCommentElement.classList.add('card', 'mb-4');
        newCommentElement.dataset.initialLikedState = message.like;
        const cardBody = document.createElement('div');
        cardBody.classList.add('card-body');
        const row1 = document.createElement('div');
        row1.classList.add('row', 'justify-content-between');
        const col1 = document.createElement('div');
        col1.classList.add('col');
        const nameElement = document.createElement('h5');
        nameElement.classList.add('card-title', 'fw-bold');
        nameElement.textContent = message.name;
        const col2 = document.createElement('div');
        col2.classList.add('col-auto');
        const timeElement = document.createElement('h6');
        timeElement.classList.add('card-subtitle', 'mb-2', 'text-muted');
        timeElement.textContent = message.publishTime;
        const contentElement = document.createElement('p');
        contentElement.classList.add('card-text');
        contentElement.textContent = message.content;
        const row2 = document.createElement('div');
        row2.classList.add('row', 'justify-content-between', 'mt-3', 'align-items-center');
        const col3 = document.createElement('div');
        col3.classList.add('col-auto');
        const replyLink = document.createElement('a');
        replyLink.classList.add('text-decoration-none');
        replyLink.href = "javascript:void(0)";
        replyLink.textContent = '回复';
        replyLink.onclick = function() {
            reply(message.id, message.name, message.parentId);
        };
        const replyButton = document.createElement('button');
        replyButton.classList.add('btn', 'btn-primary', 'reply-button');
        replyButton.textContent = `显示回复(`+message.comments+`)`;
        replyButton.onclick = function() {
            toggleReplies(message.id);
        };
        const col4 = document.createElement('div');
        col4.classList.add('col-auto');
        const heartContainer = document.createElement('div');
        heartContainer.classList.add('heart-container');
        heartContainer.value = message.id;
        const repliesElement = document.createElement('div');
        repliesElement.classList.add('replies', 'col-12', 'hidden');
        repliesElement.id = `replies-`+message.id;
        col1.appendChild(nameElement);
        col2.appendChild(timeElement);
        row1.appendChild(col1);
        row1.appendChild(col2);
        col3.appendChild(replyLink);
        col3.appendChild(replyButton);
        row2.appendChild(col3);
        row2.appendChild(col4);
        col4.appendChild(heartContainer);
        cardBody.appendChild(row1);
        cardBody.appendChild(contentElement);
        cardBody.appendChild(row2);
        newCommentElement.appendChild(cardBody);
        const initialLikedState = newCommentElement.dataset.initialLikedState; // 获取评论的初始点赞状态
        addAnimationHeart(heartContainer,initialLikedState)
        commentsSection.appendChild(newCommentElement);
    }

    function addReplyToComment(message) {
        const repliesContainer = document.getElementById(`replies-`+message.parentId);
        console.log(repliesContainer);
        const newReplyElement = document.createElement('div');
        newReplyElement.classList.add('card', 'bg-secondary', 'text-white', 'mb-2');
        newReplyElement.dataset.initialLikedState = message.like;
        const cardBody = document.createElement('div');
        cardBody.classList.add('card-body', 'd-flex', 'justify-content-between', 'align-items-center');
        const contentWrapper = document.createElement('div');
        const nameElement = document.createElement('h5');
        nameElement.classList.add('card-title', 'fw-bold');
        nameElement.textContent = message.name+` -> `+message.replyName;
        const subtitleElement = document.createElement('h6');
        subtitleElement.classList.add('card-subtitle', 'mb-2', 'text-muted');
        subtitleElement.textContent = `回复于: `+message.publishTime;
        const textElement = document.createElement('p');
        textElement.classList.add('card-text');
        textElement.textContent = message.content;
        const replyLink = document.createElement('a');
        replyLink.classList.add('text-decoration-none');
        replyLink.href = "javascript:void(0)";
        replyLink.textContent = '回复';
        replyLink.onclick = function() {
            reply(message.id, message.name, message.parentId);
        };
        const heartContainer = document.createElement('div');
        heartContainer.classList.add('heart-container');
        heartContainer.value = message.id;
        contentWrapper.appendChild(nameElement);
        contentWrapper.appendChild(subtitleElement);
        contentWrapper.appendChild(textElement);
        contentWrapper.appendChild(replyLink);
        cardBody.appendChild(contentWrapper);
        cardBody.appendChild(heartContainer);
        newReplyElement.appendChild(cardBody);
        const initialLikedState = newReplyElement.dataset.initialLikedState; // 获取评论的初始点赞状态
        addAnimationHeart(heartContainer,initialLikedState);
        repliesContainer.appendChild(newReplyElement);
    }



    function submit() {
        const username = document.getElementById('username');
        const commentContent = document.getElementById('comment-content');

        const data = {
            grandpaId:parentInfo.replyId,
            username: username.value,
            'comment-content': commentContent.value,
            replyId: replyInfo ? replyInfo.replyId : parentInfo.replyId,
            replyName: replyInfo ? replyInfo.replyName : parentInfo.replyName,
            parentId: replyInfo ? replyInfo.parentId : parentInfo.replyId
        };
        console.log("发送请求的数据():",data)

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
                commentContent.value = '';
                commentContent.placeholder = '请输入';
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
            <h1 class="fw-bold">${parentMessage.title}</h1>
            <scan id="parentMessageContent" class="fw-bold">${parentMessage.content}</scan>
            <h2 id="parentMessageName" class="text-primary">用户:${parentMessage.name}</h2>
            <h2 class="text-muted">发布时间: ${parentMessage.publishTime}</h2>
            <div class="heart-container" id="parent_heart" value="${parentMessage.id}"></div>
            <c:forEach var="message" items="${replyList}">
                <div class="card mb-4" data-initial-liked-state="${message.like}">
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
                        <div class="row justify-content-between mt-3 align-items-center">
                            <div class="col-auto">
                                <a href="javascript:void(0)" class="text-decoration-none"
                                   onclick="reply(${message.id},'${message.name}',${message.id})">回复</a>
                                <button class="btn btn-primary reply-button" onclick="toggleReplies(${message.id})">
                                    显示回复(${message.comments})
                                </button>
                            </div>
                            <div class="col-auto">
                                <div class="heart-container" value="${message.id}"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="replies col-12 hidden" id="replies-${message.id}">
                                <!-- 子评论 -->
                                <c:forEach var="cm" items="${message.replyList}">
                                    <div class="card bg-secondary text-white mb-2 "
                                         data-initial-liked-state="${cm.like}">
                                        <div class="card-body d-flex justify-content-between align-items-center">
                                            <div>
                                                <h5 class="card-title fw-bold">${cm.name} -> ${cm.replyName}</h5>
                                                <h6 class="card-subtitle mb-2 text-muted">回复于: ${cm.publishTime}</h6>
                                                <p class="card-text">${cm.content}</p>
                                                <a href="javascript:void(0)" class="text-decoration-none"
                                                   onclick="reply(${cm.id},${cm.name},${cm.parentId})">回复</a>
                                            </div>
                                            <div>
                                                <div class="heart-container" value="${cm.id}"></div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="comment-form">
            <h3 class="text-primary">发表评论</h3>
            <label for="username" class="form-label">用户名：</label>
            <input type="text" id="username" name="username" class="form-control" required>
            <label for="comment-content" class="form-label">评论内容：</label>
            <textarea id="comment-content" name="comment-content" class="form-control" required></textarea>
            <button id="submit-comment" class="btn btn-success" onclick="submit()">发表评论</button>
            <button id="deselect" class="btn btn-success" onclick="deselect()">取消选择回复</button>
        </div>
        <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    </div>
</div>
</body>
</html>
