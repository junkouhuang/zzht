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
    <title>批次操作界面</title>
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
                    <span class="c-gray en">&gt;</span> 批次列表
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="selectForm">
                        <div class="row" >
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="batchcode" class="">批次号：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="batchcode" id="batchcode" type="text" placeholder="请输入批次号">
                            </div>
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="batchname" class="">批次名称：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="batchname" id="batchname" type="text" placeholder="请输入批次名称">
                            </div>
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="fbcode" class="">发布号：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="fbcode" id="fbcode" type="text" placeholder="请输入发布号">
                            </div>
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="groupcode" class="">定向组号：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="groupcode" id="groupcode" type="text" placeholder="请输入定向组号">
                            </div>
                        </div>
                        <br/>
                        <div class="row" >
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="groupname" class="">定向组名：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="groupname" id="groupname" type="text" placeholder="请输入定向组名">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="time">创建时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段" name="time" id="time">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="batchlx">发布类型：</label>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <select class="combobox form-control" name="fblx" id="fblx">
                                    <option value="">全部</option>
                                    <option value="0">正常</option>
                                    <option value="1">订货会</option>
                                </select>
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="batchlx">批次类型：</label>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <select class="combobox form-control" name="batchlx" id="batchlx">
                                    <option value="">全部</option>
                                    <option value="0">新货</option>
                                    <option value="1">老货</option>
                                    <option value="2">订货</option>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="ordertime">下单时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段" name="ordertime" id="ordertime">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="replenish">会补货：</label>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <select class="combobox form-control" name="replenish" id="replenish">
                                    <option value="">全部</option>
                                    <option value="true">是</option>
                                    <option value="false">否</option>
                                </select>
                            </div>
                            <div class="col-lg-1 col-md-1 ">
                                <input class="btn btn-primary  layer-date" type="button" value="搜索" onclick="LoadingDataListOrderRealItems()">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="btn-group hidden-xs" id="exampleTableEventsToolbar2" role="group">
                    <sec:authorize access="hasRole('ROLE_BATCHS_UPD')">
                        <button class="btn btn-danger glyphicon glyphicon-trash" onclick="deleteSpbatch()">删除批次</button>
                        <button class="btn btn-danger glyphicon glyphicon-remove-circle" onclick="clearFbRelevance()">移除发布号关联</button>
                        <button class="btn btn-danger glyphicon glyphicon-arrow-down" onclick="offSpbatch()">下架</button>
                        <button class="btn btn-success glyphicon glyphicon-arrow-up" onclick="upSpbatch()">上架</button>
                        <button class="btn btn-primary glyphicon glyphicon-fast-backward" onclick="openfront()">批次置前</button>
                        <button class="btn btn-primary glyphicon glyphicon-fast-forward" onclick="revokefront()">取消置前</button>
                        <button class="btn btn-danger glyphicon glyphicon-resize-horizontal" onclick="syncBatchCmInfo()">同步尺码信息</button>
                    </sec:authorize>
                    <button class="btn btn-primary glyphicon glyphicon-import" onclick="exportSpbatchOrderInfoToExcel()">导出明细</button>
                    <%--<button class="btn btn-danger glyphicon glyphicon-arrow-down" onclick="offSpbatchFinally()">永久下架</button>--%>
                </div>
                <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                    <sec:authorize access="hasRole('ROLE_BATCHS_UPD')">
                        <button class="btn btn-success glyphicon glyphicon-copy" onclick="importBatch()">导入批次</button>
                        <button class="btn btn-primary glyphicon glyphicon-pencil" onclick="baseInfo()">设置基础信息</button>
                        <button class="btn btn-primary glyphicon glyphicon-pencil" onclick="setFbsl()">设置发布数量</button>
                        <button class="btn btn-primary glyphicon glyphicon-arrow-up" onclick="upload()">上传图片</button>
                    </sec:authorize>
                    <button class="btn btn-primary glyphicon glyphicon-eye-open" onclick="browseImage()">浏览图片</button>
                    <sec:authorize access="hasRole('ROLE_BATCHS_UPD')">
                        <button class="btn btn-info glyphicon glyphicon-edit" onclick="batchStore()">定向门店组</button>
                        <button class="btn btn-info glyphicon glyphicon-edit" onclick="batchfb()">定向发布号</button>
                    </sec:authorize>
                </div>
            </div>
            <div class="ibox-content">
                <table class="batchTable" id="batchTable" data-height="540" data-mobile-responsive="true">

                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/batch-pc-list2.js"></script>
</body>
</html>
