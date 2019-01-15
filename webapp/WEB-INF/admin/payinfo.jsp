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
    <title>支付流水</title>
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
                    <span class="c-gray en">&gt;</span> 支付流水
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="payinfolistFrom">
                        <div class="col-lg-2 col-md-2 ">
                            <input class="form-control layer-date" name="payinfocode" id="payinfocode" type="text"
                                   placeholder="请输入支付单号">
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <input class="form-control layer-date" name="time" type="text" placeholder="交易时间" id="time">
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                        <select style="height: 30px;" class="combobox form-control" type="text" name="paystatus" id="paystatus">
                            <option value="" selected="selected">请选择支付状态</option>
                            <option value="3">支付成功</option>
                            <option value="0">支付失败</option>
                        </select>
                    </div>
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="paytype" id="paytype">
                                <option value="" selected="selected">请选择支付类型</option>
                                <option value="0">微信支付</option>
                                <option value="2">值值宝支付</option>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="storeid" id="storeid">
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-3 ">
                            <input class="btn btn-primary  layer-date" type="button" value="搜索" onclick="LoadingDataListOrderRealItems()">
                        </div>
                    </form>
                </div>
                <div class="ibox-content" style="clear:  both;margin-left: 20px;">
                    <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                        <button class="btn btn-warning glyphicon glyphicon-import" onclick="importPayinfoInfo()">导出</button>
                    </div>
                    <table class="payinfostable" id="payinfostable" data-height="540" data-mobile-responsive="true">

                    </table>
                </div>
                <!-- 工具条-->
                <div class="detail-toolbar"></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/payinfo.js"></script>
</body>
</html>
