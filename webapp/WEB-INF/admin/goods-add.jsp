<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>新增商品</title>
<script type="text/javascript">
	var pageContext="${pageContext.request.contextPath}";
</script>
<style>
	.ck_startdate ,.ck_enddate,.ck_deliverydate{
		background: url("../../images/blue.png");
		width: 20px;
		height: 20px;
		background-position: 200px 0;
		display: block;
	}
	.can1,.can2,.can3 {
		background-position: 160px 0;
	}
</style>
</head>
<%--
  Created by IntelliJ IDEA.
  User: wm
  Date: 2018/1/16
  Time: 10:58
  To change this template use File | Settings | File Templates.
  增加商品
--%>
<body>
	<div>
		<form id="addFbForm" method="POST" >
			<table class="table table-border  radius">
				<tr>
				   <td  class="text-r">商品名称</td>
				   <td>
					   <input type="text" name="categoryname" id="categoryname" placeholder="商品名称" style="width:250px" class="input-text">
				   </td>
				</tr>
				<tr>
					<td  class="text-r">商品标识</td>
					<td>
						<input type="text" name="categorycode" id="categorycode" placeholder="商品标识" style="width:250px" class="input-text">
					</td>
				</tr>
				<tr>

						<td  class="text-r" >
							<label for="parentid" >商品父节点：</label>
						</td>
						<td>
							<select class="combobox form-control" name="parentid" id="parentid">
							</select>
						</td>

				</tr>
				<tr>
				   <td colspan=6 style="text-align: center;">
				   	<a class="btn btn-primary radius" data-title="确定新增" onclick="submitGoodsForm()" href="javascript:;" style="margin: 4px 0;"><i class="Hui-iconfont">&#xe632;</i>确定新增</a>
				   </td>
			   </tr>
            </table>
   		</form>
	</div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods-add.js"></script>
</body>
</html>