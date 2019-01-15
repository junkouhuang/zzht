<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>浏览图片</title>
    <jsp:include page="cssPage.jsp"></jsp:include>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
  <span class="r" style="margin-right: 20px;">共有图片：<strong id="total"></strong> 张</span>
  <form class="form form-horizontal" id="form-article-add">
  	<div class="row cl">
  			<input id="batchcode" value="" type ="hidden"/>
			<div class="formControls col-xs-8 col-sm-9" id = "tbody">

			</div>
	</div>
  </form>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spbatch-image.js"></script>
</body>
</html>
