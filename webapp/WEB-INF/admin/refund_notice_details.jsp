<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>退款通知详情</title>
    <!--手机响应式-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <style type="text/less">
        @width:100%;
        @height:100%;
        *,html,body {
            margin: 0;
            padding: 0;
            background-size: cover;
            font-size:12px;
            list-style: none;
           // overflow-y: hidden;
           // overflow-x: hidden;
            background: #ffffff;
        }
        .roll {
            overflow: hidden!important;
        }
        .wrapper {
            width: @width;
            height: @height;
            .ordercode {
                display: none;
            }
            .page1 {
                width: @width;
               // height: @height;
                .imgList {
                    overflow: hidden;
                    position: relative;
                    ul{
                        height:100%;
                        position: absolute;//至关重要，可做考点
                        background: rgba(0,0,0,0.7);
                        li{
                            width: @width;
                            height:@height;
                            background-size: cover;
                            background-repeat: no-repeat;
                            float: left;
                            figure {
                                width: @width;
                                height: @height;
                                background-position: center center;
                                background-size: cover;
                            }
                        }
                    }
                    img {
                        width: @width;
                        background-position: center center;
                        background-size: cover;
                    }
                    ol{
                        width: 40%;
                        height: 0.5rem;
                        margin-left: 30%;
                        text-align: center;
                        position: absolute;
                        bottom: 20px;
                        background: none;
                        li {
                            width: 1.5rem;
                            height: 0.5rem;
                            margin:0 0.1rem ;
                            background: #CCCCCC;
                            float: left;
                        }
                        .active {
                            background: #333333;
                        }
                    }
                }
                .detail {
                    width: @width;
                    .detailHtml1 {
                        width: 94%;
                        margin-left: 3%;
                        p{
                            line-height: 2rem;
                            font-size: 1.2rem;
                            font-weight: bold;
                        }
                        .productName{
                            font-size: 1.3rem;
                        }
                        .sellPrice{
                            font-size: 1.3rem;
                            color: red;
                            span {
                                font-size: 1rem;
                            }
                        }
                        .productAttr{
                            color: #f79a47;
                        }
                    }
                    .detailHtml2 {
                        width: 94%;
                        margin-left: 3%;
                        .brand{
                            font-size: 1.2rem;
                        }
                        .branddes{
                            font-size: 1.2rem;
                        }
                        .cz{
                            font-size: 1.2rem;
                        }
                    }
                }
            }
            .page2 {
                width: @width;
                height: @height;
                .ordersDetailList {
                    width: 94%;
                    margin-left: 3%;
                    padding-top: 2rem;
                    padding-bottom: 2rem;
                    .ordercode1 {
                        text-align: left;
                        margin: 0;
                        color: #f79a47;
                        font-weight: bold;
                        font-size: 1.2rem;
                    }
                    .title1 {
                        width:100%;
                        height: 2rem;
                        line-height:2rem;
                        text-align: center;
                        position:relative;
                        span {
                            z-index:2;
                            position: relative;
                            background-color:#ffffff;
                            padding:0.2rem 2rem;
                            color: #65c0bb;
                            font-weight: bold;
                        }
                    }
                    .title1:after{
                        content:"";
                        width:100%;
                        height:1px;
                        background-color:#65c0bb;
                        position:absolute;
                        bottom:50%;
                        z-index:1;
                        left:0;
                    }
                    ul {
                        border-radius: 10px;
                        li {
                              height: 2rem;
                              line-height: 2rem;
                              border-bottom: 1px dashed #ccc;
                              span {
                                  width: 20%;
                                  height: @height;
                                  display: inline-block;
                                  text-align: center;
                                  background: #65c0bb;
                                  color: #ffff;
                                  float: left;
                              }
                          }
                        li:nth-child(1){
                            font-weight: bold;
                        }
                    }
                    p{
                        text-align: right;
                        padding-top: 0.6rem;
                        width: 94%;
                        margin-left: 3%;
                        color: #65c0bb;
                        font-weight: bold;
                    }
                }
                .wxOrderPickingList {
                    width: 94%;
                    margin-left: 3%;
                    padding-bottom: 2rem;
                    .title2 {
                        width:100%;
                        height: 2rem;
                        line-height:2rem;
                        text-align: center;
                        position:relative;
                        span {
                            z-index:2;
                            position: relative;
                            background-color:#ffffff;
                            padding:0.2rem 2rem;
                            color:#f79a47;
                            font-weight: bold;
                        }
                    }
                    div:nth-child(2){
                        text-align: center;
                        color: #f79a47;
                    }
                    .title2:after{
                        content:"";
                        width:100%;
                        height:1px;
                        background-color:#f79a47;
                        position:absolute;
                        bottom:50%;
                        z-index:1;
                        left:0;
                    }
                    .top {
                        p{
                            border-left: 2px solid #cccccc;
                            padding-bottom: 0.5rem;
                        }
                    }
                    ul {
                        border-radius: 10px;
                        li {
                            height: 2rem;
                            line-height: 2rem;
                            border-bottom: 1px dashed #ccc;
                            span {
                                width: 18%;
                                height: @height;
                                display: inline-block;
                                text-align: center;
                                background:#f79a47;
                                color: #ffffff;
                                float:left;
                            }
                            .mxcode {
                                width:28%;
                            }
                        }
                        li:nth-child(1){
                            font-weight: bold;
                        }
                    }
                    p{
                        text-align: right;
                        padding-top: 0.6rem;
                        color: #f79a47;
                        font-weight: bold;
                        width: 94%;
                        margin-left: 3%;
                    }
                }
            }
        }
        .cmcode, .amount, .sellprice ,.amount ,.mxcode {
            color: #ffffff!important;
        }
        .cm ,.sl,.price,.amount,.mfsl{
            color: #ffffff!important;;
        }
        .zoom {
            width: @width;
            height: @height;
            position: absolute;
            background: #333333;
            display: none;
            top: 0;
            bottom: 0;
            z-index: 3;
            section {
                width: @width;
                height: @height;
                position: relative;
                overflow: hidden;
                ul {
                    height: 100%;
                    position: absolute;
                    z-index: 2;
                    li {
                        height: 100%;
                        background-size: cover;
                        background-repeat: no-repeat;
                        float: left;
                        figure {
                            width: 100%;
                            height: 100%;
                            background-size: contain!important;
                            background-repeat: no-repeat;
                            background-position-x: center;
                            background-position-y: center;
                        }
                    }
                }
            }
        }
        .empty {
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!--less样式框架-->
   <%-- <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/css/refund_notice_details.less">--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/less.js"></script>
    <!--外联样式文件-->
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/refund_notice_details.js"></script>--%>
    <!--微信公众平台图片模块-->
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript"></script>
    <!--申明全局路径-->
    <script type="text/javascript">
        var pageUrl="${pageContext.request.contextPath}";
    </script>
</head>
<body>
    <div class="wrapper" id="wrapper">
        <section class="page1" id="page1">
           <!--图片-->
           <%-- <section class="imgList" id="imgList"></section>--%>
            <div class="imgList" id="imgList">

                <c:forEach items="${pageModel.obj.spbatchBasic.spbatchImageList}" var="spbatchImageList">
                 <img class="img-thumbnail"  src="http://image.zhizhi360.com/${spbatchImageList.url}" />
                    <%--  <li><figure  style='background-image:url(http://image.zhizhi360.com/${spbatchImageList});'></figure></li>--%>
                </c:forEach>

            </div>
            <!--详情-->
            <section class="detail" id="detail">
                <section class='detailHtml1'>
                    <p class=productName>${pageModel.obj.spbatchBasic.productname}</p>
                    <p class=productAttr>${pageModel.obj.spbatchBasic.productattr==0?'常规退换货商品':'特殊不退不换商品'}</p>
                    <p class=sellPrice1><span>￥</span>${pageModel.obj.spbatchBasic.sellprice}</p>
                    <p class=batchCode>${pageModel.obj.batchcode}</p>
                    <p class=dw>${pageModel.obj.spbatchBasic.dw}</p>
                </section>
                <section class=detailHtml2>
                    <p class=brand>${pageModel.obj.spbatchBasic.brand}</p>
                    <p class=branddes>${pageModel.obj.spbatchBasic.branddes}</p>
                    <p class=cz>${pageModel.obj.spbatchBasic.cz}</p>
                </section>
            </section>
        </section>
        <section class="page2" id="page2">
            <!--订单-->
            <section class="ordersDetailList" id="ordersDetailList">
                <div class="ordercode1">订单号：${ordercode}</div>
                <div class='title1'><span>下单信息</span></div>
                <ul>
                <li>
                    <span class=cm>尺码</span>
                    <span class=sl>份数</span>
                    <span class=price>折后价</span>
                    <span class='amount'>金额</span>
                    <span class='amount'>每份数量</span>
                </li>
                <c:set value="0" var="xiaoji1" />
                <c:set value="0" var="zongshu1" />

                <c:forEach items="${pageModel.obj.ordersDetailList}" var="ordersDetailList">
                    <li>
                        <span class=cm>${ordersDetailList.cm}</span>
                        <span class=sl>${ordersDetailList.sl}</span>
                        <span class=price>￥${ordersDetailList.price}</span>
                        <span class=amount>${ordersDetailList.amount}</span>
                        <span class=mfsl>${ordersDetailList.mfsl}</span>
                    </li>
                    <c:set value="${xiaoji1+ordersDetailList.amount}" var="xiaoji1" />
                    <c:set value="${zongshu1+ordersDetailList.mfsl*ordersDetailList.sl}" var="zongshu1" />
                </c:forEach>
                </ul>
                <p>小计：￥${xiaoji1}</p>
                <p>总件数：${zongshu1}</p>
            </section>
            <!--拣货单-->
            <section class="wxOrderPickingList" id="wxOrderPickingList">
                <ul>
                    <c:if test="${not empty pageModel.obj.wxOrderPickingList}">
                        <div class='title2'><span>拣货单信息</span></div>
                        <li>
                            <span class=cmcode>尺码</span>
                            <span class='jhsl'>数量</span>
                            <span class=sellprice>折后价</span>
                            <span class='amount'>金额</span>
                            <span  class='mxcode'>条码</span>
                        </li>
                        <c:set value="0" var="xiaoji2" />
                        <c:set value="0" var="zongshu2" />
                        <c:forEach items="${pageModel.obj.wxOrderPickingList}" var="wxOrderPickingList">
                            <li>
                                <span class=cmcode>${wxOrderPickingList.cmcode}</span>
                                <span class=jhsl>${wxOrderPickingList.jhsl}</span>
                                <span class='sellprice'>￥${wxOrderPickingList.sellprice}</span>
                                <span class=amount>${wxOrderPickingList.amount}</span>
                                <span class=mxcode>${wxOrderPickingList.mxcode}</span>
                                <c:set value="${xiaoji2+wxOrderPickingList.amount}" var="xiaoji2" />
                                <c:set value="${zongshu2+wxOrderPickingList.jhsl}" var="zongshu2" />
                            </li>
                        </c:forEach>
                        </ul>
                <p>小计：￥${xiaoji2}</p>
                <p>总件数：${zongshu2}</p>
                    </c:if>
                    <c:if test="${empty pageModel.obj.wxOrderPickingList}">
                        <div class='title2'><span>拣货信息</span></div><div  class="empty">暂无拣货信息</div>
                    </c:if>
            </section>
        </section>
    </div>
    <div class="zoom" id="zoom" onclick="zoomCloseFun()">
        <!--图片缩放-->
        <section></section>
    </div>
</body>
<script type="text/javascript">
    var _screenWidth,_screenHeight;//存放屏幕宽高
    var imageLen;//接收图片的数组
    var timer;//定时器
    $(function(){
        initFun();
    });
    //函数: 初始化界面
    function initFun(){
        //获取当前屏幕分辨率的宽度
        _screenWidth=window.screen.width;
        //将显示图片区域的高度设置为屏幕分辨率的宽度
        _screenHeight=_screenWidth;
        //图片区域html渲染
        $("#imgList").width(_screenWidth).height(_screenHeight);
        //$("#page1,#page2").height(window.screen.height);
    }
</script>
<script>
    wx.config({
        debug: false,
        appId: 'wx80c7b10734dab199',
        timestamp:'${wcc.timestamp}' ,  //必填，时间戳
        nonceStr: '${wcc.nonceStr}', //必填，生成签名的随机串
        signature: '${wcc.signature}', // 必填，签名，见附录1
        jsApiList: ['previewImage']   // 必填，需要使用的JS接口列表
    });
    wx.ready(function(){
        var srcList = [];
        $.each($('img'),function(i,item){
            if(item.src){
                srcList.push(item.src);
                $(item).click(function(e){
                    wx.previewImage({
                        current: this.src, // 当前显示图片的http链接
                        urls: srcList
                    });
                });
            }
        });
    });
</script>
<%--<script type="text/javascript">
    var _screenWidth,_screenHeight;//存放屏幕宽高
    var imageLen;//接收图片的数组
    var timer;//定时器
    var ordercode;//货号
    $(function(){
        //货号
        ordercode=$("#ordercode").val();
        initFun();
        getOrdersPageInfoFun();
    });
    //函数: 初始化界面
    function initFun(){
        //获取当前屏幕分辨率的宽度
        _screenWidth=window.screen.width;
        //将显示图片区域的高度设置为屏幕分辨率的宽度
        _screenHeight=_screenWidth;
        //图片区域html渲染
        $("#imgList").width(_screenWidth).height(_screenHeight);
        //$("#page1,#page2").height(window.screen.height);
    }
    //函数：退款通知详情
    function getOrdersPageInfoFun(){
        $.ajax({
            url:pageUrl+"/wx/toRefundView/467358352200957952",
            // url:"http://zzadmin.zhizhi360.com/wx/getOrdersPageInfo/",467358352200957952
            method:"POST",
            dataType: "json",
            async: false,
            cache: false,
            crossDomain: true,
            success:function(data){
                if(data.success){
                  //  imgHtmlFun(data);
                    detailHtmlFun(data);
                    ordersDetailListFun(data);

                    if(data.obj.wxOrderPickingList!=null){
                        wxOrderPickingListFun(data);
                    }else{
                        $("#wxOrderPickingList").append("<div class='title2'><span>拣货信息</span></div><div>暂无拣货信息</div>");
                    }
                }else{
                    alert(data.msg);
                }
            }
        })
    }
    //图片区域的html封装
    function imgHtmlFun(data){
        imageLen=data.obj.spbatchBasic.spbatchImageList;
        //li比实际多出一个，图片滚动过度时使用
        var imgHtml="<ul>";
        for(var j=0;j< imageLen.length+1;j++){
            //过度图片选择第一张
            imgHtml+="<li onclick='zoomOpenFun()'><figure  style='background-image:url(http://image.zhizhi360.com/"+imageLen[0].url+");'></figure></li>";
        }
        imgHtml+="</u>";
        $("#imgList").append(imgHtml);
        //图片路径更改为自己的路径
        for(var i in imageLen){
            $("#imgList ul li figure").eq(i).css("background-image","url(http://image.zhizhi360.com/"+imageLen[i].url+")");
        }
        //点击圆形
        var dotList="<ol class='dotList'>"
        for(var k=0;k< imageLen.length;k++){
            dotList+="<li><span></span></li>";
        }
        dotList+="</ol>";
        //设置图片列表长度
        $("#imgList ul").width((imageLen.length+1)*_screenWidth);
        $("#imgList ul li").width(_screenWidth);
        //添加圆形
        $("#imgList").append(dotList);
        //将第一个圆形设置为活跃状态
        $("#imgList ol li ").eq(0).addClass("active");
        timer=setInterval(imgSlideToLeftFun,2000); //开启定时器
    }
    //函数：详情区域html封装
    function detailHtmlFun(res){
        $("#detail").append(detailHtml1);
        var detailHtml1 = "<section class='detailHtml1'>" +
            "<p class=productName>"+res.obj.spbatchBasic.productname+"</p>"+ //商品名
            "<p class=productAttr>"+(res.obj.spbatchBasic.productattr==0?'常规退换货商品':'特殊不退不换商品')+"</p>"+ //属性
            "<p class=sellPrice><span>￥</span>"+res.obj.spbatchBasic.sellprice+"</p>"+ //售价
            "<p class=batchCode>"+res.obj.batchcode+"</p>"+ //批次号
            "<p class=dw>"+(res.obj.spbatchBasic.dw==null?'':res.obj.spbatchBasic.dw)+"</p>"+ //单位
            "</section>";
        var detailHtml2 = "<div class=detailHtml2>" +
            "<p class=brand>"+res.obj.spbatchBasic.brand+"</p>"+ //品牌
            "<p class=branddes>"+res.obj.spbatchBasic.branddes+"</p>"+ //描述
            "<p class=cz>"+res.obj.spbatchBasic.cz+"</p>"+ //材质
            "</div>";
        $("#detail").append(detailHtml1);
        $("#detail").append(detailHtml2);
    }
    //函数：开始轮播
    var n=0;//下标0开始
    function  imgSlideToLeftFun(){
        n++;//开启定时器后从第二张图片开始轮播
        if(n>imageLen.length){
            //轮播图为最后一张，拉回第二张
            $("#imgList ul").css({left:0}).stop().animate({left:-_screenWidth},1000);
            n=1;
        }else{
            $("#imgList ul").stop().animate({left:-n*_screenWidth},1000);
        }
        //每执行一次定时器先将所有圆形设为非活跃状态
        $("#imgList ol li ").removeClass("active");
        //获取图片下标，将对应的圆形设置为活动状态
        if(n<imageLen.length){
            $("#imgList ol li ").eq(n).addClass("active");
        }else{
            $("#imgList ol li ").eq(0).addClass("active");
        }
    }
    //函数：订单
    function  ordersDetailListFun(o){
        var subtotal=0;
        var quantitytotal =0;
        var ordersDetailListLen=o.obj.ordersDetailList;
        var ordersDetailListHtml="<div class='title1'><span>订单"+ordercode+"下单信息</span></div>";
        ordersDetailListHtml+="<ul>";
        ordersDetailListHtml+="<li><span class=cm>尺码</span><span class=sl>数量</span><span class=price>折后价</span><span class='amount'>金额</span><span class='amount'>每份数量</span></li>";
        for(var z=0;z< ordersDetailListLen.length;z++){
            quantitytotal=quantitytotal+ordersDetailListLen[z].sl;
            subtotal=subtotal+ordersDetailListLen[z].amount;
            ordersDetailListHtml+="<li><span class=cm>"+ordersDetailListLen[z].cm+"</span><span class=sl>"+ordersDetailListLen[z].sl+"</span><span class=price>￥"+ordersDetailListLen[z].price+"</span><span class=amount>"+ordersDetailListLen[z].amount+"</span><span class=mfsl>"+ordersDetailListLen[z].mfsl+"</span></li>";
        }
        ordersDetailListHtml+="</ul>";
        ordersDetailListHtml+="<p>小计：￥"+subtotal+"</p>";
        ordersDetailListHtml+="<p>总数量："+quantitytotal+"</p>";
        $("#ordersDetailList").append(ordersDetailListHtml);
    }
    //函数：拣货单
    function  wxOrderPickingListFun(o){
        var subtotal=0;
        var quantitytotal=0;
        var wxOrderPickingListLen=o.obj.wxOrderPickingList;
        var wxOrderPickingListHtml="<div class='title2'><span>拣货信息</span></div>"
        wxOrderPickingListHtml+="<section class='top'>"
        /* wxOrderPickingListHtml+="<p class='spmc'>商品名"+wxOrderPickingListLen[0].spmc+"</p>";
         wxOrderPickingListHtml+="<p class='spcode'>编号"+wxOrderPickingListLen[0].spcode+"</p>";*/
        wxOrderPickingListHtml+="</section>";
        wxOrderPickingListHtml+="<ul>"
        wxOrderPickingListHtml+="<li><span class=cmcode>尺码</span><span class='amount'>数量</span><span class=sellprice>折后价</span><span class='amount'>金额</span><span  class='mxcode'>条码</span></li>"
        for(var g=0;g< wxOrderPickingListLen.length;g++){
            quantitytotal=quantitytotal+wxOrderPickingListLen[g].jhsl
            subtotal=subtotal+wxOrderPickingListLen[g].amount
            wxOrderPickingListHtml+="<li><span class=cmcode>"+wxOrderPickingListLen[g].cmcode+"</span><span class=jhsl>"+wxOrderPickingListLen[g].jhsl+"</span><span class='sellprice'>￥"+wxOrderPickingListLen[0].sellprice+"</span><span class=amount>"+wxOrderPickingListLen[g].amount+"</span><span class=mxcode>"+wxOrderPickingListLen[g].mxcode+"</span></li>";
        }
        wxOrderPickingListHtml+="</ul>";
        wxOrderPickingListHtml+="<p>小计：￥"+subtotal+"</p>";
        wxOrderPickingListHtml+="<p>总数量："+quantitytotal+"</p>";
        $("#wxOrderPickingList").append(wxOrderPickingListHtml);
    }
    //函数：上下滑动翻页
    var page=1;
    function rollPageFun(g){
        var window_height=window.screen.height;
        //设置若干页面的总高度
        var reallyScreenHeight=$("#wrapper>section").length*window_height;
        $("#wrapper").height(reallyScreenHeight);
        if(g==-1){ //向下手势
            page--;
            if(page>0){
                $("#wrapper").css("transform","translateY("+(-(page-1)*window_height)+"px)");
            }else{
                console.log("当前是第一页，无法向下滚动");
                page=1;
            }
        }
        if(g==1){ //向上手势
            page++;
            if(page<=$("#wrapper>section").length){
                $("#wrapper").css("transform","translateY("+(-(page-1)*window_height)+"px)");
            }else{
                page=$("#wrapper>section").length;
                console.log("当前是最后一页，无法向下滚动");
            }
        }
    }
    var startx, starty;
    //获得角度
    function getAngle(angx, angy) {
        return Math.atan2(angy, angx) * 180 / Math.PI;
    };

    //根据起点终点返回方向 1向上 2向下 3向左 4向右 0未滑动
    function getDirection(startx, starty, endx, endy) {
        var angx = endx - startx;
        var angy = endy - starty;
        var result = 0;
        //如果滑动距离太短
        if (Math.abs(angx) < 2 && Math.abs(angy) < 2) {
            return result;
        }
        var angle = getAngle(angx, angy);
        if (angle >= -135 && angle <= -45) {
            result = 1;
        } else if (angle > 45 && angle < 135) {
            result = 2;
        } else if ((angle >= 135 && angle <= 180) || (angle >= -180 && angle < -135)) {
            result = 3;
        } else if (angle >= -45 && angle <= 45) {
            result = 4;
        }
        return result;
    }
    //手指接触屏幕
    document.addEventListener("touchstart", function(e) {
        startx = e.touches[0].pageX;
        starty = e.touches[0].pageY;
    }, false);
    //手指离开屏幕
    document.addEventListener("touchend", function(e) {
        var endx, endy;
        endx = e.changedTouches[0].pageX;
        endy = e.changedTouches[0].pageY;
        var direction = getDirection(startx, starty, endx, endy);
        switch (direction) {
            case 0:
                //"未滑动！;
                break;
            case 1:
                //向上！
              //  rollPageFun(1);
                break;
            case 2:
                //向下！
             //   rollPageFun(-1);
                break;
            case 3:
                //向左！
                slideLeftFun(-1);
                break;
            case 4:
                //向右!
                slideLeftFun(1);
                break;
            default:
        }
    }, false);
    //函数：图片缩放器开启
    var flag
    function zoomOpenFun(){
        //开启图片缩放器之前先清除定时器
        clearInterval(timer);
        //开启图片缩放器
        $("#zoom").fadeIn();
        //添加构造HTML先清空
        $("#zoom section").html("");
        //第三方变量又来接收下标
        flag=n;
        //将来图片列表插入图片缩放器
        $("#zoom section").append("<ul>"+$("#imgList ul").html()+"</ul>");
        //移除多余的方法
        $("#zoom section ul li").removeAttr("onclick");
        //设置图片区域宽度
        $("#zoom section ul").width(imageLen.length*_screenWidth);
        //设置当前显示哪张图片
        if(n>=imageLen.length){
            //轮播图为最后一张，拉回第二张
            $("#zoom section ul").stop().animate({left:0},100);//尽量设置小一点
            $("#imgList ul").css({left:0}).stop().animate({left:0},1000);
            n=1;
        }else{
            $("#zoom section ul").stop().animate({left:-n*_screenWidth},100);//尽量设置小一点
        }
        //禁止滚动条
        $("body").addClass("roll");
        //启动图片缩放
        scallingFun();
    }
    //函数：图片缩放器关闭
    function zoomCloseFun(){
        n--;
        //关闭图片缩放器
        $("#zoom").fadeOut();
        //关闭图片缩放器之后开启定时器
        timer=setInterval(imgSlideToLeftFun,2000); //开启定时器
        //开启滚动条
        $("body").removeClass("roll");
    }
    //函数：向左滑动&向右滑动
    function slideLeftFun(g){
        if(g==-1){ //向左手势
            flag++;
            if(flag<imageLen.length){
                $("#zoom ul").stop().animate({left:-flag*_screenWidth},500);
            }else{
                flag--;
                console.log("当前是第一张图片，无法向左滑动");
            }
        }
        if(g==1){ //向右手势
            flag--;
            if(flag>=0){
                $("#zoom ul").stop().animate({left:-flag*_screenWidth},500);
            }else{
                flag=0;
                console.log("当前是最后一张图片，无法向右滑动");
            }
        }
    }
    //函数：图片缩放
    function  scallingFun(){
        $('#div_2').bind('swipeone', function (event, obj) {
            var direction = obj.description.split(":")[2]
            if (direction == "left") {
                alert("left");
            } else if (direction == "right") {
                alert("right");
            } else if (direction == "pinch") {
                alert("缩放");
            }
            else if (direction == "pinchopen") {
                alert("撑开手势");
            }
        });
    }
</script>--%>
</html>
