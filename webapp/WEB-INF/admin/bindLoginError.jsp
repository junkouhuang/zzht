<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>绑定异常</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        *,html,body {
            margin: 0;
            padding: 0;
            background-size: cover;
        }
        .bindLoginSuccess {
            background: rgba(0, 0, 0, 0.6);
            width: 100%;
            height: 100%;
            position: relative;
            color: #ffffff;
        }
        .bindLoginSuccess  div {
            position: absolute;
            top: 40%;
            left: 50%;
            margin-left: -40px;
            text-align: center;
        }
        .bindLoginSuccess  div img {
            width:60px;
            height:60px;
        }
        .bindLoginSuccess   div p {
            font-size: 16px;
            color: #FFFFFF;
            font-family: cursive;
            margin-top:10px;
        }
    </style>
</head>
<body  style="background-image: url('${pageContext.request.contextPath}/images/bindlogin.jpg')">
    <div class="bindLoginSuccess">
        <div>
            <img src="${pageContext.request.contextPath}/images/.png">
            <p>${errmsg == null ?绑定异常 :errmsg}</p>
        </div>
    </div>
</body>
</html>
