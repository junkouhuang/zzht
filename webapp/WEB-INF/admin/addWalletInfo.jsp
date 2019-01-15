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
    <title>值值宝流水新增界面</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
        var formData = function () {
            return $("#addWalletInfo").serializeJSON();
        };
        function clearNoNum(obj) {
            obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
            obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是
            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数

        }
    </script>

</head>
<body>
<div class="addMenu">
    <form id="addWalletInfo">
        <table class="table  radius">
            <tr>
                <td class="text-r">类型:</td>
                <td><input type="radio" name="type" value="0" />充值 <input type="radio" name="type" value="1" />付款</td>
                <td class="text-r">金额:</td>
                <td><input type="text" onkeyup='clearNoNum(this)' name="trasactionamount" class="input-text radius trasactionamount"></td>
            </tr>
            <tr class="">
                <td class="text-r">备注:</td>
                <td colspan="3"><input type="text" name="bz" class="input-text radius bz"></td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
</body>
</html>