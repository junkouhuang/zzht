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
    $("#page1,#page2").height(window.screen.height);
}
//函数：退款通知详情
function getOrdersPageInfoFun(){
    $.ajax({
       url:pageUrl+"/wx/getOrdersPageInfo/"+ordercode,
        // url:"http://zzadmin.zhizhi360.com/wx/getOrdersPageInfo/464400859908800512",
        method:"POST",
        dataType: "json",
        async: false,
        cache: false,
        crossDomain: true,
        success:function(data){
            if(data.success){
                imgHtmlFun(data);
                detailHtmlFun(data);
                ordersDetailListFun(data);
                if(data.obj.wxOrderPickingList!=null){
                    wxOrderPickingListFun(data);
                }else{
                    $("#wxOrderPickingList").append("<span>无拣货信息</span>");
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
        imgHtml+="<li onclick='zoomOpenFun()'><figure  style='background-image:url(http://image.zhizhi360.com/"+imageLen[0].url+");background-size: cover;'></figure></li>";
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
    $("#imgList ul").width((imageLen+1)*_screenWidth);
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
    var ordersDetailListHtml="<div class='title1'><span>订单</span></div>";
        ordersDetailListHtml+="<ul>";
        ordersDetailListHtml+="<li><span class=cm>尺码</span><span class=sl>数量</span><span>折后价</span><span class='amount'>金额</span><span class='amount'>每份数量</span></li>";
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
    var wxOrderPickingListHtml="<div class='title2'><span>拣货单</span></div>"
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
            rollPageFun(1);
            break;
        case 2:
            //向下！
            rollPageFun(-1);
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
            $("#zoom ul").stop().animate({left:-flag*_screenWidth},1000);
        }else{
            flag--;
            console.log("当前是第一张图片，无法向左滑动");
        }
    }
    if(g==1){ //向右手势
        flag--;
        if(flag>=0){
            $("#zoom ul").stop().animate({left:-flag*_screenWidth},1000);
        }else{
            flag=0;
            console.log("当前是最后一张图片，无法向右滑动");
        }
    }
}
