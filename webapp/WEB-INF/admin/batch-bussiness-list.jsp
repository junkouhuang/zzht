<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
<![endif]-->

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/common/css/base.css" />

<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增批次</title>
<link href="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	    日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="spcode" placeholder=" 商品款号" style="width:250px" class="input-text">
		<input type="text" name="" id="spmc" placeholder=" 商品名称" style="width:250px" class="input-text">
		<button name="" id="spsearch" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		    <a class="btn btn-primary radius" data-title=" 确定" data-href="article-add.html" id="batchpcadd" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 确定</a>
	        <a class="btn btn-primary radius" data-title="上传图片" onclick="upload('上传商品图片','spxx_image_upload','1000','660')" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 上传图片</a>
			<a class="btn btn-primary radius" data-title="浏览图片" onclick="browseImage('浏览图片','spxx-image','1000','660')" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 浏览图片</a>
		</span> 
		<span class="r">共有数据：<strong id="total">0</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead> 
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value="" ></th>
					<th width="120">商品款号</th>
					<th width="120">商品名称</th>
					<th width="200">创建时间</th>
					<th width="100">图片</th>
					<th width="150">类型</th>
					<th width="150">状态</th>
				</tr>
				</thead>
				<tbody  id="tbody">
				
				</tbody>
			</table>
	</div>
	<div class="mt-10" id="page1" style="float:right "></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /Ã¤Â½ÂÃ¤Â¸ÂºÃ¥ÂÂ¬Ã¥ÂÂ±Ã¦Â¨Â¡Ã§ÂÂÃ¥ÂÂÃ§Â¦Â»Ã¥ÂÂºÃ¥ÂÂ»-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/constant.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/js/base.js"></script>
<script type="text/javascript">

/*获取发布号数据*/
function demo(curr){  
    var pageSize = 10;  
    $.getJSON('${pageContext.request.contextPath}/spxxController/getSpxxListPaging', {
        page: curr || 1,  			//当前页
        pageSize: pageSize,			//当前页总记录数
		spcode: $("#spcode").val(),
       	spmc: $("#spmc").val(),
        dateRange_left: $("#logmin").val(),
        dateRange_right: $("#logmax").val()
    },  
    function (res){ 
          laypage({  
                cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div> 按钮容器
                pages: res.pages, //通过后台拿到的总页数  
                curr: curr || 1,  
                skip: true, //是否开启跳页  
                first: '首页', //若不显示，设置false即可  
                last: '尾页', //若不显示，设置false即可  
                prev: '<', //若不显示，设置false即可  
                next: '>', //若不显示，设置false即可  
                jump: function (obj,first) { //触发分页后的回调  
                     if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr  
                         demo(obj.curr);  
                     	}  
                	}  
            });  
             $('#tbody').html(PackagData(res));  //内容容器
              $("input[type=checkbox]").bind('click',function(){
			 	 $(this).attr('checked','checked').parent().parent().siblings().children().children("input").removeAttr('checked');
			 	 $(this).parent().parent().css('background-color','#f5f5f5').siblings().css('background-color','');
			});
			/*  $(".text-c").bind('click',function(){
			 //alert($(this).children().children(".mark").parent().parent().siblings('tr').html());
			 	 $(this).children().children(".mark").attr('checked','checked').parent().parent().siblings().children().children("input").removeAttr('checked');
			 	 $(this).children().children(".mark").css('background-color','#f5f5f5').siblings().css('background-color','');
			}); */
             $('#total').html(res.total);  
    	});  
}  


//内容
function PackagData(res){  
    	var content="";  
        for(var i=0;i<res.list.length;i++){  
        	content+="<tr class='text-c'>";  
            content+="<td><input type='checkbox' id=" +res.list[i].id+"  class='mark'></td>";
            content+="<td>"+res.list[i].spcode+"</td>";
            content+="<td>"+res.list[i].spmc+"</td>";
            content+="<td>"+res.list[i].createtime+"</td>";
            if(res.list[i].hasphoto > 0){
            	content+="<td class='td-status'><span class='label label-success radius' hasphoto="+res.list[i].hasphoto+">有图片</span></td>";
            }else{
            	content+="<td class='td-status'><span class='label label-success radius' hasphoto="+res.list[i].hasphoto+">没有图片</span></td>";
            }
            content+="<td>"+res.list[i].style+"</td>";
            content+="<td class='td-status'><span class='label label-success radius'>"+ Conversion(res.list[i].status,spxx_status) +"</span></td>";
            content+="</tr>";
        }  
        return content;  
}  


/*选择行变色并打钩*/
$(document).ready(function(){
    demo();
    $("#spsearch").click(function(){
    	demo();
    });
	 var tbg=$(".mark");
});


/*上传图片*/
function upload(title,url,w,h){
  	var obj = null;
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){					
			obj = $(this);						
		}
	})
	if(obj != null){
		layer_show(title,url,w,h);
	}else{
		layer.alert("请勾选商品后,再点击上传图片!");
	}
}


/*浏览图片*/
function browseImage(title,url,w,h){
	var obj = null;
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){					
			obj = $(this);						
		}
	})
	if(obj != null){
		var canBrowse = obj.parent().parent().children().children("span").attr("hasphoto");
		if(canBrowse == "true"){
			layer_show(title,url,w,h);
		}else{
			layer.alert("选中的没有图片，无法浏览！");
		}
	}else{
		layer.alert("请勾选后再点击浏览图片");
	}
}
</script>
</body>
</html>