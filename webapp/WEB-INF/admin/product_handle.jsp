<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品处理界面</title>
    <!--手机响应式-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
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
    <style type="text/css">
        #canvas{
            position: relative;
        }
        #show_num{
            position: absolute;
            z-index: 111;
        }
        .show_num{
            border: 1px solid #bfbfbf;
            background-color: #fff;
            width: 90px;
            height: 24px;
            line-height: 24px;
            text-indent: 5px;
            position: relative;
            z-index: 0;
        }
        #show_num em{
            position:absolute;
            bottom:-7px;
            left:4px;
            overflow:hidden;
            width:13px;
            height:13px;
            background:#fff;
            border-bottom:1px solid #bfbfbf;
            border-right:1px solid #bfbfbf;
            -webkit-transform:rotate(45deg);
            -moz-transform:rotate(45deg);
            -o-transform:rotate(45deg);
            transform:rotate(45deg);
            z-index: -2;
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

                <c:forEach items="${batchinfo.spbatchImageList}" var="img">
                 <img class="img-thumbnail"  src="http://image.zhizhi360.com/${img.url}" />
                </c:forEach>

            </div>
            <!--详情-->
            <section class="detail" id="detail">
                <section class='detailHtml1'>
                    <p class=productName>${batchinfo.productname}</p>
                    <p class=productAttr>${batchinfo.productattr==0?'常规退换货商品':'特殊不退不换商品'}</p>
                    <p class=sellPrice1><span>￥</span>${batchinfo.sellprice}</p>
                    <p class=batchCode>${batchinfo.batchcode}${spcodes}</p>
                    <p class=dw>${batchinfo.dw}</p>
                    <p hidden class=batchid>${batchinfo.batchid}</p>
                    <p hidden class=empid>${empid}</p>
                </section>
                <section class=detailHtml2>
                    <p class=brand>${batchinfo.brand}</p>
                    <p class=branddes>${batchinfo.branddes}</p>
                    <p class=cz>${batchinfo.cz}</p>
                </section>
            </section>
        </section>
        <br/>
        <section>
            <canvas id="canvas"></canvas>
        </section>
        <section class="demo">
            <nav class="nav">
                <ul>
                    <li>
                        <a href = "javascript:void(0);" onclick ="productHandleFun(1)" >
						<span>
                            保留
						</span>
                        </a>
                    </li>
                    <li>
                        <a href = "javascript:void(0);" onclick ="productHandleFun(9)" >
                        <span>
                            下架
						</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </section>
    </div>
    <div class="zoom" id="zoom" onclick="zoomCloseFun()">
        <!--图片缩放-->
        <section></section>
    </div>
</body>
<script type="text/javascript">
    var pageContext="${pageContext.request.contextPath}";
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

    function productHandleFun(result) {
        var handleresult = parseInt(result);
        var handlemsg = handleresult == 1 ? '保留':'下架';
        var batchid = $(".batchid").html();
        var empid = $(".empid").html();
        layer.confirm('确认 '+handlemsg+' 该批次？',function(index){
            layer.close(index);
            $.ajax({
                url: pageContext +"/wx/productHandleByBatchid/" + batchid,
                data:{"empid":empid,"handleresult":handleresult},
                type: "post",
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    layer.alert(data.msg);
                }
            });
        })
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
    var gpsl = "${gpsl}";
    var ordersl = "${ordersl}";
    var fhsl = "${fhsl}";
    var sellsl = "${sellsl}";
</script>

<c:set var="gpsl" value="${gpsl}" scope="application"/>
<c:set var="ordersl" value="${ordersl}" scope="application"/>
<c:set var="fhsl" value="${fhsl}" scope="application"/>
<c:set var="sellsl" value="${sellsl}" scope="application"/>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/canvas.js"></script>
</html>
