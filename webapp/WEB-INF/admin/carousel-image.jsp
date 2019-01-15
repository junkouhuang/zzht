<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>轮播图片展示</title>
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
  <div class="cl pd-5 bg-1 bk-gray mt-20">
  <div class="text-c">
      <button style="margin-top: 10px;" onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
      <a style="margin-left: 10px;margin-top: 10px;" class="btn btn-success radius" data-title="上传图片" onclick="upload('上传图片','admin/carousel-image-add.do','800','500')" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 上传图片</a>
      <span style="margin-right: 10px;margin-top: 10px;" class="r" style="margin-right: 20px;">共有图片：<strong id="total"></strong> 张</span>
  </div>
  <hr/>
  <br/>
  <form class="form form-horizontal" id="form-article-add">
  	<div class="row cl">
  			<input id="batchcode" value="" type ="hidden"/>
			<div class="formControls col-xs-8 col-sm-9" id = "tbody">
				
			</div>
	</div>
  </form>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/carousel-image.js"></script>
</body>
</html>