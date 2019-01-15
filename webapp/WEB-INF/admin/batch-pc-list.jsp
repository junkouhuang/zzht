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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 批次列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="text-c">
	    日期范围：
		<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"id="minTime" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="maxTime" class="input-text Wdate" style="width:180px;">
		<input type="text" name="" id="batchcode" placeholder=" 批次编号" style="width:250px" class="input-text">
		<input type="text" name="" id="batchname" placeholder=" 批次名称" style="width:250px" class="input-text">
		<br/>
		<input type="text" name="" id="fbcode" placeholder=" 发布号" style="width:250px;margin-top: 5px;" class="input-text">
		<input type="text" name="" id="groupcode" placeholder=" 定向组号" style="width:250px;margin-top: 5px;" class="input-text">
		<input type="text" name="" id="groupname" placeholder=" 定向组名" style="width:250px;margin-top: 5px;" class="input-text">
		<div style="margin-top: 10px;">
		<select id="batchlx" style="width: 150px;height:29px;">
			<option value="">全部批次类型</option>
			<option value="0">新货</option>
			<option value="1">老货</option>
			<option value="2">订货</option>
		</select>
		</div>
		<button name="" style="margin-top: 5px;" id="batchsearch" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜批次</button>
		<a style="margin-top: 5px;" class="btn btn-danger glyphicon glyphicon-copy" href="batch-fb">->新品发布列表</a>
	</div>
<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<a href="javascript:;" onclick="deleteSpbatch()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a>
    		<a class="btn btn-warning radius" data-title="导入批次" onclick="importBatch()" href="javascript:;"><i class="Hui-iconfont">&#xe645;</i> 导入批次</a>
			<a class="btn btn btn-primary radius" data-title="基础信息" onclick="baseInfo('基础信息','batch-pc-info.do','1000','660')" href="javascript:;"><i class="Hui-iconfont">&#xe6df;</i> 基础信息</a>
    		<a class="btn btn-warning  radius" data-title="设置发布数量" onclick="setFbsl()"href="javascript:;"><i class="Hui-iconfont">&#xe6f1;</i> 设置发布数量</a>
	        <a class="btn btn-success radius" data-title="上传图片" onclick="upload('上传图片','batch-fb-upload.do','800','500')" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 上传图片</a>
	        <a class="btn btn-success radius" data-title="浏览图片" onclick="browseImage('浏览图片','spbatch-image','1000','660')" href="javascript:;"><i class="Hui-iconfont">&#xe695;</i> 浏览图片</a>
    		<a class="btn btn-primary radius" data-title="定向门店" onclick="batchStore('定向门店','batch-fb-storegroup.do','1000','620')"href="javascript:;"><i class="Hui-iconfont">&#xe6f1;</i> 定向门店</a>
    		<a class="btn btn-primary radius" data-title="关联发布号" onclick="batchfb('关联发布号','batch-fb-relevance.do','900','600')"href="javascript:;"><i class="Hui-iconfont">&#xe6f1;</i> 关联发布号</a>
		</span>
		<span class="1" style="margin-top: 2px;" >
			<a class="btn btn-danger radius" data-title="移除发布关联" onclick="clearFbRelevance()" href="javascript:;"><i class="Hui-iconfont">&#xe6de;</i> 移除发布号关联</a>
			<a class="btn btn-danger radius" data-title="下架" onclick="offSpbatch()" href="javascript:;"><i class="Hui-iconfont">&#xe6de;</i> 下架</a>
			<a class="btn btn-primary radius" data-title="上架" onclick="upSpbatch()" href="javascript:;"><i class="Hui-iconfont">&#xe6de;</i> 上架</a>
			<a class="btn btn-success  radius" data-title="批次置前" onclick="openfront()"href="javascript:;"><i class="Hui-iconfont">&#xe6a8;</i> 批次置前</a>
			<a class="btn btn-danger  radius" data-title="撤销置前" onclick="revokefront()"href="javascript:;"><i class="Hui-iconfont">&#xe66c;</i> 撤销置前</a>
			<a class="btn btn-danger  radius" data-title="撤销导入" onclick="revokeImportBatchInfo()"href="javascript:;"><i class="Hui-iconfont">&#xe66c;</i> 撤销导入</a>
			<a class="btn btn-warning radius" data-title="导入尺码" onclick="syncBatchCmInfo()" href="javascript:;"><i class="Hui-iconfont">&#xe645;</i> 导入尺码</a>
			<button class="btn btn-warning" onclick="exportSpbatchOrderInfoToExcel()">导出明细</button>
		</span>
		<span class="r">共有数据：<strong id="total">0</strong> 条</span>
	</div>

		<div class="mt-20">
		<input type="hidden" id="tradeId" value="${tradeId}"/>
		<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
				<tr class="text-c">
					<th width="25">
					<th width="120">批次号</th>
					<th>批次名称</th>
					<th width="80">剩余库存</th>
					<th width="80">销售数量</th>
					<th width="80">发布数量</th>
					<th width="150">定向组号</th>
					<th width="170">定向组名</th>
					<th width="150">发布号</th>
					<th width="100">图片</th>
					<th width="150">创建时间</th>
					<th width="150">置前时间</th>
					<th width="100">状态</th>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-pc-list.js"></script>
</body>
</html>