<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <title>批次交易情况</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
    </script>
</head>
<body>

<div class="page-container">
    <div class="text-c">
        日期范围：
        <input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"id="minTime" class="input-text Wdate" style="width:180px;">
        -
        <input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="maxTime" class="input-text Wdate" style="width:180px;">
        <button name="" id="batchSellsearch" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 检索列表</button>
        <button name="" id="export" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 导出</button>
    </div>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="r">共有数据：<strong id="total">0</strong> 条</span>
    </div>

    <div class="mt-20">
        <input id="fbid" type="hidden" value=""/>
        <table class="table table-border table-bordered table-bg table-hover table-sort" id="tb_batchfb">
            <thead>
            <tr class="text-c">
                <th width="95">批次号</th>
                <th>批次名称</th>
                <th width="120">发布时间</th>
                <th width="120">单价</th>
                <th width="120">折扣</th>
                <th width="95">库存数量</th>
                <th width="95">订单数量</th>
                <th width="120">发布数量</th>
                <th width="120">订单金额</th>
                <th width="120">下单比率</th>
                <th width="120">原价金额</th>
                <th width="120">图片</th>
            </tr>
            </thead>
            <tbody id="tbody">

            </tbody>
        </table>
    </div>
    <div class="mt-10" id="page1" style="float:right "></div>
</div>



<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        $("#export").click(function () {
            var minDate = $("#minTime").val();
            var maxDate = $("#maxTime").val();
            console.log("进入接口！");
            alert("导出！");
            window.location.href="/batchSell/queryBatchInfo?minDate="+minDate+"&maxDate="+maxDate;
        });
    });

    $(function () {
        demo();
        $("#batchSellsearch").click(function () {
            demo();
        });

    });
    function demo(curr){
        var minDate = $("#minTime").val();
        var maxDate = $("#maxTime").val();
        var pageSize = 10;
        $.getJSON(pageContext+'/batchSell/queryBatchInfoList', {
                page: curr || 1,  			//当前页
                pageSize: pageSize,			//当前页总记录数
                minDate:minDate,
                maxDate: maxDate
            },
            function (res){
            console.log(res);
                laypage({
                    cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div> 按钮容器
                    pages: res.navigatePages, //通过后台拿到的总页数
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
                $('#total').html(res.total);
            });
    }

    //内容
    function PackagData(res){
        var content="";
        var ip='http://119.23.48.31/';
        for(var i=0;i<res.list.length;i++){
            content+="<tr class='text-c'>";
            content+="<td>"+res.list[i].batchCode+"</td>";
            content+="<td>"+res.list[i].batchName+"</td>";
            content+="<td>"+res.list[i].startTime+"</td>";
            content+="<td>"+res.list[i].price+"</td>";
            content+="<td>"+res.list[i].rate+"</td>";
            content+="<td>"+res.list[i].stock+"</td>";
            content+="<td>"+res.list[i].ordersl+"</td>";
            content+="<td>"+res.list[i].fbsl+"</td>";
            content+="<td>"+res.list[i].orderAmount+"</td>";
            content+="<td>"+res.list[i].orderRate+"</td>";
            content+="<td>"+res.list[i].sellpriceAmount+"</td>";
            content+="<td><img style='width: 120px; height: 120px;' src="+ip+res.list[i].topimgpath+" /></td>";
            content+="</tr>";
        }
        return content;
    }


</script>
</body>
</html>


