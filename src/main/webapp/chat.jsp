<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/28
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Chat Room</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .chat-box {
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            max-width: 70%; /* Adjust as needed */
            word-wrap: break-word;
        }

        .left-msg {
            background-color: #f0f0f0; /* User 1's message background color */
            text-align: left;
        }

        .right-msg {
            background-color: #d4edda; /* User 2's message background color */
            text-align: right;
        }
    </style>
    <script>
        const socket = new WebSocket('ws://' + window.location.host + '/canteenproject_war_exploded' + '/ChatMessageUpdate');
        socket.onopen = function () {
            console.log("socket连接成功");
            socket.send(JSON.stringify({userId: `${user.id}`}))
        }
        socket.onerror = () => {
            console.log("socket连接错误");
        }
        socket.onmessage = function (ev) {
            const message = JSON.parse(ev.data);
            let chatMessages = document.getElementById('chatMessages');
            let newMessage = document.createElement('div');
            newMessage.classList.add('chat-box');
            newMessage.classList.add('right-msg');
            newMessage.innerHTML = '<strong>' + message.name + ':</strong><br>' + message.messageContent.replace(/\n/g, '<br>');
            chatMessages.appendChild(newMessage);
        }
        socket.onclose = function () {
            console.log("socket已关闭");
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Online Chat Room: ${replyUser.username} </h1>
    <div id="chatMessages" class="mb-4">
        <c:forEach var="message" items="${history}">
            <div class="chat-box ${message.senderId eq user.id ? 'left-msg' : 'right-msg'}">
                <strong>${message.name}:</strong><br>
                    ${message.messageContent}<br>
            </div>
        </c:forEach>
    </div>

    <div class="mb-3">
        <textarea id="messageInput" class="form-control" placeholder="Type your message here" rows="3"></textarea>
        <button class="btn btn-primary mt-2" onclick="sendMessage()">Send</button>
    </div>
</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
    function sendMessage() {
        let message = document.getElementById('messageInput').value;
        document.getElementById('messageInput').value = '';
        let receiverId = `${replyUser.id}`;
        let data = {
            receiverId: receiverId,
            messageContent: message
        };
        console.log(data);
        // 发起 POST 请求
        fetch('ChatServlet', {
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
                return response.json();
            })
            .then(data => {
                // 成功发送消息后的处理
                console.log(data);
                let chatMessages = document.getElementById('chatMessages');
                let newMessage = document.createElement('div');
                newMessage.classList.add('chat-box');
                newMessage.classList.add('left-msg');
                newMessage.innerHTML = '<strong>' + data.name + ':</strong><br>' + data.messageContent.replace(/\n/g, '<br>');
                chatMessages.appendChild(newMessage);
                socket.send(JSON.stringify(data));
            })
            .catch(error => {
                console.error('信息错误', error);
            });
    }
</script>
</body>
</html>
