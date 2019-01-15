<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <jsp:include page="cssPage.jsp"></jsp:include>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>商品列表</title>
    <script type="text/javascript">
        <%--var pageContext = "${request.contextPath}";--%>
        var pageContext="${pageContext.request.contextPath}";
    </script>
    <%
        String id = request.getParameter("id");
        session.setAttribute("id",id);
    %>

</head>
<%--
  Created by IntelliJ IDEA.
  User: wm
  Date: 2018/1/16
  Time: 10:58
  To change this template use File | Settings | File Templates.
  操作商品类别树状图
--%>
<body class="gray-bg">
<div class="">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品类别列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
                <div class="page-container">
                    <div class="text-c">
                        <button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
                        <input type="text" name="" id="categorycode" placeholder=" 商品编号" style="width:250px" class="input-text">
                        <input type="text" name="" id="categoryname" placeholder=" 商品名称" style="width:250px" class="input-text">
                        <button name="" id="goodsSearch" onclick="search()" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
                        <a class="btn btn-danger glyphicon glyphicon-copy" href="batch-fb">->商品类别列表</a>
                    </div>



                    <div class="ibox-content">
                    <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                        <span class="l">
		                    <a class="btn btn-primary radius" data-title="新增" onclick="goodsAdd('新增','goods-add','600','400')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增</a>
                            <a class="btn btn btn-primary radius" data-title="修改" onclick="goodsUpdate('修改','goods-update','800','300')" href="javascript:;"><i class="Hui-iconfont">&#xe6df;</i> 修改</a>
                            <a class="btn btn-primary radius" data-title="上传图片" onclick="imageUpload()" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 上传图片</a>
			                <a class="btn btn-primary radius" data-title="浏览图片" onclick="browseImage('浏览图片','goods_image_browse','800','500')" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 浏览图片</a>
                            <a class="btn btn btn-default radius" data-title="删除" onclick="delgoods()" href="javascript:;"><i class="Hui-iconfont">&#xe6de;</i> 删除</a>
                        </span>
                    </div>
                    <table id="dhtable" data-height="900" data-mobile-responsive="true">
                    </table>
                </div>
                <!-- End Example Events -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<jsp:include page="jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/js/goodslist.js"></script>
</body>
</html>
