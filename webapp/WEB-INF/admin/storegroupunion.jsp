<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--_header 作为公共模版分离出去-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.css" />
	<!--请在下方写此页面业务相关的脚本-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/batch-fb-add.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/batch-fb-update.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/common/css/base.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/batch-fb-store.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/batch-fb-pc.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/batch-fb-pc-add.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/common/css/base.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order-spxx-add.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-add.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.login.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zqianWallet.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dredge.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/allocation.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fPye.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/recharge.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pay.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icheck.css" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
	<![endif]-->

	<!--[if IE 6]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>关联</title>
	<script type="text/javascript">
        var pageContext="${pageContext.request.contextPath}";
	</script>
	<style>
		.clearfix:after {
			content: '';

		}
	</style>
</head>
<body>
<form id="storeinfoForm">
<div class="page-container">
	<span class="l" style="display: block;width: 227px;">
		<a href="javascript:;" onclick="append()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe632;</i> 保存</a>
		<a href="javascript:;" onclick="remove()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe632;</i> 移除</a>
    </span>
	<br/>
	<div>
		<table class="table">
			<tr>
				<td class="text-right pr-10">省份筛选</td>
				<td style="width:100%; white-space: normal;">
					<div name="provinces" id="provinces" style="width: 100%; height: 200px;float:left;border: 4px solid #ddd;"  class="p10"></div>
				</td>
			</tr>
		</table>
	</div>
	<div style="width: 1000px;height: 42px;" id="resetchebox">
		<div style="float:left;width: 370px;">
			<input type="text" name="" id="leftmdcode" placeholder=" 门店号" style="width:100px;" class="input-text">
			<input type="text" name="" id="leftmdmc" placeholder=" 门店名称" style="width:100px" class="input-text">
			<input placeholder="请选择分组" id="lgroup" list="leftgroup" class="input-text" style="width:150px"/>
			<datalist id="leftgroup"></datalist>
			<input type="checkbox"  value="0" name="leftmdlx">加盟店</input>
			<input type="checkbox" style="margin-left:14px" value="3" name="leftmdlx">直营店</input>
			<input type="button" value="全选" id="leftAll" name="leftAll" class="btn btn-primary radius">
			<input type="button" value="反选" id="leftOther" name="leftOther" class="btn btn-primary radius">
			<button name="" id="leftsearchMD" class="btn btn-success" type="button"><i class="Hui-iconfont">&#xe665;</i> 搜门店</button>
		</div>

		<div style="float:right;width: 50%;">
			<div style="float: left;width: 370px;">
				<input type="text" name="" id="mdcode" placeholder=" 门店号" style="width:100px;" class="input-text">
				<input type="text" name="" id="mdmc" placeholder=" 门店名称" style="width:100px" class="input-text">
				<input placeholder="请选择分组" id="rgroup" list="rightgroup" class="input-text" style="width:150px"/>
				<datalist id="rightgroup"></datalist>
				<input type="checkbox"  value="0" name="mdlx">加盟店</input>
				<input type="checkbox" style="margin-left:14px" value="3" name="mdlx">直营店</input>
				<input type="button" value="全选" id="rightAll" name="rightAll" class="btn btn-primary radius">
				<input type="button" value="反选" id="rightOther" name="rightOther" class="btn btn-primary radius">
				<button name="" id="searchMD" class="btn btn-success" type="button"><i class="Hui-iconfont">&#xe665;</i> 搜门店</button>
			</div>
		</div>
	</div>
	<div>
		<div class="mt-21">
			<div class="">
				<div  class="store" >
					<ul class="left">
						<li class="checkbox"></li>
						<li>门店号</li>
						<li class="name">门店名称</li>
						<li>级别</li>
						<li class="mold">类型</li>
					</ul>
				</div>
				<div class="store"  id="store1">
				</div>
			</div>
		</div>
		<div class="mt-22">
			<button id="reset" type="reset" onclick="resets();" class="btn btn-primary radius r" style="line-height:1.6em;margin: 3px 0;" ><i class="Hui-iconfont">&#xe68f;</i></button>
			<a  class="btn btn-primary radius" onclick="join()" style="margin-left: 29px;margin-top: 10px;"><i class="Hui-iconfont">&#xe67d;</i></a>
		</div>
		<div class="mt-23">
			<div  class="store" >
				<ul class="right">
					<li class="checkbox"></li>
					<li>门店号</li>
					<li class="name">门店名称</li>
					<li>级别</li>
					<li  class="mold">类型</li>
				</ul>
			</div>
			<div id="tbody2">

			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="selectNumber"><span class="selectNumberleft"></span><span  class="selectNumberright"></span></div>
</div>
</form>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/storegroupunion.js"></script>
</body>
</html>