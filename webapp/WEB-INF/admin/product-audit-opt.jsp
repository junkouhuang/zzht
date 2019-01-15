<%--
  Created by IntelliJ IDEA.
  User: Alan
  Date: 2017-11-23
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/bootstrap-combobox/bootstrap-combobox.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugins/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugins/easyui/locale/easyui-lang-zh_CN.js">
    <link href="${pageContext.request.contextPath}/css/img/picchange.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <jsp:include page="bootstrap-cssPage.jsp"></jsp:include>
    <base target="_blank">
    <style type="text/css">
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #C0C0C0;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #C0C0C0;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #C0C0C0;
            background-color: #ffffff;
        }
    </style>
    <script type="text/javascript">
        var pageContext="${pageContext.request.contextPath}";
        var picCurrent = 1;
        var picTotal = 8;
        var interval;
        function picChange(current) {
            PicStop();
            picCurrent = current;
            setSelectClass()
            PicAnimate();
            return false;
        }
        function PicPer() {
            if (picCurrent > 1) {
                picCurrent--;
            }
            else {
                picCurrent = picTotal;
            }
            picChange(picCurrent);
        }
        function PicNext() {
            if (picCurrent == picTotal) {
                picCurrent = 1
            }
            else {
                picCurrent++;
            }
            picChange(picCurrent);
        }
        function setSelectClass() {
            $("#divLink").find("a").removeClass("picselect")
            var obj = $("#divLink").find("a[title='" + picCurrent + "']");
            obj.addClass("picselect");
            return false;
        }
        function PicAnimate() {
            $("#divImg").animate({ left: -((picCurrent - 1) * 666) + "px" }, "600");
        }
        function PicStop() {
            if ($("#divImg").is(":animated")) { $("#divImg").stop(); }
            return false;
        }
        function PicRun(functionName) {
            picChange(1);
            interval = setInterval(PicNext, "3000");
        }
        function PicIntervalStop() {
            clearTimeout(interval);
        }
        $(document).ready(function () {
            PicRun();
        });
    </script>

    <script  type="text/javascript">
        var currentindex=1;
        //$("#flashBg").css("background-color",$("#flash1").attr("name"));
        function changeflash(i) {
            currentindex=i;
            for (j=1;j<=4;j++){
                if (j==i)
                {$("#flash"+j).fadeIn("normal");
                    $("#flash"+j).css("display","block");
                    $("#f"+j).removeClass();
                    $("#f"+j).addClass("dq");
                    $("#flashBg").css("background-color",$("#flash"+j).attr("name"));
                }
                else
                {$("#flash"+j).css("display","none");
                    $("#f"+j).removeClass();
                    $("#f"+j).addClass("no");}
            }}
        function startAm(){
            timerID = setInterval("timer_tick()",3000);
        }
        function stopAm(){
            clearInterval(timerID);
        }
        function timer_tick() {
            currentindex=currentindex>=3?1:currentindex+1;
            changeflash(currentindex);}
        $(document).ready(function(){
            $(".flash_bar div").mouseover(function(){stopAm();}).mouseout(function(){startAm();});
            startAm();
        });
    </script>
</head>
<body>
<div>
    <div style="margin: 2px 2px 0px 2px;height: 40%;float: left">
        <div class="clear"></div>
        <div class="picMain">
            <div class="picimg" id="divImg">
            </div>
            <div class="picaction" id="divLink">
            </div>
        </div>
    </div>
    <div style="margin: 2px 2px 0px 2px;height: 40%;float: left">
        <div class="input-group" style="padding-top: 2px">
            <div class="input-group-addon" style="width: 80px">商品名称</div>
            <input type="text" class="form-control" id="spmc" name="spmc" value="香奈儿皇室专用限量版胯间" style="width: 300px" />
        </div>
        <div class="input-group" style="padding-top: 2px">
            <div class="input-group-addon" style="width: 80px">采购编码</div>
            <input type="text" class="form-control" id="cgitemno" name="cgitemno" value="AL24004" style="width: 100px" />
            <div class="input-group-addon" style="width: 80px">商品款号</div>
            <input type="text" class="form-control" id="spcode" name="spcode" value="8GD0136" style="width: 100px" />
            <div class="input-group-addon" style="width: 80px">采购价格</div>
            <input type="text" class="form-control" id="costprice" name="costprice" value="999.00" style="width: 100px" />
        </div>
        <div class="input-group" style="padding-top: 2px">
            <div class="input-group-addon" style="width: 80px">单位</div>
            <input type="text" class="form-control" id="dw" name="dw" value="件" style="width: 100px" />
            <div class="input-group-addon" style="width: 80px">材质</div>
            <input type="text" class="form-control" id="cz" name="cz" value="纯棉" style="width: 100px" />
            <div class="input-group-addon" style="width: 80px">类别</div>
            <input type="text" class="form-control" id="lbmc" name="lbmc" value="纯色时装款长袖连衣裙" style="width: 250px" />
        </div>
        <div class="input-group" style="padding-top: 2px">
            <div class="input-group-addon" style="width: 80px">品牌</div>
            <input type="text" class="form-control" id="productbrand" name="productbrand" value="" style="width: 100px" />
            <div class="input-group-addon" style="width: 80px">产品描述</div>
            <input type="text" class="form-control" id="productdesc" name="productdesc" value="" style="width: 300px" />
        </div>
        <div class="input-group" style="padding-top: 2px">
            <div class="input-group-addon" style="width: 80px">备注</div>
            <textarea id="submitbz" name="submitbz" class="form-control" cols="40" rows="3"></textarea>
        </div>
    </div>
    <div style="margin: 2px 2px 0px 2px;float: right;margin-right: 120px;">
            <table class="mxtable" id="mxtable" data-height="250" data-mobile-responsive="true">

            </table>
    </div>
    <div style="margin: 0px 2px 0px 2px;width: 50%;float: left">
        <table class="storestable" id="storestable" data-height="250" data-mobile-responsive="true">

        </table>
    </div>
    <div style="height: 40%;float: right;margin-right: 150px;margin-top: 10px;">
        <div class="input-group" style="padding-top: 2px;">
            <span style="color: blue">温馨提示：审核不通过时必须在审核备注中填写原因</span>
        </div>
        <div class="input-group" style="padding-top: 2px;">
            <div class="input-group-addon" style="width: 80px">审核备注</div>
            <textarea id="auditmsg" name="auditmsg" class="form-control" cols="40" rows="3"></textarea>
        </div>
        <div class="input-group" style="padding-top: 2px;">
            <button id="optbtn" style="margin-top: 2px;" class="btn btn-success glyphicon glyphicon-ok" onclick="auditSuccess()">审核通过</button>
            <button style="margin-left: 10px;" class="btn btn-danger glyphicon glyphicon-remove" onclick="auditFail()">审核不通过</button>
        </div>
    </div>
</div>
</body>
<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-combobox/bootstrap-combobox.js"></script>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/product-audit-opt.js"></script>
</html>