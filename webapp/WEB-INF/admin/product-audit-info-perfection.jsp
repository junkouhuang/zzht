<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/bootstrap-combobox/bootstrap-combobox.css"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/js/plugins/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/js/plugins/easyui/locale/easyui-lang-zh_CN.js">
    <link href="${pageContext.request.contextPath}/css/img/picchange.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <jsp:include page="bootstrap-cssPage.jsp"></jsp:include>
    <base target="_blank">
</head>
<body>
<div>
    <div style="margin: 2px 2px 0px 2px;height: 40%;float: left">
        <div class="input-group" style="padding-top: 5px">
            <div class="input-group-addon" style="width: 80px">产品名称</div>
            <input type="text" class="form-control" id="productname" name="productname" style="width: 180px"/>
            <div class="input-group-addon" style="width: 80px">产品描述</div>
            <input type="text" class="form-control" id="productdes" name="productdes" style="width: 300px"/>
            <div class="input-group-addon" style="width: 80px">产品属性</div>
            <div  style="width: 180px">
                <select class="form-control" name="productattr" id="productattr">
                    <option value="0">常规退换货商品</option>
                    <option value="1">特殊不退不换产品</option>
                </select>
            </div>
        </div>
        <div class="input-group" style="padding-top: 5px">
            <div class="input-group-addon" style="width: 80px">品牌</div>
            <input type="text" class="form-control" id="brand" name="brand" style="width: 180px"/>
            <div class="input-group-addon" style="width: 80px">品牌介绍</div>
            <input type="text" class="form-control" id="branddes" name="branddes" style="width: 300px"/>
            <div class="input-group-addon" style="width: 80px">商品类别</div>
            <input type="text" class="form-control" onclick="selectSplb();" id="lbmc" name="lbmc" readonly style="width: 180px"/>
        </div>
        <div class="input-group" style="padding-top: 5px">
            <div class="input-group-addon" style="width: 80px">材质</div>
            <input type="text" class="form-control" id="cz" name="cz" style="width: 180px"/>
            <div class="input-group-addon" style="width: 80px">折扣</div>
            <div  style="width: 300px">
                <select class="form-control" name="rate" id="rate">
                    <option value="0.5">0.5</option>
                    <option value="0.25">0.25</option>
                    <option value="1.0">1.0</option>
                </select>
            </div>
            <div class="input-group-addon" style="width: 80px">销售价</div>
            <input type="text" class="form-control" id="sellprice" name="sellprice" style="width: 180px"/>
        </div>
        <div class="input-group" style="padding-top: 5px">
            <div class="input-group-addon" style="width: 80px">批次类型</div>
            <div  style="width: 180px">
                <select class="form-control" name="batchlx" id="batchlx">
                    <option value="0">新货</option>
                    <option value="1">老货</option>
                    <option value="2">订货</option>
                </select>
            </div>
            <div class="input-group-addon" style="width: 80px">单位</div>
            <div  style="width: 300px">
                <select class="form-control" name="dw" id="dw"></select>
            </div>
            <div class="input-group-addon" style="width: 80px">单位描述</div>
            <input type="text" class="form-control" id="dwdes" name="dwdes" style="width: 180px"/>
        </div>
        <div class="input-group" style="padding-top: 5px">
            <div class="input-group-addon" style="width: 80px">发布类型</div>
            <div  style="width: 180px">
                <select class="form-control" name="fblx" id="fblx">
                    <option value="0">正常</option>
                    <option value="1">订货会</option>
                </select>
            </div>
            <div class="input-group-addon" style="width: 80px">会补货</div>
            <div  style="width: 300px">
                <select class="form-control" name="replenish" id="replenish">
                    <option value="false">否</option>
                    <option value="true">是</option>
                </select>
            </div>
        </div>
    </div>
    <div style="height: 40%;float: left;margin-left: 5px;margin-top: 10px;">
        <div class="input-group" style="padding-top: 2px;">
            <span style="color: blue">*温馨提示：请在审核备注中填写具体的注意事项</span>
        </div>
        <div class="input-group" style="padding-top: 2px;">
            <div class="input-group-addon" style="width: 80px">审核备注</div>
            <textarea id="auditmsg" name="auditmsg" class="form-control" cols="40" rows="3"></textarea>
        </div>
    </div>
</div>
</body>
<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-combobox/bootstrap-combobox.js"></script>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/product-audit-info-perfection.js"></script>
</html>