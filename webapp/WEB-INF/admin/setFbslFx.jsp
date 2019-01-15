<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>分箱</title>
    <jsp:include page="cssPage.jsp"></jsp:include>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
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
  </head>
  
  <body>
  <form id="formId" style=" width: 720PX; margin: auto auto; position: relative; top: 39px;">
  <span style="color:blue;">温馨提示：设置发布数量的时候库存也会相应改变..</span>
  <table class="table table-border">
  	<thead  class="text-c">
 		<tr>
 			<th>尺码</th>
			<th>颜色</th>
			<th>每份数量</th>
			<th>上次发布数量</th>
			<th>剩余数量</th>
			<th>下单比率</th>
			<th colspan=2>追加数量</th>
 		</tr>
	</thead>
	<tbody id="tbody"  class="text-c">

 	</tbody>
  </table>
  </form>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/setFbslFx.js"></script>
</body>
</html>
