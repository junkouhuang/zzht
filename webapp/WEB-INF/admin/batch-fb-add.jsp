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
<title>新增发布号</title>
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

<body>
	<div>
		<form id="addFbForm" method="post" >
			<table class="table table-border  radius">
			    <tr>
				    <td class="text-r" style="width: 84px;">发布号</td><td   class=""><input type="text" disabled class="input-text radius size-M" id="fbcode" name="fbcode"/></td><td></td>
				    <td  class="text-r"  style="width: 84px;">发布名称</td><td><input type="text" name="fbname" id="fbname" placeholder=" 发布名称" class="input-text radius size-M"></td><td></td>
			    </tr>
			    <tr>
				    <td  class="text-r" >开始订货时间</td>
				    <td>
				    	<input type="text" name="startdate"  onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="startdate" class="input-text radius size-M Wdate canCheck check1"   disabled="disabled">
				    </td>
				    <td>
						<i class=" ck_startdate "  onclick="isCheck(this)"></i>
					</td>
				   <td  class="text-r">截止订货时间</td>
				   <td>
				   		<input type="text" name="enddate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="enddate"  class="input-text radius size-M Wdate canCheck check2"   disabled="disabled">
				   </td>
  				   <td>
					   <i class=" ck_enddate"   onclick="isCheck(this)"></i>
  				   </td>
			   </tr>
			   <tr>
				   <td  class="text-r">预计发货时间</td>
				   <td>
				   		<input type="text" name="deliverydate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="deliverydate" class="input-text radius size-M Wdate canCheck check3" disabled="disabled">
				   </td>
				   <td>
					   <i class=" ck_deliverydate"   onclick="isCheck(this)"></i>
				   </td>
				   <td  class="text-r">类型</td>
				   <td>
					   <select class=" radius select select-box" id="fbtype" name="fbtype"><option value="1">新品</option><option value="2">预定</option><option value="4">生活用品</option></select>
				   </td>
				   <td>

				   </td>
			   </tr>
			   <tr>
				   <td colspan=6 style="text-align: center;">
				   	<a class="btn btn-primary radius" data-title="确定新增" onclick="submitFbForm()" href="javascript:;" style="margin: 4px 0;"><i class="Hui-iconfont">&#xe632;</i>确定新增</a>
				   </td>
			   </tr>
            </table>
   		</form>
	</div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb-add.js"></script>
</body>
</html>