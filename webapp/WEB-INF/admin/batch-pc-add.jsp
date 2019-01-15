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
    <title>新增批次</title>
    <script type="text/javascript">
        var pageContext = "${pageContext.request.contextPath}";
    </script>

</head>
<body>
<div class="addMenu">
    <form id="addSpBatchForm" class="mt-20">
        <table class="table  radius">
            <tr>
                <td class="text-r">批次号:</td>
                <td><input type="text" name="batchcode" class="input-text radius batchcode" readonly></td>

                <td class="text-r">批次名称:</td>
                <td><input type="text" name="batchname" class="input-text radius batchname"></td>

                <td class="text-r">档次类型:</td>
                <td>
                    <select class="typenameSelect select" name="typename">
                        <option value='A类'>A类</option>
                        <option value='B类'>B类</option>
                        <option selected='selected' value='C类'>C类</option>
                    </select>
                </td>

                <td class="text-r">品牌:</td>
                <td><input type="text" name="brand" class="input-text radius brand"><a href="JavaScript:;"
                                                                                       onclick="layer_show('品牌信息', 'batch-pc-brand', '400', '600');">选择品牌</a>
                </td>
            </tr>

            <tr class="">
                <td class="text-r">地域属性:</td>
                <td>
                    <select class="dqSelect select" name="dq">
                        <option value='南'>南</option>
                        <option value='中'>中</option>
                        <option value='北'>北</option>
                    </select>
                </td>

                <td class="text-r">尺码偏向:</td>
                <td>
                    <select class="cmpxSelect select" name="cmpx">
                        <option value='X'>X</option>
                        <option value='L' selected="selected">L</option>
                        <option value='M'>M</option>
                    </select>
                </td>

                <td class="text-r">季节:</td>
                <td>
                    <select class="jjSelect select" name="jj">
                        <option value='夏'>夏</option>
                        <option value='春秋' selected="selected">春秋</option>
                        <option value='冬'>冬</option>
                        <option value='四季'>四季</option>
                    </select>
                </td>

                <td class="text-r">是否可退:</td>
                <td>
                    <select class="returmtypeSelect select" name="returmtype">
                        <option value='0'>不可退</option>
                        <option value='1' selected="selected">可退</option>
                    </select>
                </td>
            </tr>

            <tr class="">
                <td class="text-r">起订数量:</td>
                <td><input type="text" name="leastorderqty" class="input-text radius" value="1"
                           onkeyup="this.value=this.value.replace(/0\D/g,'1')"></td>

                <td class="text-r">材质:</td>
                <td><input type="text" name="texture" class="input-text radius texture"></td>

                <td class="text-r">类别组:</td>
                <td>
                    <select class="categoryGroupSelect select" onchange="selectCategoryGroupLoadCategory(this)">
                        <option disabled selected value=""></option>
                    </select>
                </td>


                <td class="text-r">商城大类:</td>
                <td>
                    <select class="categorySelect select" onchange="selectCategoryLoadSubCategory(this)">
                        <option disabled selected value="">请选择商城大类</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="text-r">商城子类:</td>
                <td>
                    <select class="subCategorySelect select" name="subcategoryid">
                        <option disabled selected value="">请选择商城子类</option>
                    </select>
                </td>

                <td class="text-r">生产时间:</td>
                <td><input type="text" name="producetext" class="input-text radius producetext"></td>

                <td class="text-r">描述1:</td>
                <td><input type="text" name="text1" class="input-text radius text1"></td>

                <td class="text-r">描述2:</td>
                <td><input type="text" name="text2" class="input-text radius text2"></td>
            </tr>

            <tr class="">
                <td class="text-r">描述3:</td>
                <td><input type="text" name="text3" class="input-text radius text3"></td>

                <td class="text-r">备注:</td>
                <td><input type="text" name="bz" class="input-text radius bz"></td>

                <td class="text-r">价格描述:</td>
                <td><input type="text" name="pricedes" class="input-text radius pricedes"></td>

                <td class="text-r">请选择商城批次类型</td>
                <td class="text-l" class="producttype">
                    <input name="producttype" value="1" type="radio" class="radio-1"><label for="radio-1">现货</label>
                    <input name="producttype" value="2" type="radio" class="radio-2"><label for="radio-2">预定</label>
                    <input name="producttype" value="4" type="radio" class="radio-3"><label for="radio-3">生活用品</label>
                </td>
            </tr>

            <tr>
                <td colspan=6>
                    <a class="btn btn-primary radius" data-title="保存" onclick="submitSpBatchForm()" href="javascript:;"
                       style="margin: 4px 0;"><i class="Hui-iconfont">&#xe600;</i>保存</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/batch-pc-add.js"></script>
</body>
</html>