<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <jsp:include page="bootstrap-cssPage.jsp"></jsp:include>
    <title>用户列表</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
    </script>
</head>
<body class="gray-bg">
<div class="">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理
                    <span class="c-gray en">&gt;</span> 用户列表
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="userlistForm">
                        <div class="col-lg-2 col-md-2 ">
                            <input class="form-control layer-date" name="time" type="text" placeholder="开户时间检索"
                                   id="time">
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <input class="form-control layer-date" name="username" id="username" type="text"
                                   placeholder="请输入用户名">
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="storeid" id="storeid">
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="usertype" id="usertype">
                                <option value="" selected="selected">请选择用户类型</option>
                                <option value="1">门店用户</option>
                                <option value="0">后台用户</option>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="userstatus" id="userstatus">
                                <option value="" selected="selected">请选择用户状态</option>
                                <option value="0">正常</option>
                                <option value="5">锁定</option>
                                <option value="9">注销</option>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-3 ">
                            <input class="btn btn-primary  layer-date" type="button" value="搜索"
                                   onclick="LoadingDataListOrderRealItems()">
                        </div>
                    </form>
                </div>
                <div class="ibox-content">
                    <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                        <button class="btn btn-primary glyphicon glyphicon-plus-sign" onclick="addUserInfo()">新增用户</button>
                        <button class="btn btn-danger glyphicon glyphicon-import" onclick="importErpStore()">导入门店</button>
                        <button class="btn btn-warning glyphicon glyphicon-edit" onclick="updateUserPass()">修改密码</button>
                        <button class="btn btn-success glyphicon glyphicon-star-empty" onclick="activeUserInfo()">激活用户</button>
                        <button class="btn btn-danger glyphicon glyphicon-lock" onclick="lockUserInfo()">锁定用户</button>
                        <button class="btn btn-gray glyphicon glyphicon-off" onclick="closeUserInfo()">注销用户</button>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <table class="usertable" id="usertable" data-height="540" data-mobile-responsive="true">

                </table>
            </div>
            <!-- 工具条-->
            <div class="detail-toolbar">

            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/userlist.js"></script>
</body>
</html>
