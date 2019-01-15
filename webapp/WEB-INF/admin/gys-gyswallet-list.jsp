<!DOCTYPE HTML>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <title>供应商值值宝列表</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
    </script>
</head>
<body class="gray-bg">
<div class="">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 门店管理
                    <span class="c-gray en">&gt;</span> 供应商值值宝列表
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="selectForm">
                        <div class="row">
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="username" class="">用户名：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="username" id="username" type="text"
                                       placeholder="请输入用户名">
                            </div>
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="idnum" class="">身份证号：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="idnum" id="idnum" type="text"
                                       placeholder="请输入身份证号">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="time">创建时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段" name="time"
                                       id="time">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="updtimeStr">上次修改时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段" name="updtimeStr"
                                       id="updtimeStr">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="tel" class="">预留号码：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="tel" id="tel" type="text"
                                       placeholder="请输入预留号码">
                            </div>
                            <div class="col-lg-1 col-md-1  col-sm-1 text-right">
                                <label class=" control-label " style=" padding-top: 8px;">余额段：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <input class="form-control dsp" placeholder="最低价" name="minBalance" type="text" id="minBalance"> - <input
                                    class="form-control dsp" placeholder="最高价" type="text" name="maxBalance" id="maxBalance">
                            </div>
                            <label for="gysid" class="col-lg-1 col-md-1 col-sm-1 col-xs-1 control-label">供应商：</label>
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="gysid" id="gysid">
                                </select>
                            </div>
                            <div class="col-lg-1 col-md-1 ">
                                <input class="btn btn-primary  layer-date" type="button" value="搜索" onclick="LoadingDataListOrderRealItems()">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="ibox-content">
                </div>
            </div>
            <div class="ibox-content">
                <table class="gys-withdraw-table" id="gys-withdraw-table" data-height="540"
                       data-mobile-responsive="true">

                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/gys-gyswallet-list.js"></script>
</body>
</html>
