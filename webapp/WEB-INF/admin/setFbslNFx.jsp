<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>不分箱</title>
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
   <form method="post" id="formId" style=" width: 619PX; margin: auto auto; position: relative; top: 39px;">
  <table class="table table-border">
  	<thead>
 		<tr>

 			<th>颜色</th>

 			<th>尺码</th>
 			<th>数量</th>

 		</tr>
	</thead>
	<tbody id="tbody">

 	</tbody>
  </table>
  <input type="button"  value="确定" class="btn btn-primary radius" onclick="setFbslNFxSub()"/>
  </form>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/setFbslNFx.js"></script>
</body>
</html>
