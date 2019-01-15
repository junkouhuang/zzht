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
<title>修改发布</title>
</head>

<body>
<div class="">
	<div class="">
		<form id="addFbForm" method="post" >
			<table class="table  radius">
			    <tr class="">
				    <td class="text-r">发布号</td><td  id="addcode" name="fbcode"></td><td></td>
				    <td  class="text-r">发布名称</td><td id="addfbname"><input type="text" name="fbname" id="fbname" placeholder=" 发布名称" class="input-text"></td><td></td>
			    </tr>
			    <tr class="">
				    <td  class="text-r">开始订货时间</td>
				    <td>
				    <input type="text" name="startdate"  onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="check1" class="input-text Wdate  check1"   disabled="disabled">
				    </td>
				    <td><input class="check1"  type="checkbox" onclick="isCheck(this)"></td>
				   <td  class="text-r">截止订货时间</td>
				   <td>
				   <input type="text" name="enddate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="check2"  class="input-text Wdate  check2"   disabled="disabled">
				   </td>
  				   <td>
				   <input class="check2"  type="checkbox" onclick="isCheck(this)">
  				   </td>
			   </tr>
			   <tr class="">
				   <td  class="text-r">预计发货时间</td>
				   <td>
				   <input type="text" name="deliverydate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="check3" class="input-text Wdate  check3" disabled="disabled">
				   </td>
				   <td>
				   <input class="check3"  type="checkbox" onclick="isCheck(this)">
				   </td>
				   <td  class="text-r">类型</td>
				   <td><select class="select select-box" id="fbtype" name="fbtype"><option value="1">新品</option><option value="2">预定</option><option value="4">生活用品</option></select></td>
				   <td id="addstatus"></td>
			   </tr>
			   <tr>
				   <td colspan=6>
				   	<a class="btn btn-primary radius" data-title="确定修改" onclick="updateBatchFb()" href="javascript:;" style="margin: 4px 0;"><i class="Hui-iconfont">&#xe600;</i>确定修改</a>
				   </td>
			   </tr>
            </table>
   		</form>
	</div>
	</div>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb-update.js"></script>
</body>
</html>