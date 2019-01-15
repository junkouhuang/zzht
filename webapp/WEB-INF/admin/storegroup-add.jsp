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
    <title>新增门店分组</title>
</head>
<body>
<div class="addMenu">
    <form id="addStoreGroupForm">
        <table class="table  radius">
            <tr>
                <td class="text-r">组号:</td>
                <td><input type="text" id="groupcode" name="groupcode" class="input-text radius grouopcode"></td>
                <td class="text-r">组名:</td>
                <td><input type="text" id="groupname" name="groupname" class="input-text radius groupname"></td>
            </tr>
            <tr class="">
                <td class="text-r">描述:</td>
                <td colspan="3"><input type="text" id="desc" name="desc" class="input-text radius desc"></td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript">
    $(function(){
        var type = getQueryString("type");
        if(type == 1){
            var groupid = getQueryString("groupid");
            $.ajax({
                url: pageContext + "/sotreGroupController/getStoreGroupByid/"+groupid,
                type: "GET",
                dataType: "json",
                async: false,
                cache: false,
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    if (data.success) {
                        $("#groupname").val(data.obj.groupname);
                        $("#groupcode").val(data.obj.groupcode);
                        $("#desc").val(data.obj.desc);
                    }else{
                        layer.alert(data.msg);
                    }

                }, error: function () {
                    alert("请求失败！！");
                }
            });
        }
    })
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    };

    var pageContext = "${pageContext.request.contextPath}";
    var formData = function () {
        return $("#addStoreGroupForm").serializeJSON();
    };
</script>
</body>
</html>