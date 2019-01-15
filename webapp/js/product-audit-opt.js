var table = null;
var cmtable = null;
var spid;
var opttype;
var spxx;
$(function () {
    spid = getQueryString("spid");
    opttype = getQueryString("opttype");
    if(opttype == 1){
        $("#optbtn").html("填写基础信息");
    }
    loadProductInfoBySpid();
    //1.初始化Table
    table = $('#storestable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/gyswallet/getErpSpxxGysOptLogPageList/" + spid, //请求后台的url
        singleSelect: true, //仅允许单选
        //search: true,
        showColumns: false, //是否显示所有的列
        showRefresh: false,//是否显示刷新按钮
        pagination: true,//是否显示分页（*）
        queryParamsType: 'undefined',
        queryParams: queryParams,//传递参数（*）
        responseHandler: rspHandler,
        smartDisplay: false,
        showToggle: false,
        clickToSelect: true,
        minimumCountColumns: 2,//最少允许的列数$("input[type='checkbox']").is(':checked')
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 4,                       //每页的记录行数（*）
        pageList: [10, 20, 50, 100],        //可供选择的每页的行数（*）
        idField: "id",
        columns: [
            {
                checkbox: true
            }, {
                field: 'opttime',
                title: '提交时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'optbz',
                title: '提交备注',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'optprice',
                title: '价格',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'optsl',
                title: '数量',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'optstatus',
                title: '操作状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '<span class=\' btn-danger p30\'>失败</span>';
                    if (value) {
                        str = '<span class=\' btn-success p30\'>成功</span>';
                    }
                    return str;
                }
            }, {
                field: 'optamount',
                title: '金额',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'businesstype',
                title: '业务名称',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value == 0) {
                        str = '默认';
                    } else if (value == 1) {
                        str = '<span class=\' btn-primary p30\'>待价格审核</span>';
                    } else if (value == 3) {
                        str = '<span class=\' btn-primary p30\'>价格审核完成</span>';
                    } else if (value == 4) {
                        str = '<span class=\' btn-success p30\'>待资料审核</span>';
                    } else if (value == 5) {
                        str = '<span class=\' btn-success p30\'>资料审核完成</span>';
                    } else if (value == 9) {
                        str = '<span class=\' btn-danger p30\'>拒绝采用</span>';
                    }
                    return str;
                }
            }]
    });

    cmtable = $('#mxtable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/gyswallet/getSpmxBySpidPageList/" + spid, //请求后台的url
        singleSelect: true, //仅允许单选
        //search: true,
        showColumns: false, //是否显示所有的列
        showRefresh: false,//是否显示刷新按钮
        pagination: true,//是否显示分页（*）
        queryParamsType: 'undefined',
        queryParams: queryParams,//传递参数（*）
        responseHandler: rspHandler,
        smartDisplay: false,
        showToggle: false,
        clickToSelect: true,
        minimumCountColumns: 2,//最少允许的列数$("input[type='checkbox']").is(':checked')
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 4,                       //每页的记录行数（*）
        pageList: [10, 20, 50, 100],        //可供选择的每页的行数（*）
        idField: "id",
        columns: [
            {
                checkbox: true
            }, {
                field: 'mxcode',
                title: '条码',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'cm',
                title: '尺码',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'batchys',
                title: '颜色',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'jdsl',
                title: '数量',
                align: 'center',
                valign: 'middle'
            }]
    });
});


// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#storestable").bootstrapTable('refresh', queryParams);
}

function queryParams(params) {
    var postdata = $('#storelistForm').serializeJSON();
    postdata['pageSize'] = params.pageSize;
    postdata['page'] = params.pageNumber;
    postdata['sortname'] = params.sort; // 排序列名
    postdata['sortorder'] = params.order; // 排序方式
    return postdata;
}

//得到查询的参数
function rspHandler(res) {
    if (res) {
        return {
            "rows": res.list,
            "total": res.total
        };
    } else {
        return {
            "rows": [],
            "total": 0
        };
    }
};

$(function () {
    $(document).keydown(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#storestable").bootstrapTable('refresh', queryParams);
        }
    });
});

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};

