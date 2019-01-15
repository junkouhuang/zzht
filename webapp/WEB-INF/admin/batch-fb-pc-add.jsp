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
<title>新增批次</title>
<script type="text/javascript">
	var pageContext="${pageContext.request.contextPath}";
</script>
</head>
<body>
<div class="page-container">
<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	    日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 新品名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
	</div>
<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		    <a class="btn btn-primary radius" data-title=" 确定" data-href="article-add.html" id="batchpcadd" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 确定</a>
		</span> 
		<span class="r">共有数据：<strong id="total">0</strong> 条</span> 
	</div>

		<div class="mt-24">
			<div class="store">
				<ul class="text-c title-c ">
					<li style="width:60px;"><input type="checkbox" name="" value="" id="check-all"></li>
					<li>批次号</li>
					<li>批次名称</li>
					<li>创建时间</li>
					<li class="mold">状态</li>
				</ul >
			</div>
			<div id="tbody">
			
		</div>
	</div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb-pc-add.js"></script>
</body>
</html>