var table = null;
$(function () {
    $('#batchlx').combobox();
    $('#fblx').combobox();
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    laydate.render({
        elem: '#ordertime',
        range: true,
        type:'datetime'
    });
    //1.初始化Table
    table = $('#batchTable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/spBatchController/getSpbatchListPageInfo", //请求后台的url
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
                field: 'batchcode',
                title: '批次号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'batchname',
                title: '批次名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'stock',
                title: '库存',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'sales',
                title: '销售数量',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'fbsl',
                title: '发布数量',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'groupcode',
                title: '定向组号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'groupname',
                title: '定向组名',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'fbcode',
                title: '发布号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'hasphoto',
                title: '图片',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value > 0) {
                        str = '<span class=\' btn-success p30\'>有图</span>';
                    } else {
                        str = '<span class=\' btn-danger p30\'>无图</span>';
                    }
                    return str;
                }
            }, {
                field: 'fblx',
                title: '批次发布类型',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value == '0')
                        return "默认";
                    if (value == '1')
                        return "订货会";
                    return "未知";
                }
            }, {
                field: 'replenish',
                title: '会补货',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value) {
                        str = '是';
                    } else {
                        str = '否';
                    }
                    return str;
                }
            }, {
                field: 'createtime',
                title: '创建时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'fronttime',
                title: '置前时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'fbstatus',
                title: '状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value == 0) {
                        str = '';
                    } else if (value == 1) {
                        str = '<span class=\' btn-primary p30\'>发布关联</span>';
                    } else if (value == 2) {
                        str = '<span class=\' btn-warning p30\'>发布确认</span>';
                    } else if (value == 3) {
                        str = '<span class=\' btn-info p30\'>发布定向</span>';
                    } else if (value == 4) {
                        str = '<span class=\' btn-success p30\'>发布</span>';
                    } else if (value == 9) {
                        str = '<span class=\' btn-danger p30\'>下架</span>';
                    } else if (value == 10) {
                        str = '<span class=\' btn-danger p30\'>永久下架</span>';
                    }
                    return str;
                }
            }, {
                field: 'spprice',
                title: '导入价格',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'batchlbmc',
                title: '批次类别',
                align: 'center',
                valign: 'middle'
            }]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#batchTable").bootstrapTable('refresh', queryParams);
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

/**
 * @Description 删除批次,限定还未发布的批次号
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-01-30 11:26
 **/
function deleteSpbatch() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length == 1) {
        if (selections[0].fbstatus == 4) {
            layer.msg("该批次现为发布状态，请先下架该批次！！", function () {});
            return;
        }
        if (confirm("你确定要删除batchcode为" + selections[0].batchcode + "的记录吗？")) {
            $.ajax({
                url: "/spBatchController/removeSpBatchById/" + selections[0].id,
                type: "post",
                async: false,
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        LoadingDataListOrderRealItems();
                    }
                }
            });
        }
    } else if (selections.length > 1) {
        layer.msg("删除批次信息只能单个操作！！");
    } else {
        layer.msg("请勾选后再点击删除！！");
    }
}

//导入批次
function importBatch() {
    layer.prompt({"title": "请输入需要导入的批次号！！"}, function (val, index) {
        $.ajax({
            url: "/spBatchController/importBatch",
            type: "post",
            data: {"batchcode": val},
            async: false,
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    layer.close(index);
                    window.location.reload();
                }
            }
        });
    });
}
var selection;
/*设置基础信息 */
function baseInfo() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个批次进行基础信息设置！！", function () {});
        return;
    }
    selection = selections[0];
    layer.open({
        type: 2,
        title: '设置批次基础信息',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['80%', '80%'],
        content: 'batch-pc-info?batchid='+selections[0].id
    });
}
function getSelectionBatchInfo() {
    return selection;
}

//设置发布数量
function setFbsl() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个批次进行设置发布数量操作！！", function () {});
        return;
    }
    layer.open({
        type: 2,
        title: '设置发布数量',
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['894px', '530px'],
        content: 'setFbslFx?batchid=' + selections[0].id,
        btn: ['保存', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            $.ajax({
                url: pageContext + "/spBatchController/optionsSpbatchPublishTotal/" + selections[0].id,
                type: "post",
                data: JSON.stringify(postData),
                dataType: "json",
                async: false,
                cache: false,
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    console.log(data);
                    if (!data.success) {
                        layer.alert(data.msg);
                        return;
                    }
                    layer.close(index);
                    window.location.reload();
                }, error: function () {
                    alert("请求失败！！");
                }
            });
        }
    });
}

/**
 * 批次上传图片
 * @author 肖亮亮
 * @date 2018-01-13 14:01
 * @return
 **/
