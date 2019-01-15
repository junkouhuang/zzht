var table = null;
$(function () {
    $('#mdlx').combobox();
    getJmStoreWalletAmount();
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    //1.初始化Table
    table = $('#jmstore-walletinfo-table').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/walletController/getJmStoreWalletInfo", //请求后台的url
        singleSelect: false, //仅允许单选
        //search: true,
        showFooter: true,
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
        pageList: [10, 100, 500, 1000],        //可供选择的每页的行数（*）
        idField: "id",
        columns: [
            {
                checkbox: true
            }, {
                field: 'time',
                title: '日期',
                align: 'center',
                valign: 'middle',
                footerFormatter: function (value) {
                    return "汇总：";
                }
            }, {
                field: 'waterAmount',
                title: '当日流水金额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.waterAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }, {
                field: 'orderPayAmount',
                title: '订单支付金额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.orderPayAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }, {
                field: 'fhorderPayAmount',
                title: '货单支付金额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.fhorderPayAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }, {
                field: 'cwWithholdAmount',
                title: '财务扣除金额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.cwWithholdAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }, {
                field: 'cwRechargeAmount',
                title: '财务充值金额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.cwRechargeAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }, {
                field: 'revokeOrderAmount',
                title: '订单撤单返额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.revokeOrderAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }, {
                field: 'refundOrderAmount',
                title: '订单退款返额',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>' + value.toFixed(2) + '</span>';
                    } else if (value < 0) {
                        str = '<span class=\' btn-danger p30\'>' + value.toFixed(2) + '</span>';
                    } else {
                        str = '0';
                    }
                    return str;
                },
                footerFormatter: function (value) {
                    var amount = 0;
                    $.each(value, function (index, item) {
                        amount += item.refundOrderAmount;
                    });
                    var str = '';
                    if (amount > 0) {
                        str = '<span class=\' btn-success p30\'>' + amount.toFixed(2) + '</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>' + amount.toFixed(2) + '</span>';
                    }
                    return str;
                }
            }]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#jmstore-walletinfo-table").bootstrapTable('refresh', queryParams);
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

function getJmStoreWalletAmount() {
    $.ajax({
        url: "/walletController/getJmStoreWalletAmount",
        type: "post",
        async: false,
        success: function (data) {
            if (data.success) {
                $("#jmamount").val("加盟总额：" + data.obj[0].amount);
                $("#zyamount").val("直营总额：" + data.obj[1].amount);
            } else {
                layer.alert(data.msg);
            }
        }
    });
}

function exportJmStoreWalletAmountExcel() {
    var mdlx = $("#mdlx").val();
    var time = $("#time").val();
    window.location.href = pageContext + "/walletController/exportJmStoreWalletAmountExcel?mdlx=" + mdlx + "&time=" + time;
}