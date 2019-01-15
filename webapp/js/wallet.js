var table = null;
$(function () {
    loadStore();
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    $('#trasactionType').combobox();
    //1.初始化Table
    table = $('#wallettrarecordstable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/storeOptController/getWalletTrarecordPage", //请求后台的url
        singleSelect: true, //仅允许单选
        //search: true,
        showColumns: true, //是否显示所有的列
        showRefresh: true,//是否显示刷新按钮
        pagination: true,//是否显示分页（*）
        queryParamsType: 'undefined',
        queryParams: queryParams,//传递参数（*）
        responseHandler: rspHandler,
        smartDisplay: false,
        showToggle: false,
        clickToSelect: true,
        minimumCountColumns: 2,//最少允许的列数$("input[type='checkbox']").is(':checked')
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 20, 50, 100],        //可供选择的每页的行数（*）
        idField: "id",
        columns: [
            {
                checkbox: true
            }, {
                field: 'mdcode',
                title: '店号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'mdmc',
                title: '店名',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'trasactiontype',
                title: '交易类型',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 1) {
                        return "充值";
                    } else if (value == 2) {
                        return "付款";
                    } else if (value == 3) {
                        return "订单批次撤单";
                    } else if (value == 4) {
                        return "订单撤单";
                    } else if (value == 5) {
                        return "退货";
                    } else if (value == 6) {
                        return "财务操作";
                    } else {
                        return "未知";
                    }
                }
            }, {
                field: 'createtime',
                title: '交易时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'payinfocode',
                title: '支付单号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'trasactionamount',
                title: '交易金额',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'status',
                title: '状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 6) {
                        return "操作成功";
                    } else {
                        return "操作失败";
                    }
                }
            }, {
                field: 'bz',
                title: '备注',
                align: 'center',
                valign: 'middle'
            }]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#wallettrarecordstable").bootstrapTable('refresh', queryParams);
}

function queryParams(params) {
    var postdata = $('#walletlistFrom').serializeJSON();
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

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};

/**
 * @Description 导出值值宝交易流水
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-04-03 10:52
 **/
function importWalletInfo() {
    var sid = $("#storeid").val();
    var payinfocode = $("#payinfocode").val();
    var time = $("#time").val();
    var trasactionType = $("#trasactionType").val();
    layer.confirm('确认导出么？当前查询条件将会应用上哦。。', function (index) {
        window.location.href = pageContext + "/storeOptController/importWalletInfo?payinfocode=" + payinfocode + "&time=" + time + "&trasactionType=" + trasactionType + "&storeid=" + sid;
        layer.close(index);
    })
}


// 加载门店
function loadStore() {
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
    $('#mdlx').combobox();
}
