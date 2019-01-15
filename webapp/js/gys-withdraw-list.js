var table = null;
$(function () {
    $('#status').combobox();
    loadGysxxList();
    // 执行一个laydate实例
    laydate.render({
        elem: '#trasactionTimeStr',
        range: true
    });
    laydate.render({
        elem: '#createTimeStr',
        range: true
    });
    //1.初始化Table
    table = $('#gys-withdraw-table').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/gyswallet/getGysWalletRecordPageList", //请求后台的url
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
                field: 'username',
                title: '用户名',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'gysmc',
                title: '供应商名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'createTime',
                title: '提现发起时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'trasactionTime',
                title: '提现通过时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'trasactionAmount',
                title: '提现金额',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'status',
                title: '交易状态',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'bz',
                title: '备注',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'recordcode',
                title: '提现卡号',
                align: 'center',
                valign: 'middle'
            }
        ]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#gys-withdraw-table").bootstrapTable('refresh', queryParams);
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
            $("#gys-withdraw-table").bootstrapTable('refresh', queryParams);
        }
    });
});

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

function withDrawAuditByidList() {
    var selections = $('#gys-withdraw-table').bootstrapTable("getSelections");
    if(selections.length <= 0){
        layer.msg("请至少选择一条申请记录进行审核操作!",function(){});
        return;
    }
    var idlist = new Array();
    for(var i in selections){
        if(selections[i].status != 0){
            layer.msg("有记录状态不为待审核！",function(){});
            return;
        }
        idlist.push(selections[i].id);
    }

    layer.open({
        type: 1,
        title: '供应商商品审核界面，您此时正在对'+spidList.length+"个商品进行审核操作",
        area: ['450px', '200px'],
        shade: [0.8, '#393D49'],
        btn: ["审核通过","拒绝通过","取消"],
        content: '<form id="importBatchInfo" class="p10">' +
        '<table align="center" style="margin-top: 10px;">' +
        '<tr><td>审核备注：</td><td><input placeholder="请填写审核意见" id="auditbz" type="text" class="form-control"/></td></tr>' +
        '</table>' +
        '</form>',
        btn1: function (index) {
            var auditbz = $("#auditbz").val();
            $.ajax({
                url: pageContext + "/gysspxx/auditProductInfoBySpidList?auditbz="+auditbz+"&status=5",
                data:JSON.stringify(idlist),
                contentType:'application/json;charset=utf-8',
                type: "post",
                async: false,
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                        LoadingDataListOrderRealItems();
                    }
                }
            });
        }, btn2: function (index) {
            var auditbz = $("#auditbz").val();
            if(auditbz == null || auditbz == undefined || auditbz == ""){
                layer.msg("拒绝通过需填写审核意见！！",function(){});
                return;
            }else{
                $.ajax({
                    url: pageContext + "/gysspxx/auditProductInfoBySpidList?auditbz="+auditbz+"&status=9",
                    data:JSON.stringify(idlist),
                    contentType:'application/json;charset=utf-8',
                    type: "post",
                    async: false,
                    success: function (data) {
                        layer.alert(data.msg);
                        if (data.success) {
                            layer.close(index);
                            LoadingDataListOrderRealItems();
                        }
                    }
                });
            }
        }, btn4: function (index) {
            layer.close(index);
        }
    });
}