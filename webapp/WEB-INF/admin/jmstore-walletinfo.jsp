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
    <title>加盟店值值宝流动情况</title>
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
                    <span class="c-gray en">&gt;</span> 加盟店值值宝流动情况
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="selectForm">
                        <div class="row">
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="time">日期：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段" name="time"
                                       id="time">
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="mdlx"
                                        id="mdlx">
                                    <option value="" selected="selected">请选择门店类型</option>
                                    <option value="0">加盟店</option>
                                    <option value="3">直营店</option>
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="btn btn-primary  layer-date" type="button" value="搜索"
                                       onclick="LoadingDataListOrderRealItems()">
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" style="color: red" type="text" id="jmamount"
                                       disabled value="">
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" style="color: red" type="text" id="zyamount"
                                       disabled value="">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                    <sec:authorize access="hasRole('ROLE_STORES-OPTWALLET')">
                    <button class="btn btn-success glyphicon glyphicon-export" onclick="exportJmStoreWalletAmountExcel()">
                        导出门店值值宝流水信息
                    </button>
                    </sec:authorize>
                </div>
            </div>
            <div class="ibox-content">
                <table class="jmstore-walletinfo-table" id="jmstore-walletinfo-table" data-height="540"
                       data-mobile-responsive="true">

                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jmstore-walletinfo.js"></script>
</body>
</html>
