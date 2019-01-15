<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>绑定成功</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        *,html,body {
            margin: 0;
            padding: 0;
            background-size: cover;
        }
        .bindLoginSuccess {
            background: #333;
            opacity: 0.9;
            width: 100%;
            height: 100%;
            position: relative;
        }
        .bindLoginSuccess  div {
            position: absolute;
            top: 40%;
            left: 50%;
            margin-left: -40px;
            text-align: center;
        }
        .bindLoginSuccess  div img {
            width:80px;
            height:80px;
        }
        .bindLoginSuccess   div p {
            font-size: 16px;
            color: #FFFFFF;
            font-family: cursive;
            margin: 10px 0 40px;
        }
        .bindLoginSuccess   div a {
            color: #FFFFFF;
            font-family: cursive;
        }
    </style>
</head>
<body  style="background-image: url('${pageContext.request.contextPath}/images/bindlogin.png')">
    <div class="bindLoginSuccess">
        <div>
            <img src="${pageContext.request.contextPath}/images/ok.png">
            <p>已绑定</p>

            <a href="">解绑</a>
        </div>
    </div>
</body>
</html>
