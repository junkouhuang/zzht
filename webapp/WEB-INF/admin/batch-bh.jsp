﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<jsp:include page="cssPage.jsp"></jsp:include>
<title>补货列表</title>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript">
  var pageContext="${pageContext.request.contextPath}";
</script>
</head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 补货列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	    日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="batchcode" id="batchcode" placeholder=" 批次号" style="width:250px" class="input-text">
		<input type="text" name="batchname" id="batchname" placeholder=" 批次名称" style="width:250px" class="input-text">
		<button name="" id="searchBatchList" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		   	<a class="btn btn-primary radius" data-title="补货定向" onclick="batchbh('补货定向','batch-bh-store.do','1000','660')"href="javascript:;"><i class="Hui-iconfont">&#xe6f1;</i> 补货定向</a>
		    <a class="btn btn-primary radius" data-title="发布" onclick="publish()" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 发布</a>
		</span> 
		<span class="r">共有数据：<strong id="total">54</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="120">批次号</th>
					<th>批次名称</th>
					<th width="200">创建时间</th>
					<th width="200">包装类型</th>
					<th width="150">批次发布状态</th>
				</tr>
				</thead>
				<tbody  id="tbody">
				
				</tbody>
			</table>
	</div>
	<div class="mt-10" id="page1" style="float:right "></div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-bh.js"></script>
</body>
</html>