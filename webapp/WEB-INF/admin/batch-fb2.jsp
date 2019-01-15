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
	<title>新品发布界面</title>
	<script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
	</script>
</head>
<body class="gray-bg">
<div class="">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox ">
				<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理
					<span class="c-gray en">&gt;</span> 新品发布列表
				</nav>
				<div class="ibox-title">
					<form class="form-horizontal m-t" id="selectForm">
						<div class="row" >
							<div class="col-lg-1  col-md-1  text-right pt-7">
								<label for="fbcode" class="">发布号：</label>
							</div>
							<div class="col-lg-2 col-md-2 ">
								<input class="form-control layer-date" name="fbcode" id="fbcode" type="text" placeholder="请输入发布号">
							</div>
							<div class="col-lg-1  col-md-1  text-right pt-7">
								<label for="fbname" class="">发布名称：</label>
							</div>
							<div class="col-lg-2 col-md-2 ">
								<input class="form-control layer-date" name="fbname" id="fbname" type="text" placeholder="请输入批次名称">
							</div>
							<div class="col-lg-1 col-md-1  text-right pt-7">
								<label for="time">发布时间：</label>
							</div>
							<div class="col-lg-2 col-md-2 ">
								<input class="form-control layer-date" type="text" placeholder="请选择时间段" name="time" id="time">
							</div>
							<div class="col-lg-2 col-md-3 ">
								<input class="btn btn-primary  layer-date" type="button" value="搜索" onclick="LoadingDataListOrderRealItems()">
							</div>
						</div>
					</form>
				</div>
				<div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
					<button class="btn btn-primary glyphicon glyphicon-plus" onclick="batchfbAdd()">新增</button>
					<button class="btn btn-primary glyphicon glyphicon-pencil" onclick="batchfbUpdate()">修改</button>
					<button class="btn btn-warning glyphicon glyphicon-check" onclick="batchfbConfirm()">确认</button>
					<button class="btn btn-success glyphicon glyphicon-leaf" onclick="batchfbUpdateStatus()">发布</button>
					<button class="btn btn-danger glyphicon glyphicon-download" onclick="offBatchFb()">下架</button>
				</div>
			</div>
			<div class="ibox-content">
				<table class="batchfbTable" id="batchfbTable" data-height="540" data-mobile-responsive="true">

				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/batch-fb2.js"></script>
</body>
</html>
