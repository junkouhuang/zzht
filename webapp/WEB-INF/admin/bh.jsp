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
<script type="text/javascript">
	var pageContext="${pageContext.request.contextPath}";
</script>
<title>补货数量</title>
</head>

<body>
<div class="page-container">
	<div class="mt-20">
	<button class="btn btn-primary radius" style="margin-bottom:5px;" onclick="bhAllRelationBatch()">确定补货</button>
		<form id="addFbForm" method="get">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>
			    <tr  class="text-c">
			    <th>批次号</th>
			    <th>批次名称</th>
		        <th>图片</th>
			   <th>创建时间</th>
			   <th>状态</th>
			  </tr>
	   </thead>
	   <tbody id="tbody">
	   
	   </tbody>
       </table>
	</form>
	</div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bh.js"></script>
</body>
</html>