function upload() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个批次进行上传图片操作！！", function () {});
        return;
    }
    layer.open({
        type: 2,
        title: '批次-上传图片',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['70%', '70%'],
        content: 'batch-fb-upload?batchid=' + selections[0].id,
    });
}


/*浏览图片 */
function browseImage() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个批次进行图片浏览操作！！", function () {});
        return;
    }
    layer.open({
        type: 2,
        title: '批次-浏览图片',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['70%', '70%'],
        content: 'spbatch-image?batchid=' + selections[0].id,
    });
}


/* 关联门店 */
function batchStore() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行关联门店操作！！", function () {});
        return;
    }
    var batchidList = new Array();
    for (var i in selections) {
        batchidList.push(selections[i].id);
    }
    layer.open({
        type: 2,
        title: "批次定向门店",
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: 'batch-fb-storegroup',
        btn: ['确认关联', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            if (postData == '' || postData == null || postData == undefined) {
                layer.msg("请选择要关联的门店分组！！", function () {});
                return;
            }
            $.ajax({
                url: "/batchFbStoresController/saveRelevanceStoreGroup/" + postData,
                data: JSON.stringify(batchidList),
                type: "post",
                dataType: "json",
                async: false,
                cache: false,
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                    }
                }
            });
        }
    });
}


/*关联发布号*/
function batchfb() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行关联发布号操作！！", function () {});
        return;
    }
    var batchidList = new Array();
    for(var i in selections){
        if(selections[i].fbcode != "" && selections[i].fbcode != null && selections[i].fbcode != undefined){
            layer.msg("批次："+selections[i].batchcode+",已经有关联过发布号了，不能重复关联！！",function(){});
            return;
        }
        batchidList.push(selections[i].id);
    }
    layer.open({
        type: 2,
        title: "批次关联发布号",
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: 'batch-fb-relevance',
        btn: ['确认关联', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            if (postData == '' || postData == null || postData == undefined) {
                layer.msg("请选择要关联的发布号！！", function () {});
                return;
            }
            $.ajax({
                url: "/batchListController/addBatchList/" + postData,
                data: JSON.stringify(batchidList),
                type: "post",
                dataType: "json",
                async: false,
                cache: false,
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                    }
                }
            });
        }
    });
}


/**
 * @Description 移除与发布号的关联
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-07 12:27
 **/
function clearFbRelevance() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行移除发布号关联操作！！", function () {});
        return;
    }
    var batchidList = new Array();
    for(var i in selections){
        batchidList.push(selections[i].id);
    }
    if (confirm("你确定要移除"+batchidList.length+"个批次与发布号的关联吗？")) {
        $.ajax({
            url: "/batchListController/clearFbRelevance",
            data: JSON.stringify(batchidList),
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            contentType: 'application/json;charset=UTF-8',
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    layer.close(index);
                }
            }
        });
    }
}


/**
 * @Description 下架指定批次
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-01-30 12:41
 **/
function offSpbatch() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行下架操作！！", function () {});
        return;
    }
    if (selections[0].fbstatus === 10 ) {
        layer.msg("该批次已经是永久下架状态！！");
        return;
    }
    if (selections[0].fbstatus < 2) {
        layer.msg("该批次还未关联发布号，不需要下架！！");
        return;
    }
    layer.open({
        type: 1,
        title: '请填写批次下架的原因？',
        area: ['450px', '200px'],
        shade: [0.8, '#393D49'],
        btn: ["永久下架","正常下架","取消"],
        content: '<form id="importBatchInfo" class="p10">' +
        '<table align="center" style="margin-top: 10px;">' +
        '<tr><td>下架原因：</td><td><input placeholder="请输入下架原因" id="offbz" type="text" class="form-control"/></td></tr>' +
        '</table>' +
        '</form>',
        btn1: function (index) {
            var val = $("#offbz").val();
            if(val == null || val == undefined || val == ""){
                layer.msg("请输入下架原因！！",function(){});
                return;
            }else{
                $.ajax({
                    url: "/spBatchController/withdrawSpbatchByid/" + selections[0].id+"/10",
                    data:{"bz":val},
                    type: "post",
                    async: false,
                    success: function (data) {
                        layer.alert(data.msg);
                        if (data.success) {
                            layer.close(index);
                            demo();
                        }
                    }
                });
            }
        }, btn2: function (index) {
            var val = $("#offbz").val();
            if(val == null || val == undefined || val == ""){
                layer.msg("请输入下架原因！！",function(){});
                return;
            }else{
                $.ajax({
                    url: "/spBatchController/withdrawSpbatchByid/" + selections[0].id+"/9",
                    data:{"bz":val},
                    type: "post",
                    async: false,
                    success: function (data) {
                        layer.alert(data.msg);
                        if (data.success) {
                            layer.close(index);
                            demo();
                        }
                    }
                });
            }
        }, btn4: function (index) {
            layer.close(index);
        }
    });
}

