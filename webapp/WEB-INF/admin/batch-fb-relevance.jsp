<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
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
<title>新品发布列表</title>
<script type="text/javascript">
	var pageContext="${pageContext.request.contextPath}";
</script>
</head>

<body>
<div class="page-container">
	<div class="text-c">
<!-- 		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button> -->
	    日期范围：
		<input type="text"  onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="logmin" class="input-text Wdate" style="width:170px;">
		-
		<input type="text"  onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"id="logmax" class="input-text Wdate" style="width:170px;">
		<input type="text" name="fbcode" id="fbcode" placeholder=" 发布号" style="width:150px" class="input-text">
		<input type="text" name="fbname" id="fbname" placeholder=" 发布名称" style="width:150px" class="input-text">
		<button name="" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜发布号</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="r">共有数据：<strong id="total">54</strong> 条</span>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value="" ></th>
					<th width="150">发布号</th>
					<th>发布名称</th>
					<th width="200">发布时间</th>
					<th width="150">发布状态</th>
				</tr>
				</thead>
				<tbody  id="tbody">
				
				</tbody>
			</table>
	</div>
	<div class="mt-10" id="page1" style="float:right "></div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb-relevance.js"></script>
</body>
</html>