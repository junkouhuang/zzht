<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>值值微信新品发布登录界面</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"><span>值值微信新品发布登录界面</span></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <span class="msg">${errorMsg}</span>
        <form class="form form-horizontal" action="${pageContext.request.contextPath}/userlogin" method="post">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input name="username" type="text" placeholder="账户" class="input-text size-L" value="${username}">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <label for="online">
                        <input type="checkbox" name="online" id="online" value="">
                        使我保持登录状态</label>
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer" style="font-size:15px;">值值库存交易平台</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
    function aClick() {
        $("#img").hide().attr('src','${pageContext.request.contextPath}/commonController/getJPGCode?' + Math.floor(Math.random() * 100)).fadeIn();
    }
</script>
</body>
</html>