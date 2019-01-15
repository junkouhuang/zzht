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
    <jsp:include page="bootstrap-cssPage.jsp"></jsp:include>
    <title>新增用户</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
        var formData = function () {
            return $("#addUserForm").serializeJSON();
        };
    </script>
</head>

<body>
<div class="page-container">
    <fieldset>
        <form id="addUserForm" method="post">
            <table class="table">
                <tr>
                    <td width="80px;"><label class="combobox form-control">用户名称:</label></td>
                    <td width="240px;"><input placeholder="请输入用户名" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" type="text" name="username" id="username" class="form-control radius"></td>
                    <td width="80px;"><label class="combobox form-control">用户密码:</label></td>
                    <td width="240px;"><input maxlength="6" placeholder="请输入6位数字" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') " type="password" name="password" id="password" class="form-control radius"></td>
                </tr>
                <tr>
                    <td width="80px;"><label class="combobox form-control">用户类型:</label></td>
                    <td width="240px;">
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="usertype"
                                    id="usertype">
                                <option value="" selected="selected">请选择用户类型</option>
                                <option value="1">门店用户</option>
                                <option value="0">后台用户</option>
                            </select>
                        </div>
                    </td>
                    <td width="80px;"><label class="combobox form-control">关联门店:</label></td>
                    <td width="240px;">
                        <div class="col-lg-2 col-md-2 ">
                            <select style="height: 30px;" class="combobox form-control" type="text" name="storeid" id="storeid">
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="80px;"><label class="combobox form-control">供应商:</label></td>
                    <td width="240px;">
                    <div class="col-lg-2 col-md-2 ">
                        <select style="height: 30px;" class="combobox form-control" type="text" name="gysid"
                                id="gysid">
                        </select>
                    </div>
                    </td>
                </tr>
            </table>
        </form>
        <span style="color:blue;margin-left: 10px;">温馨提示：用户类型选择为门店用户时,必须关联门店..</span>
    </fieldset>
</div>
<script src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<jsp:include page="bootstrap-jsPage.jsp"></jsp:include>
</body>
<script type="text/javascript">
    $(function(){
        $.ajax({
            url: pageContext + "/storeOptController/getStoreListAll",
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                var mdContent = '<option value="" selected="selected">请输入店号,店名查询</option>';
                for (var i = 0; i < data.length; i++) {
                    mdContent += "<option value='" + data[i].id + "' mdcode='" + data[i].mdcode + "'>" + data[i].mdcode + "_" + data[i].mdmc + "</option>";
                }
                $('#storeid').append(mdContent);
            }
        });
        $('#storeid').combobox();
        $('#usertype').combobox();
        loadGysxxList();
    })

    function loadGysxxList() {
        $.ajax({
            url: pageContext + "/gysspxx/getGysxxList",
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                var gysContent = '<option value="" selected="selected"></option>';
                for (var i = 0; i < data.length; i++) {
                    gysContent += "<option value='" + data[i].id + "' gyscode='" + data[i].gyscode + "'>" + data[i].gyscode + "_" + data[i].gysmc + "</option>";
                }
                $('#gysid').append(gysContent);
            }
        });
        $('#gysid').combobox();
    }
</script>
</html>