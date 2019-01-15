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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 新品发布列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	    日期范围：
		<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="logmin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"  id="logmax" class="input-text Wdate" style="width:180px;">
		<input type="text" name="fbcode" id="fbcode" placeholder=" 发布号" style="width:250px" class="input-text">
		<input type="text" name="fbname" id="fbname" placeholder=" 发布名称" style="width:250px" class="input-text">
		<button name="" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
		<a class="btn btn-danger glyphicon glyphicon-copy" href="batch-pc-list">->批次列表</a>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		    <a class="btn btn-primary radius" data-title="新增" onclick="batchfbAdd('新增','' +'batch-fb-add','600','400')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增</a>
			<a class="btn btn btn-primary radius" data-title="修改" onclick="batchfbUpdate('修改','batch-fb-update','800','300')" href="javascript:;"><i class="Hui-iconfont">&#xe6df;</i> 修改</a>
            <a class="btn btn-warning  radius" data-title="确认" onclick="batchfbConfirm(this)" href="javascript:;"><i class="Hui-iconfont">&#xe632;</i> 确认</a>
            <a class="btn btn-success  radius" data-title="发布" onclick="batchfbUpdateStatus(this)" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 发布</a>
			<a class="btn btn btn-danger radius" data-title="下架" onclick="offBatchFb()" href="javascript:;"><i class="Hui-iconfont">&#xe6de;</i> 下架</a>
		</span>
		<span class="r">共有数据：<strong id="total">54</strong> 条</span> 
	</div>
	<div class="mt-20">
		 <input type="hidden" id="tradeId" value="${tradeId}"/>
		<table class="table table-border table-bordered table-bg table-hover table-sort table" >
				<thead>
				<tr class="text-c">
					<th width="25"><!-- <input type="checkbox" name="" value="" > --></th>
					<th width="200">发布号</th>
					<th>发布名称</th>
					<th width="200">发布时间</th>
					<th width="130">发布状态</th>
				</tr>
				</thead>
				<tbody  id="tbody">
				
				</tbody>
			</table>
	</div>
	<div class="mt-10" id="page1" style="float:right "></div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb.js"></script>
</body>
</html>