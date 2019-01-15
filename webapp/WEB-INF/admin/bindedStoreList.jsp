<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>绑定列表</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <style>
        *,html,body {
            margin: 0;
            padding: 0;
            background-size: cover;
            position: relative;
            font-size: 14px;
        }
        .context {
            position: relative;
            background: rgba(0, 0, 0, 0.6);
            width: 100%;
            height: 100%;
        }
        .bindedStoreList table td, .bindedStoreList table th{
               color:#fff;
           }
        .unbundle{
            color:#fff;
            text-decoration:underline;
        }
        .msg{
           text-align: center;
           padding-top: 40px;
           font-size: 15px;
           color: #ffffff;
           }
        .alert {
            left: 50%;
            margin-left: -80px;
            width: 160px;
            background: #000;
            color: #ffffff;
            font-size: 15px;
            border-radius: 10px;
            display: none;
            text-align: center;
            margin-bottom: 0;
            padding: 0;
            position: absolute;
            z-index: 999;
            top:40%;
        }
    </style>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images/bindlogin.jpg')">
    <div class="context">
        <div class="bindedStoreList">

        </div>
        <div class="msg"></div>
        <div class="alert">
        </div>
    </div>
</body>
<script type="text/javascript">
    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg); //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }
    var openid;
    var pageContext="${pageContext.request.contextPath}";
    $(function(){
        openid = getUrlParam('openid');
        $.ajax({
            url: pageContext+"/wx/getStoreBindsListByOpenid/"+openid,
            contentType:'application/json;charset=utf-8',
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                if(!data.success){
                    $(".alert").text(data.msg).toggle();
                    $(".msg").text(data.msg);
                    setTimeout(function(){$(".alert").toggle()},2000);
                    return false;
                }else{
                    var bindedStoreTbHtml="<table class='table'>";
                    bindedStoreTbHtml+="<thead><tr><th>门店号</th><th>门店名称</th><th>操作</th></tr></thead>";
                    for(var i in data.obj){
                        bindedStoreTbHtml+="<tr><td>"+data.obj[i].mdcode+"</td><td>"+data.obj[i].mdmc+"</td><td ><a class='unbundle' onclick='untie("+data.obj[i].storeid+",this)' data-mdmc="+data.obj[i].mdmc+">解绑</a></td></tr>";
                    }
                    $(".bindedStoreList").append(bindedStoreTbHtml);
                }
            },fail:function(e){
                $(".alert").text("调用接口失败").toggle();
                setTimeout(function(){$(".alert").toggle()},2000);
            }
        });
    })
    function untie(storeid,data){
        if(confirm("是否解绑？"+data.getAttribute("data-mdmc"))){
            if(storeid==""){
                $(".alert").text("storeid为空").toggle();
                setTimeout(function(){$(".alert").toggle()},2000);
                return false;
            }else if(openid==""){
                $(".alert").text("为空").toggle();
                setTimeout(function(){$(".alert").toggle()},2000);
                return false;
            }else{
                $.ajax({
                    url: pageContext+"/wx/untieStoreByOpenidAndMdcode/"+storeid+"/"+openid,
                    contentType:'application/json;charset=utf-8',
                    type: "post",
                    dataType: "json",
                    async: false,
                    cache: false,
                    success: function (data) {
                        if(!data.success){
                            $(".alert").text("解绑失败").toggle();
                            setTimeout(function(){$(".alert").toggle()},2000);
                        }else{
                            $(".alert").text("已解绑").toggle();
                            setTimeout(function(){$(".alert").toggle()},2000);

                            window.location.reload();
                        }
                    },fail:function(e){
                        alert(e);
                    }
                });
            }
        }
    }
</script>
</html>
