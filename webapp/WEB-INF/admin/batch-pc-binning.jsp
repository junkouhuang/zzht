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
<title>商品分箱</title>
<script type="text/javascript">
var pageContext="${pageContext.request.contextPath}";
</script>

</head>
<body style="overflow:hidden;">
	<div class="cl pd-5 bg-1 bk-gray "  style="min-width:371px; height:519px;" id="trademark"> 
		 <span class="">
	        <a class="btn btn-success radius" data-title="增加" onclick="brand-add('增加','brand-add.do','1000','647')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 增加</a>
		</span>
		<span class="">
	        <a class="btn btn-danger radius" data-title="删除" onclick="brand-delete('删除','brand-delete.do','1000','647')" href="javascript:;"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a>
		</span>
		<span class="">
	        <a class="btn btn-primary  radius" data-title="确定" onclick="brand-confirm('确定','brand-confirm.do','1000','647')" href="javascript:;"><i class="Hui-iconfont">&#xe632;</i> 确定</a>
		</span>
		
		<div class="mt-10">
			<table  class=" table-border table-bordered table-striped table-hover text-c">
				<thead>
					<tr>
						<td>商品编码</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺码</td>
						<td>数量</td>
					</tr>
				</thead>
				<tbody class="binningContent" style="overflow-y:scroll;" id="binningContent">
					
				</tbody>
			</table>
		</div>
	</div>

<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-pc-binning.js"></script>
</body>
</html>