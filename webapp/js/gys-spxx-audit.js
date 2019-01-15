var table = null;
$(function () {
    loadGysxxList();
    $('#auditstatus').combobox();
    $('#existsImage').combobox();
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    //1.初始化Table
    table = $('#gys-spxx-audit-table').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/gysspxx/getAuditProductList", //请求后台的url
        singleSelect: false, //仅允许单选
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
                field: 'gysmc',
                title: '供应商名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'spcode',
                title: '款号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'batchcode',
                title: '批次号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'spmc',
                title: '品名',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'price',
                title: '价格',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'costprice',
                title: '成本价',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'dw',
                title: '单位',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'hasimage',
                title: '有图',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '<span class=\' btn-danger p30\'>NO</span>';
                    if (value) {
                        str = '<span class=\' btn-success p30\'>YES</span>';
                    }
                    return str;
                }
            }, {
                field: 'rate',
                title: '折扣',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'lbmc',
                title: '类别名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.auditstatus',
                title: '审核状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value == 0) {
                        str = '默认';
                    } else if (value == 1) {
                        str = '<span class=\' btn-primary p30\'>审核中</span>';
                    } else if (value == 5) {
                        str = '<span class=\' btn-success p30\'>审核通过</span>';
                    } else if (value == 9) {
                        str = '<span class=\' btn-danger p30\'>审核不通过</span>';
                    }
                    return str;
                }
            }, {
                field: 'erpSpxxGysOpt.priceaudit',
                title: '价格审核',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '<span class=\' btn-danger p30\'>NO</span>';
                    if (value) {
                        str = '<span class=\' btn-success p30\'>YES</span>';
                    }
                    return str;
                }
            }, {
                field: 'erpSpxxGysOpt.infoaudit',
                title: '资料审核',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '<span class=\' btn-danger p30\'>NO</span>';
                    if (value) {
                        str = '<span class=\' btn-success p30\'>YES</span>';
                    }
                    return str;
                }
            }, {
                field: 'createtime',
                title: '创建时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.submitaudittime',
                title: '提交审核时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.submitauditbz',
                title: '提交审核备注',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.priceaudittime',
                title: '价位审核时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.priceauditbz',
                title: '价位审核备注',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.infoaudittime',
                title: '资料审核时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'erpSpxxGysOpt.infoauditbz',
                title: '资料审核备注',
                align: 'center',
                valign: 'middle'
            }]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#gys-spxx-audit-table").bootstrapTable('refresh', queryParams);
}

function queryParams(params) {
    var postdata = $('#selectForm').serializeJSON();
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

$(function () {
    $(document).keydown(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#gys-spxx-audit-table").bootstrapTable('refresh', queryParams);
        }
    });
});

function auditProductInfo(opttype) {
    var selections = $('#gys-spxx-audit-table').bootstrapTable("getSelections");
    if(selections.length != 1){
        layer.msg("请选择一个商品进行审核操作！",function(){});
        return;
    }
    layer.open({
        type: 2,
        title: '',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['100%', '100%'],
        content: "product-audit-opt?spid="+selections[0].id+"&opttype="+opttype,
        btn: ['关闭'], //可以无限个按钮
        yes: function (index, layero) {
            layer.close(index);
        }, error: function (index) {
            layer.close(index);
        }
    });
}

/*浏览图片 */
function browseImage() {
    var selections = $('#gys-spxx-audit-table').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个商品进行图片浏览操作！！", function () {});
        return;
    }
    layer.open({
        type: 2,
        title: '商品审核-浏览图片',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['70%', '70%'],
        content: 'gys-spxx-audit-image?spid=' + selections[0].id
    });
}
