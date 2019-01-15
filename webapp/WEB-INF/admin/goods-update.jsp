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
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<script type="text/javascript">
        var pageContext="${pageContext.request.contextPath}";
	</script>
	<title>修改商品</title>

</head>

<body>
<div class="">
	<div class="">
		<form id="addFbForm" method="post" >
			<table class="table  radius">
				<td id="id1"></td>
				<tr class="">

					<td  class="text-r">商品名称</td><td id="categoryname1"><input type="text" name="fbname" id="categoryname" placeholder=" 商品名称" class="input-text"></td><td></td>
				</tr>

				<tr class="">

					<td  class="text-r">商品标识</td><td id="categorycode1"><input type="text" name="fbname" id="categorycode" placeholder=" 商品标识" class="input-text"></td><td></td>
				</tr>

				<tr class="">

					<td  class="text-r">商品类别</td>

					<td>
						<select class="combobox form-control" name="parentid" id="parentid">
						</select>
					</td>
				</tr>

				<tr>
					<td colspan=6>
						<a class="btn btn-primary radius" data-title="确定修改" onclick="updateGoods()" href="javascript:;" style="margin: 4px 0;"><i class="Hui-iconfont">&#xe600;</i>确定修改</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods-update.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/js/goodslist.js"></script>

</body>
</html>