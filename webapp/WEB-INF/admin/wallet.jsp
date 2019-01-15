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
    <title>交易流水</title>
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
                    <span class="c-gray en">&gt;</span> 交易流水
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="walletlistFrom">
                        <div class="col-lg-2 col-md-2 ">
                            <input class="form-control layer-date" name="payinfocode" id="payinfocode" type="text"
                                   placeholder="请输入支付单号">
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <input class="form-control layer-date" name="time" type="text" placeholder="交易时间" id="time">
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="trasactionType" id="trasactionType">
                                <option value="" selected="selected">请选择值值宝交易类型</option>
                                <option value="1">充值</option>
                                <option value="2">付款</option>
                                <option value="3">订单批次撤款</option>
                                <option value="4">订单撤款</option>
                                <option value="5">退货</option>
                                <option value="6">财务操作</option>
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
                        <button class="btn btn-warning glyphicon glyphicon-import" onclick="importWalletInfo()">导出</button>
                    </div>
                    <table class="wallettrarecordstable" id="wallettrarecordstable" data-height="540" data-mobile-responsive="true">

                    </table>
                </div>
                <!-- 工具条-->
                <div class="detail-toolbar"></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/wallet.js"></script>
</body>
</html>