function loadProductInfoBySpid() {
    $.ajax({
        url: pageContext + "/gyswallet/getProductAuditVoBySpid/" + spid,
        type: "POST",
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {
            if (data.success) {
                spxx = data.obj;
                $("#spmc").val(data.obj.spmc);
                $("#spcode").val(data.obj.spcode);
                $("#cgitemno").val(data.obj.cgitemno);
                $("#costprice").val(data.obj.costprice);
                $("#dw").val(data.obj.dw);
                $("#cz").val(data.obj.cz);
                $("#submitbz").val(data.obj.submitbz);
                $("#lbmc").val(data.obj.lbmc);
                $("#productbrand").val(data.obj.productbrand);
                $("#productdesc").val(data.obj.productdesc);
                var divImg = "";
                var divLink = "";
                for (var i in data.obj.imgs) {
                    var len = parseInt(i) + parseInt(1);
                    divImg += '<img src=' + data.obj.imgRequestUrl + data.obj.imgs[i].path + ' class="pic" />';
                    divLink += '<a href="' + data.obj.imgRequestUrl + data.obj.imgs[i].path + '" title="' + len + '" onclick=" return picChange(' + len + ')">' + len + '</a>';
                }
                picTotal = data.obj.imgs.length;
                $("#divImg").append(divImg);
                $("#divLink").append(divLink);
            } else {
                layer.msg(data.msg, function () {});
                return;
            }
        }
    });
}
function auditSuccess() {
    var auditmsg = $("#auditmsg").val();
    if(opttype == 0){
        priceAudit(opttype,true,auditmsg);
    }else if(opttype ==1){
        spxx["auditmsg"] = auditmsg;
        layer.open({
            type: 2,
            title: '资料审核-完善商品信息',
            shade: [0.8, '#393D49'],
            maxmin: false, //开启最大化最小化按钮
            area: ['85%', '85%'],
            content: 'product-audit-info-perfection',
            btn: ["保存", "取消"],
            btn1: function (index,layero) {
                var postData = $(layero).find("iframe")[0].contentWindow.formData();
                auditmsg = postData["auditmsg"];
                $.ajax({
                    url: pageContext + "/gysspxx/auditProductInfoBySpid",
                    data:JSON.stringify({"spid":spid,"opttype":opttype,"adopt":true,"auditmsg":auditmsg,"product":postData}),
                    type: "POST",
                    dataType: "json",
                    async: false,
                    cache: false,
                    contentType: 'application/json;charset=UTF-8',
                    success: function (data) {
                        layer.alert(data.msg);
                        if (data.success) {
                            offWindows();
                        }
                    }
                });
            }, btn2: function (index) {

            }
        });
    }else {
        layer.msg("业务类型无法识别！",function(){});
        return;
    }
}
function auditFail() {
    var auditmsg = $("#auditmsg").val();
    if(auditmsg == "" || auditmsg == null || auditmsg == undefined){
        layer.msg("拒绝原因不能为空！",function(){});
        return;
    }
    $.ajax({
        url: pageContext + "/gysspxx/auditProductInfoBySpid",
        data:JSON.stringify({"spid":spid,"opttype":opttype,"adopt":false,"auditmsg":auditmsg}),
        type: "POST",
        dataType: "json",
        async: false,
        cache: false,
        contentType: 'application/json;charset=UTF-8',
        success: function (data) {
            layer.alert(data.msg);
            if (data.success) {
                offWindows();
            }
        }
    });
}
function priceAudit(opttype,isAdopt,auditmsg) {
    $.ajax({
        url: pageContext + "/gysspxx/auditProductInfoBySpid",
        data:JSON.stringify({"spid":spid,"opttype":opttype,"adopt":isAdopt,"auditmsg":auditmsg}),
        type: "POST",
        dataType: "json",
        async: false,
        cache: false,
        contentType: 'application/json;charset=UTF-8',
        success: function (data) {
            layer.alert(data.msg);
            if (data.success) {
                offWindows();
            }
        }
    });
}

function getSelectSpxx() {
    return spxx;
}

//点击确定关闭窗口
function offWindows() {
    var index=parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}
