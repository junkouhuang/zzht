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
                <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 门店管理
                    <span class="c-gray en">&gt;</span> 门店列表
                </nav>
                <div class="ibox-title">
                    <form class="form-horizontal m-t" id="storelistForm">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="mdlx" id="mdlx">
                                    <option value="" selected="selected">请选择门店类型</option>
                                    <option value="0">加盟店</option>
                                    <option value="3">直营店</option>
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="status" id="status">
                                    <option value="" selected="selected">请选择门店状态</option>
                                    <option value="0">未开业</option>
                                    <option value="1">营业中</option>
                                    <option value="4">已停业</option>
                                    <option value="9">已结业</option>
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="storeid" id="storeid">
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="reconok" id="reconok">
                                    <option value="" selected="selected">请选择支付状态</option>
                                    <option value="0">不可支付</option>
                                    <option value="1">正常</option>
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 ">
                                <input class="form-control " name="cwcode" id="cwcode" type="text" placeholder="财务编码">
                            </div>
                        </div>
                        <br/>
                        <div class="row" >
                            <div class="col-lg-2 col-md-2 ">
                                <select style="height: 30px;" class="combobox form-control" type="text" name="salelx" id="salelx">
                                    <option value="" selected="selected">请选择门店销售</option>
                                    <option value="0">正常</option>
                                    <option value="1">星级</option>
                                    <option value="2">五折</option>
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-3 ">
                                <input class="btn btn-primary  layer-date" type="button" value="搜索" onclick="LoadingDataListOrderRealItems()">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="ibox-content" style="clear:  both;margin-left: 20px;">
                    <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                        <sec:authorize access="hasRole('ROLE_STORES-OPTWALLET')">
                            <button class="btn btn-primary glyphicon glyphicon-plus-sign" onclick="addWalletInfo()">新增流水</button>
                        </sec:authorize>
                        <button class="btn btn-warning glyphicon glyphicon-eye-open" onclick="showWalletStremInfo()">查看值值宝流水</button>
                        <button class="btn btn-danger glyphicon glyphicon-eye-open" onclick="showPayinfoStremInfo()">查看支付流水</button>
                        <button class="btn btn-success glyphicon glyphicon-export" onclick="exportWalletBalance()">导出门店值值宝余额</button>
                        <sec:authorize access="hasRole('ROLE_STORES_OPTRECONOK')">
                            <button class="btn btn-info glyphicon glyphicon-off" onclick="optStoreReconokByStoreidList()">门店可支付开关</button>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_STORES-OPTWALLET')">
                            <button class="btn btn-primary glyphicon glyphicon-circle-arrow-up" onclick="importWalletBalance()">导入门店值值宝调整Excel</button>
                            <button class="btn btn-warning glyphicon glyphicon-edit" onclick="updateWalletPass()">修改值值宝密码</button>
                        </sec:authorize>
                    </div>
                    <table class="storestable" id="storestable" data-height="540" data-mobile-responsive="true">

                    </table>
                </div>
                <!-- 工具条-->
                <div class="detail-toolbar"></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/stores.js"></script>
</body>
</html>
