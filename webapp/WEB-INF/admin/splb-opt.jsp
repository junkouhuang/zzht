<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>用户信息-新增</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugins/easyui/themes/icon.css">
    <jsp:include page="cssPage.jsp"></jsp:include>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
    </script>
</head>

<body class="gray-bg">
<div class="wrapper  animated fadeIn posit6">
    <div class="">
        <div class="tabs-container">
            <div class="tabs-left">
                <div class="tab-content " style="width: 200px;height: 325px;float: left;">
                    <div class="easyui-panel panel-body"  style="width: 400px;height: 325px;float: left;border-center: 1px solid #fff;">
                        <ul id="tt" class="easyui-tree"  data-options="
								url:' ${pageContext.request.contextPath}/goodsController/getSplbInfos',
								method:'post',
								animate:true
								"  style="width: 100%">
                        </ul>
                    </div>
                </div>
              <%--  <div  style="width: 405px;height: 325px;float: left;margin-left: 19px;border: 1px solid #ddd;">
                    <div style="width: 400px;height: 125px;float: left;">
                        <img id="lbimg" style="width: 400px;height: 250px;float: none;">
                        <a style="margin-left: 10px;margin-top: 5px;" class="btn btn-success radius" data-title="上传图片" onclick="upload('上传图片')" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 上传</a>
                        <button onClick="removeSplbImage();"  style="margin-left: 2px;margin-top: 5px;"  class="btn btn-danger radius" type="button"><i class="Hui-iconfont">&#xe6e2;</i> 移除</button>
                    </div>
                </div>
                <div id="mm" class="easyui-menu" style="width:120px;">
                    <div onclick="appendChildNode()" data-options="iconCls:'icon-add'">添加节点</div>
                    <div onclick="removeChildNode()" data-options="iconCls:'icon-remove'">删除节点</div>
                </div>--%>
            </div>
        </div>
        <div style="margin-top: 10px;margin-left: 10px;">
            <span id="lbid"></span>
        </div>
    </div>
</div>
<!-- 自定义js -->
<jsp:include page="jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/content.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js" ></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/js/plugins/easyui/jquery.easyui.min.js" ></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/js/plugins/easyui/jquery.tree.js" ></script>
<script src="${pageContext.request.contextPath}/js/splb-opt.js"></script>
</body>
</html>