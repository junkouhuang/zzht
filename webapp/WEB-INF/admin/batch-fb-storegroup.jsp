<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<jsp:include page="cssPage.jsp"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
	<![endif]-->
	<!--[if IE 6]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>门店分组列表</title>
	<script type="text/javascript">
        var pageContext="${pageContext.request.contextPath}";
	</script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 门店管理 <span class="c-gray en">&gt;</span> 批次列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
		日期范围：
		<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"id="minTime" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="maxTime" class="input-text Wdate" style="width:180px;">
		<input type="text" name="" id="groupcode" placeholder=" 组号" style="width:250px" class="input-text">
		<input type="text" name="" id="groupname" placeholder=" 组名" style="width:250px" class="input-text">
		<button name="" id="storesearch" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="r">共有数据：<strong id="total">0</strong> 条</span>
	</div>

	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
			<tr class="text-c">
				<th width="25">
				<th width="120">组号</th>
				<th>组名</th>
				<th>描述</th>
				<th>创建人</th>
				<th>创建时间</th>
				<th>修改人</th>
				<th>最后一次修改时间</th>
			</tr>
			</thead>
			<tbody  id="tbody">

			</tbody>
		</table>
	</div>
	<div class="mt-10" id="page1" style="float:right "></div>

</div>

<div class="bgDiv"></div>

<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb-storegroup.js"></script>
</body>
</html>