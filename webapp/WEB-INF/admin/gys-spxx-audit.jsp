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
    <title>供应商供货商品审核界面</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
    </script>
</head>
<body class="gray-bg">
<div class="">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 批次管理
                    <span class="c-gray en">&gt;</span> 审核列表
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="selectForm">
                        <div class="row">
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="batchcode" class="">批次号：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="batchcode" id="batchcode" type="text"
                                       placeholder="请输入批次号">
                            </div>
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="batchcode" class="">款号：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="spcode" id="spcode" type="text"
                                       placeholder="请输入款号">
                            </div>
                            <div class="col-lg-1  col-md-1  text-right pt-7">
                                <label for="spmc" class="">商品名称：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" name="spmc" id="spmc" type="text"
                                       placeholder="请输入商品名称">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="time">创建时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段" name="time"
                                       id="time">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="time">提交时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段"
                                       name="submittimeStr" id="submittimeStr">
                            </div>
                            <div class="col-lg-1 col-md-1  text-right pt-7">
                                <label for="time">审核时间：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control layer-date" type="text" placeholder="请选择时间段"
                                       name="audittimeStr" id="audittimeStr">
                            </div>
                            <div class="col-lg-1 col-md-1  col-sm-1 text-right">
                                <label class=" control-label " style=" padding-top: 8px;">价格段：</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <input class="form-control dsp" placeholder="最低价" name="minPrice" type="text" id="minPrice"> - <input
                                    class="form-control dsp" placeholder="最高价" type="text" name="maxPrice" id="maxPrice">
                            </div>
                            <label for="existsImage"
                                   class="col-lg-1 col-md-1 col-sm-1 col-xs-1 control-label">有图：</label>
                            <div class="col-lg-2 col-md-2  col-sm-2 col-xs-2">
                                <select class="form-control" name="existsImage" id="existsImage">
                                    <option value=""></option>
                                    <option value="true">有图</option>
                                    <option value="false">无图</option>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <label for="auditstatus"
                                   class="col-lg-1 col-md-1 col-sm-1 col-xs-1 control-label">审核状态：</label>
                            <div class="col-lg-2 col-md-2  col-sm-2 col-xs-2">
                                <select class="form-control" name="auditstatus" id="auditstatus">
                                    <option value=""></option>
                                    <option value="0">默认</option>
                                    <option value="1">已提交</option>
                                    <option value="5">审核通过</option>
                                    <option value="9">审核不通过</option>
                                </select>
                            </div>
                            <label for="gysid" class="col-lg-1 col-md-1 col-sm-1 col-xs-1 control-label">供应商：</label>
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="gysid"
                                        id="gysid">
                                </select>
                            </div>
                            <div class="col-lg-1 col-md-1 ">
                                <input class="btn btn-primary  layer-date" type="button" value="搜索"
                                       onclick="LoadingDataListOrderRealItems()">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="ibox-content">
                    <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                        <button class="btn btn-primary glyphicon glyphicon-eye-open" onclick="browseImage()">浏览图片</button>
                        <button class="btn btn-primary glyphicon glyphicon-wrench" onclick="auditProductInfo(0)" />价位审核
                        <button class="btn btn-success glyphicon glyphicon-wrench" onclick="auditProductInfo(1)" />资料审核
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <table class="gys-spxx-audit-table" id="gys-spxx-audit-table" data-height="540"
                       data-mobile-responsive="true">

                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/gys-spxx-audit.js"></script>
</body>
</html>
