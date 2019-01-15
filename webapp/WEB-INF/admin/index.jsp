﻿﻿<!DOCTYPE HTML>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />

	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
	<![endif]-->
	<!--[if IE 6]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>首页</title>
	<script type="text/javascript">
        var pageContext="${pageContext.request.contextPath}";
	</script>
</head>

<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">值值小程序后台管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">值值微信新品发布系统</a>

			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="article_add('添加资讯','article-add.html')"><i class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
							<li><a href="javascript:;" onclick="picture_add('添加资讯','picture-add.html')"><i class="Hui-iconfont">&#xe613;</i> 图片</a></li>
							<li><a href="javascript:;" onclick="product_add('添加资讯','product-add.html')"><i class="Hui-iconfont">&#xe620;</i> 产品</a></li>
							<li><a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')"><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>超级管理员</li>
					<li class="dropDown dropDown_hover">
						<a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
							<li><a href="#">切换账户</a></li>
							<li><a href="#">退出</a></li>
						</ul>
					</li>
					<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<sec:authorize access="hasAnyRole('ROLE_BATCCHFBS,ROLE_CAROUSES')">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 新品发布<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<sec:authorize access="hasRole('ROLE_BATCCHFBS')">
					<li><a data-href="${pageContext.request.contextPath}/admin/batch-fb2" data-title="发布列表" href="javascript:void(0)">发布列表</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_CAROUSES')">
					<li><a data-href="${pageContext.request.contextPath}/admin/carousel-image" data-title="轮播图片操作界面" href="javascript:void(0)">轮播图片操作界面</a></li>
					</sec:authorize>
				</ul>
			</dd>
		</dl>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_BATCHS')">
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 批次管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<sec:authorize access="hasRole('ROLE_BATCHS')">
					<li><a data-href="${pageContext.request.contextPath}/admin/batch-pc-list2" data-title="批次列表" href="javascript:void(0)">批次列表</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_BATCHSALES')">
					<li><a data-href="${pageContext.request.contextPath}/admin/batchSellExport" data-title="批次销售列表" href="javascript:void(0)">批次销售列表</a></li>
					</sec:authorize>
					<li><a data-href="${pageContext.request.contextPath}/admin/gys-spxx-audit" data-title="商品审核列表" href="javascript:void(0)">商品审核列表</a></li>
				</ul>
			</dd>
		</dl>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_STORES,ROLE_STOREGROUP')">
		<dl id="menu-store">
			<dt><i class="Hui-iconfont">&#xe620;</i> 门店管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<sec:authorize access="hasRole('ROLE_STORES')">
						<li><a data-href="${pageContext.request.contextPath}/admin/stores" data-title="门店列表" href="javascript:void(0)">门店列表</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_STOREGROUP')">
					<li><a data-href="${pageContext.request.contextPath}/admin/storelist" data-title="门店组列表" href="javascript:void(0)">门店组列表</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_STORES')">
						<li><a data-href="${pageContext.request.contextPath}/admin/jmstore-walletinfo" data-title="加盟店值值宝流动列表" href="javascript:void(0)">加盟店值值宝流动列表</a></li>
						<li><a data-href="${pageContext.request.contextPath}/admin/gys-gyswallet-list" data-title="供应商值值宝列表" href="javascript:void(0)">供应商值值宝列表</a></li>
						<li><a data-href="${pageContext.request.contextPath}/admin/gys-withdraw-list" data-title="供应商值值宝提现列表" href="javascript:void(0)">供应商值值宝提现列表</a></li>
					</sec:authorize>
				</ul>
			</dd>
		</dl>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_USERLIST')">
		<dl id="menu-user">
			<dt><i class="Hui-iconfont">&#xe620;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${pageContext.request.contextPath}/admin/userlist" data-title="用户列表" href="javascript:void(0)">用户列表</a></li>
				</ul>
			</dd>
		</dl>
		</sec:authorize>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome.jsp">我的桌面</span>
					<em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="contextMenu" id="Huiadminmenu">
			<ul>
				<li id="closethis">关闭当前 </li>
				<li id="closeall">关闭全部 </li>
			</ul>
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.html"></iframe>
		</div>
	</div>
</section>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    $(".menu").click(function(e){
	});
    /*个人信息*/
    function myselfinfo(){
        layer.open({
            type: 1,
            area: ['300px','200px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: '查看信息',
            content: '<div>管理员信息</div>'
        });
    }

    /*资讯-添加*/
    function article_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*产品-添加*/
    function product_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
	$(function(){
        function OnKeyClick()
        {
            if (event.keyCode == 13)
            {
                console.log("111111111111");
                /* __doPostBack("btnLogin","");*/
            }
        }
	})
</script>

<!--此乃百度统计代码，请自行删除-->
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<!--/此乃百度统计代码，请自行删除-->
</body>
</html>