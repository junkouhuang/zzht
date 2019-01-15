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
    <title>门店值值宝余额调整Excel选择界面</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
        function formData(){
            $("#importWalletBalanceFrom").attr("action")
            $("#importWalletBalanceFrom").submit();
            $(function($){
                var textStr;
                $("#target").load(function(){
                    textStr = $(this);
                    var responseText = textStr[0].contentDocument.body.textContent;
                    if("SUCCESS" == responseText){
                        alert("操作成功！！");
                        window.parent.location.reload();
                    }else{
                        alert(responseText);
                    }
                })
            })
        }
    </script>

</head>
<body>
<div class="addMenu">
    <form id="importWalletBalanceFrom" action="${pageContext.request.contextPath}/storeOptController/importWalletBalance"
          method="post"
          enctype="multipart/form-data" target="target">
        <div style="margin-left: 20%;margin-top: 15%;">
            <input type="text" name="bz" style="width:250px;" class="input-text" placeholder="请填写备注。。" />
        </div>
        <div class="uploader orange" style="margin-left: 20%;margin-top: 2%;">
            <input type="text" class="filename" readonly="readonly"/>
            <input type="button" name="file" class="button" value="Browse..."/>
            <input type="file" name="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel" runat="server"/>
            <iframe hidden name="target" id="target" width="100%" height="100%"></iframe>
        </div>
    </form>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript">
    $(function(){
        $("input[type=file]").change(function(){$(this).parents(".uploader").find(".filename").val($(this).val());});
        $("input[type=file]").each(function(){
            if($(this).val()==""){$(this).parents(".uploader").find(".filename").val("No file selected...");}
        });
    });
</script>
</body>
</html>