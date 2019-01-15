<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>绑定</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bindLogin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <style type="text/css">
        *,html,body {
            margin: 0;
            padding: 0;
            background-size: cover;
        }
        .context {
            background: #333;
            opacity: 0.9;
            width: 100%;
            height: 100%;
            position: relative;
        }
        .description {
            padding-top: 150px;
            text-align: center;
            color: #ffffff;
            font-size: 15px;
        }
        .form .openid{
            display: none;
        }
        .form  .username,.form .password {
            width: 80%;
            margin-left: 10%;
            background: #fff3f3;
            height: 40px;
            margin-top: 10px;
        }
        .form  .username  span  {
            width: 30%;
            height: 40px;
            line-height: 40px;
            display: inline-block;;
            text-align: center;
            float: left;
            font-size: 15px;
            font-family: cursive;
            font-weight: bold;
        }
        .form  .password span {
            width: 30%;
            height: 40px;
            line-height: 40px;
            display: inline-block;;
            text-align: center;
            float: left;
            font-size: 15px;
            font-family: cursive;
            font-weight: bold;
        }
        .form  .username input,.form  .password  input {
            width: 60%;
            height: 40px;
            line-height: 40px;
            border:none;
            font-size: 16px;
            background: #fff3f3;
            float: left;
        }
        .form  .username a,.form  .password a{
            width: 10%;
            height: 40px;
            display: inline-block;;
            float: left;
        }
        .form  .username img,.form  .password  img {
            width: 20px;
            height: 20px;
            margin-top: 10px;
            display: none;
        }
        input:focus,input:focus{outline:0 !important}
        .form  .next {
            text-align: center;
            color: #ffffff;
            font-size: 13px;
            margin-top: 30px;
        }
        .form  .next  input {
            width: 65px;
            height:65px;
            border-radius: 100%;
            background-size: cover;
            margin-top:10px;
            border: none;
            background-color: #333;
        }
        .form  .username input::-webkit-input-placeholder,
        .form  .password input::-webkit-input-placeholder{
            color:#999;
            font-family: cursive;
        }
        .form  .username input::-moz-placeholder,
        .form  .password input::-moz-placeholder{   /* Mozilla Firefox 19+ */
            color:#999;
            font-family: cursive;
        }
        .form  .username input:-moz-placeholder,
        .form  .password input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
            color:#999;
            font-family: cursive;
        }
        .form  .username input:-ms-input-placeholder,
        .form  .password input:-ms-input-placeholder{  /* Internet Explorer 10-11 */
            color:#999;
            font-family: cursive;
        }
        .message {
            text-align: center;
            font-size: 13px;
            margin-top: 20px;
            color: #ACCD3C;
            width: 70%;
            margin-left: 15%;
            display: none;
        }
        .other {
            text-align: center;
            font-size: 13px;
            color: #ffffff;
            margin: 10px;
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
        }
    </style>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images/bindlogin.png')">
    <div class="context">
        <div class="description">
            微信解绑
        </div>
        <div class="form" >
            <form id="interimkwinfoForm">
                <input name="openid"  class="openid" id="openid" value='0' >
                <div class="username">
                    <span>登录名</span>
                    <input type="text" placeholder="值值小程序登陆账号" maxlength="16" id="username" name="username" data-placement="bottom" class="tooltip-toggle" title=""/>
                    <a  class="clearUsername">
                        <img src="${pageContext.request.contextPath}/images/clear.png">
                    </a>
                </div>
                <div class="password">
                    <span>密   码</span>
                    <input type="password" placeholder="值值小程序登陆密码" maxlength="6" id="password" name="passwd" data-placement="bottom" class="tooltip-toggle" title=""/>
                    <a  class="clearPassword">
                        <img src="${pageContext.request.contextPath}/images/clear.png">
                    </a>
                </div>
                <div class="next">
                    <div>点击下方按钮进行解绑</div>
                    <input type="button" style="background-image: url(${pageContext.request.contextPath}/images/unbundle.png)" value=""/>
                </div>
            </form>
        </div>
        <div class="other">
                绑定遇到问题？
        </div>
        <div class="message">
            <div></div>
        </div>
        <div class="alert">

        </div>
    </div>
</body>
<script type="text/javascript">
    var pageContext="${pageContext.request.contextPath}";
    $(function(){
        $(".next input").click(function(){
            $('#username').attr("title","").tooltip('destroy')
            $('#password').attr("title","").tooltip('destroy')
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
                $(".message").toggle().text("openid不存在");
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
                        $(".alert").text(data.msg).toggle();
                        setTimeout(function(){$(".alert").toggle()},2000);
                    }
                },fail:function(e){
                    alert(e);
                }
            });

        })
    })
</script>
</html>
