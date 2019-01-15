<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>上传图片</title>
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
  <form class="form form-horizontal" id="form-article-add">
  	<div class="row cl">
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-list-container"> 
					<div class="queueList">
						<div id="dndArea" class="placeholder">
							<div id="filePicker-2"></div>
							<p>或将照片拖到这里，单次最多可选300张</p>
						</div>
					</div>
					<div class="statusBar" style="display:none;">
						<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
						<div class="info"></div>
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn">开始上传</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row cl root">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="offWindows();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
  </form>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-fb-upload.js"></script>
<script type="text/javascript">
//移除上传失败的图片
function removeUploadFailImage(){
	$(".filelist").find("li[class=state-error]").each(function(){
		$(this).remove();
	});
	$(".info").empty();
}

</script>
</body>
</html>
