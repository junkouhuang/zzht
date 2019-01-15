<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
    <title>绑定</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <style type="text/less">
        @width:100%;
        @height:100%;
        @absolute:absolute;
        @relative:relative;
        @white:#ffffff;
        @lead:#fff3f3;
        /*响应式布局(bootstrap媒体查询)这里以为480作为设计标准尺寸*/
        @media screen and (max-width: 321px) {/* 兼容iphone3GS/iphone3G/iphone2017/iphone4/4s/iphone5/iphone5S/iphone5c */
            *,html,body {
                margin: 0;
                padding: 0;
                background-size: cover;
                font-size:12px;
            }
        }
        @media screen and (min-width: 321px) and (max-width: 376px) {/* 兼容iphone6/iphone6s/iphone7/iphone8c */
            *,html,body {
                margin: 0;
                padding: 0;
                background-size: cover;
                font-size:14px;
            }
        }
        @media screen and (min-width: 376px) and (max-width: 415px) {/* 兼容iphone6 Plus/iphone6s plus/iphone7 plus/iphone8 plus */
            *,html,body {
                margin: 0;
                padding: 0;
                background-size: cover;
                font-size:15px;
            }
        }
        @media screen and (min-width: 415px)  {/* 兼容大于415px屏幕 */
            *,html,body {
                margin: 0;
                padding: 0;
                background-size: cover;
                font-size:16px;
            }
        }
       /* @media screen and (min-width: 736px) and (max-width: 812px) and (-webkit-device-pixel-ratio: 2){!* 兼容iphonex *!
            *,html,body {
                margin: 0;
                padding: 0;
                background-size: cover;
                font-size:14px;
            }
        }*/
        .context {
            background: rgba(0,0,0,0.7);
            width: @width;
            height: @height;
            position: @absolute;
        }
        /*响应式布局(bootstrap媒体查询)*/
        .description {
            padding-top: 4rem;
            text-align: center;
            color: @white;
            font-size: 1rem;
            img {
                width: 7rem;
            }
        }
        .form {
            .openid {
                display: none;
            }
            .username{
                width: 80%;
                margin-left: 10%;
                background: @lead;
                height: 3rem;
                margin-top: 1.83rem;
                border-radius:4px;
                span  {
                    width: 25%;
                    height: 3rem;
                    line-height: 3rem;
                    display: inline-block;;
                    text-align: center;
                    float: left;
                    font-size: 1rem;
                    font-family: cursive;
                    font-weight: bold;
                }
                 input{
                    width: 60%;
                    height: 3rem;
                    line-height: 3rem;
                    border:none;
                    font-size: 1rem;
                    background: @lead;
                    float: left;
                }
                input::-webkit-input-placeholder { /* WebKit browsers */
                    color:#999;
                    font-family: cursive;
                    font-size: 1rem;
                }
                 input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
                     color:#999;
                     font-family: cursive;
                     font-size: 1rem;
                }
                 input::-moz-placeholder { /* Mozilla Firefox 19+ */
                     color:#999;
                     font-family: cursive;
                     font-size: 1.25rem;
                }
                 input:-ms-input-placeholder { /* Internet Explorer 10+ */
                     color:#999;
                     font-family: cursive;
                     font-size: 1rem;
                }
                input:focus{outline:0 !important}
                a{
                    width: 10%;
                    height: 3rem;
                    line-height: 3rem;
                    display: inline-block;;
                    float: left;
                    img {
                        width: 1rem;
                        height: 1rem;
                        position: relative;
                        top: 50%;
                        margin-top: -0.5rem;
                        display: none;
                    }
                }
            }
            .password {
                width: 80%;
                margin-left: 10%;
                background: @lead;
                height: 3rem;
                margin-top: 0.83rem;
                border-radius:4px;
                >span:nth-child(1) {
                    width: 25%;
                    height: 3rem;
                    line-height: 3rem;
                    display: inline-block;;
                    text-align: center;
                    float: left;
                    font-size: 1rem;
                    font-family: cursive;
                    font-weight: bold;
                }
                input {
                    width: 55%;
                    height: 3rem;
                    line-height: 3rem;
                    border:none;
                    font-size: 1rem;
                    background: @lead;
                    float: left;
                }
                input::-webkit-input-placeholder { /* WebKit browsers */
                    color:#999;
                    font-family: cursive;
                    font-size: 1rem;
                }
                input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
                    color:#999;
                    font-family: cursive;
                    font-size: 1rem;
                }
                input::-moz-placeholder { /* Mozilla Firefox 19+ */
                    color:#999;
                    font-family: cursive;
                    font-size: 1rem;
                }
                input:-ms-input-placeholder { /* Internet Explorer 10+ */
                    color:#999;
                    font-family: cursive;
                    font-size: 1rem;
                }
                input:focus{outline:0 !important}
                div {
                    width: 10%;
                    height: 3rem;
                    line-height: 3rem;
                    float: left;
                    text-align: center;
                    span {
                        font-size: 1rem;
                    }
                }
                a{
                    width: 10%;
                    height: 3rem;
                    line-height: 3rem;
                    display: inline-block;;
                    float: left;
                    img {
                        width: 1rem;
                        height: 1rem;
                        position: relative;
                        top: 50%;
                        margin-top: -0.5rem;
                        display: none;
                    }
                }
            }
            .next {
                text-align: center;
                color: @white;
                font-size: 1.08rem;
                margin-top: 2.5rem;
                input {
                    width: 4rem;
                    height:4rem;
                    border-radius: 100%;
                    background-size: cover;
                    margin-top:0.83rem;
                    border: none;
                    background-color: #333;
                }
            }
        }
        .message {
            text-align: center;
            font-size: 1.08rem;
            margin-top: 1.66rem;
            color: #ACCD3C;
            width: 70%;
            margin-left: 15%;
            display: none;
        }
        .bindedStore {
            text-align: center;
            font-size: 1.08rem;
            color: @white;
            a {
                color:@white;
                text-decoration:underline;
            }
        }
        .alert {
            left: 50%;
            margin-left: -80px;
            width: 13.33rem;
            background: #000;
            color: @white;
            font-size: 1.25rem;
            border-radius:0.83rem;
            display: none;
            text-align: center;
            margin-bottom: 0;
            padding: 0;
            position: absolute;
            z-index: 999;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/less.js"></script>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images/bindlogin.jpg')">
    <div class="context">
        <div class="description">
            <img src="${pageContext.request.contextPath}/images/bind.png">
        </div>
        <div class="form" >
            <form id="interimkwinfoForm">
                <input name="openid"  class="openid" id="openid" value=${openid} >
                <div class="username">
                    <span>登录名</span>
                    <input type="text" placeholder="值值小程序登陆账号" maxlength="16" id="username" name="username" data-placement="bottom" class="tooltip-toggle" title="" autofocus/>
                    <a  class="clearUsername">
                        <img src="${pageContext.request.contextPath}/images/clear.png">
                    </a>
                </div>
                <div class="password">
                    <span>密   码</span>
                    <input type="text" placeholder="值值小程序登陆密码" maxlength="6" id="password" name="passwd" data-placement="bottom" class="tooltip-toggle" title=""/>
                    <a  class="clearPassword">
                        <img src="${pageContext.request.contextPath}/images/clear.png">
                    </a>
                    <div> <span  id="checkbtn" class="glyphicon glyphicon-eye-close"></span></div>
                </div>
                <div class="next">
                    <div>点击下方按钮进行绑定</div>
                    <input type="button" style="background-image: url(${pageContext.request.contextPath}/images/bindlogin1.png)" value=""/>
                </div>
            </form>
        </div>
        <div class="bindedStore">
            <a href="javascript:void(0)">查看已经绑定门店</a>
        </div>
        <div class="message">
        </div>
        <div class="alert">
        </div>
    </div>
</body>
<script type="text/javascript">
    var pageContext="${pageContext.request.contextPath}";
    $(function(){
        $("#password").attr('type','password');
        $("#username,#password").on('click',function(){
            $('#username,#password').tooltip('destroy')
        })
        //输入框正在输入时
        $("#username,#password").on('input',function(){
            if(!($('#username').val()=='')){
                $(".clearUsername img").css("display","block")
            }else{
                $(".clearUsername img").css("display","none")
            }
            if(!($('#password').val()=='')){
                $(".clearPassword img").css("display","block")
            }else{
                $(".clearPassword img").css("display","none")
            }
        })
        $("#password").on("focus",function(){
            $("#password").attr('type','password');
        })
        $(".clearUsername").on('click',function(){
            $('#username').val('');
            $(".clearUsername img").css("display","none")
        });
        $(".clearPassword").on('click',function(){
            $('#password').val('');
            $(".clearPassword img").css("display","none");
            $("#password").attr('type','password');
        });
        $(".next input").click(function(){
            var postdata = $('#interimkwinfoForm').serializeJSON();
            if(postdata.username==""){
                $('#username').attr("title","用户名不能为空").tooltip('toggle');
                return false;
            }
            if(postdata.passwd==""){
                $('#password').attr("title","密码不能为空").tooltip('toggle');
                return false;
            }
            if(postdata.openid==""){
                $(".message").toggle().text("openid为空");
                setTimeout(function(){$(".message").toggle()},2000);
                return false;
            }
            $.ajax({
                url: pageContext+"/wx/bindStoreByOppenid",
                data:JSON.stringify(postdata),
                contentType:'application/json;charset=utf-8',
                type: "post",
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    if(!data.success){
                        if(data.msg=="用户名不存在，绑定失败！！"){
                            $('#username').attr("title",data.msg).tooltip('toggle');
                        }else if(data.msg=="密码不正确，绑定失败！！"){
                            $('#password').attr("title",data.msg).tooltip('toggle');
                        }else{
                            $(".alert").text(data.msg).toggle();
                            setTimeout(function(){$(".alert").toggle()},2000);
                        }
                    }else{
                        $("#password").attr('type','text');
                       window.location.href = pageContext+"/wx/toView/bindLoginSuccess";
                    }
                },fail:function(e){
                    alert(e);
                }
            });
        })
        $(".bindedStore").click(function(){
            var postdata = $('#interimkwinfoForm').serializeJSON();
            if(postdata.openid==""){
                $(".message").toggle().text("openid为空");
                setTimeout(function(){$(".message").toggle()},2000);
                return false;
            }else{
                $.ajax({
                    url: pageContext+"/wx/getStoreBindsListByOpenid/"+postdata.openid,
                    contentType:'application/json;charset=utf-8',
                    type: "post",
                    dataType: "json",
                    async: false,
                    cache: false,
                    success: function (data) {
                        if(!data.success){
                            $(".alert").text(data.msg).toggle();
                            setTimeout(function(){$(".alert").toggle()},2000);
                            return false;
                        }else{
                            window.location.href = pageContext+"/wx/toView/bindedStoreList?openid="+postdata.openid;
                        }
                    },fail:function(e){
                        $(".alert").text("调用接口失败").toggle();
                        setTimeout(function(){$(".alert").toggle()},2000);
                    }
                });
            }
        })
        $("#checkbtn").on("click",function(){
            if($(this).attr("class")=="glyphicon glyphicon-eye-close"){
                $(this).attr("class","glyphicon glyphicon-eye-open");
                $("#password").attr('type','text');
            }else{
                $(this).attr("class","glyphicon glyphicon-eye-close");
                $("#password").attr('type','password');
            }
        })
    })

</script>
</html>
