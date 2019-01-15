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
	<title>基础信息</title>
	<script type="text/javascript">
        var pageContext="${pageContext.request.contextPath}";
	</script>
</head>
<body>
<div class="">
	<form id="addFbForm" method="post">
		<table class="table  radius">
			<tbody>
			<tr class="">
				<input type="text" style="display:none" id="id">
				<td  style="text-align: center" class="text-r">产品名称</td><td  style="text-align: center"><input type="text" id="productname" name="productname" value="" class="input-text"></td>
				<td  style="text-align: center"class="text-r">产品描述</td><td  style="text-align: center"><input type="text" id="productdes" name="productdes" value="" class="input-text"></td>
				<td  style="text-align: center" class="text-r">产品属性</td>
				<td  style="text-align: center">
					<div id="productattr">
						<label><input name="productattr" type="radio" value="0" checked="checked"/>常规退换货商品</label>&nbsp;
						<label><input name="productattr" type="radio" value="1" />特殊不退不换产品</label>
					</div>
				</td>
			</tr>

			<tr class="">
				<td  style="text-align: center" class="text-r">品牌</td><td  style="text-align: center"><input type="text" id="brand" name="brand" value="" class="input-text"></td>
				<td  style="text-align: center" class="text-r">品牌介绍</td><td  style="text-align: center"><input type="text" id="branddes" name="branddes" value="" class="input-text"></td>
				<td class="pb-3">商品类别:</td>
				<td class="pb-3" onclick="selectSplb()">
					<input class="easyui-textbox" name="lbmc" disabled id="lbmc"data-options="iconCls:'icon-add',required:true,validType:'text',prompt:'选择类别,生成编码',width:154,missingMessage:'选择类别,生成编码'"  />
				</td>
			</tr>

			<tr class="">
				<td  style="text-align: center" class="text-r">材质</td><td><input type="text" id="cz" name="cz" value="" class="input-text"></td>
				<td  style="text-align: center" class="text-r">折扣</td>
				<td  style="text-align: center">
					<select id="rate">
						<option value=0.5>0.5</option>
						<option value=0.25>0.25</option>
						<option value=1>1</option>
					</select>
				</td>
				<td style="text-align: center" class="text-r">销售价</td><td style="text-align: center"><input type="text" id="sellprice" name="sellprice" value="" class="input-text"></td>
			</tr>
			<tr class="">
				<td style="text-align: center" class="text-r">批次类型</td>
				<td style="text-align: center">
					<select id="batchlx">
						<option selected="selected" value="0">新货</option>
						<option value="1">老货</option>
						<option value="2">订货</option>
					</select>
				</td>
				<td style="text-align: center" class="text-r">单位</td>
				<td style="text-align: center">
					<select id="dw"></select>
				</td>
				<td style="text-align: center" class="text-r">单位描述</td><td  style="text-align: center"><input type="text" id="dwdes" name="dwdes" value="" class="input-text"></td>
			</tr>
			<tr>
				<td style="text-align: center" class="text-r">发布类型</td>
				<td style="text-align: center">
					<select id="fblx">
						<option selected="selected" value="0">正常</option>
						<option value="1">订货会</option>
					</select>
				</td>
				<td style="text-align: center" class="text-r">会补货</td>
				<td style="text-align: center">
					<select id="replenish">
						<option  value="1">是</option>
						<option selected="selected" value="0">否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a id="mark" class="btn btn-primary radius" data-title="" onclick="save()" href="javascript:;" style="margin: 4px 0 0 450px"><i class="Hui-iconfont"></i>保存信息</a>
				</td>
			</tr>
			</tbody></table>
	</form>
</div>

<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-pc-info.js"></script>
</body>
</html>