/**
* @Description 批次永久下架
* @params
* @return
* @throws
* @author 肖亮亮
* @date 2018-09-27 11:52
**/
function offSpbatchFinally() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行下架操作！！", function () {});
        return;
    }
    if (selections[0].fbstatus === 10 ) {
        layer.msg("该批次已经是永久下架状态 ！！");
        return;
    }
    layer.prompt({"title": "请输入批次下架的原因！！"}, function (val, index) {
        if(val == null || val == undefined || val == ""){
            layer.msg("请输入下架原因！！",function(){});
            return;
        }else{
            $.ajax({
                url: "/spBatchController/finallyWithdrawSpBatchById/" + selections[0].id,
                data:{"bz":val},
                type: "post",
                async: false,
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        LoadingDataListOrderRealItems();
                        layer.close(index);
                    }
                }
            });
        }
    });
}


function upSpbatch() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行上架操作！！", function () {});
        return;
    }
    var idlist = new Array();
    for(var i in selections){
        if(selections[i].fbstatus === 4){
            layer.msg("批次："+selections[i].batchcode+"是发布状态，无需重复上架！！",function(){});
            return;
        }
        idlist.push(selections[i].id);
    }
    if (confirm("你确定要上架这" + idlist.length + "个批次吗？")) {
        $.ajax({
            url: "/spBatchController/groundingSpbatchByidList",
            data:JSON.stringify(idlist),
            contentType: 'application/json;charset=UTF-8',
            type: "post",
            async: false,
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    demo();
                }
            }
        });
    }
}


/**
 * @Description 设置批次置前操作
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-25 10:22
 **/
function openfront() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行批次置前操作！！", function () {});
        return;
    }
    var batchidList = new Array();
    for(var i in selections){
        batchidList.push(selections[i].id);
    }
    if (confirm("你确定要置前"+selections.length+"个批次吗？")) {
        $.ajax({
            url: "/spBatchController/openfront",
            data: JSON.stringify(batchidList),
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            contentType: 'application/json;charset=UTF-8',
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    LoadingDataListOrderRealItems();
                }
            }
        });
    }
}


/**
 * @Description 撤销批次置前操作
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-25 10:22
 **/
function revokefront() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("请至少选择一个批次进行批次撤销置前操作！！", function () {});
        return;
    }
    var batchidList = new Array();
    for(var i in selections){
        batchidList.push(selections[i].id);
    }
    if (confirm("你确定要撤销"+batchidList.length+"个批次的置前吗？")) {
        $.ajax({
            url: "/spBatchController/revokefront",
            data: JSON.stringify(batchidList),
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            contentType: 'application/json;charset=UTF-8',
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    layer.close(index);
                }
            }
        });
    }
}


/**
 * @Description同步批次尺码信息
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-05-07 16:12
 **/
function syncBatchCmInfo() {
    var selections = $('#batchTable').bootstrapTable("getSelections");
    if (selections.length <= 0) {
        layer.msg("该操作只支持一个批次进行尺码同步操作！！", function () {});
        return;
    }
    $.ajax({
        url: "/spBatchController/syncBatchCmInfo/" + selections[0].id,
        type: "post",
        dataType: "json",
        async: false,
        cache: false,
        contentType: 'application/json;charset=UTF-8',
        success: function (data) {
            layer.alert(data.msg);
        }
    });
}
//导出明细
function exportSpbatchOrderInfoToExcel() {
    var batchcode = $("#batchcode").val();
    var batchname = $("#batchname").val();
    var fbcode = $("#fbcode").val();
    var groupname = $("#groupname").val();
    var groupcode = $("#groupcode").val();
    var time = $("#time").val();
    var batchlx = $("#batchlx").val();
    var fblx = $("#fblx").val();
    var ordertime = $("#ordertime").val();
    window.location.href = pageContext + "/spBatchController/exportSpbatchOrderInfoToExcel?"
        + "batchcode=" + batchcode
        + "&batchname=" + batchname
        + "&fbcode=" + fbcode
        + "&groupname=" + groupname
        + "&groupcode=" + groupcode
        + "&time=" + time
        + "&ordertime=" + ordertime
        + "&fblx=" + fblx
        + "&batchlx=" + batchlx;

}
$(function () {
    $(document).keydown(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#batchTable").bootstrapTable('refresh', queryParams);
        }
    });
});