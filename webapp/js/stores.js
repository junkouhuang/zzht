var table = null;
$(function () {
    loadStore();
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    //1.初始化Table
    table = $('#storestable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/storeOptController/getStorePageInfo", //请求后台的url
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
                field: 'mdmc',
                title: '店名',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'mdcode',
                title: '店号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'cwcode',
                title: '财务编码',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'mdlx',
                title: '门店类型',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 0) {
                        return "加盟店";
                    } else if (value == 3) {
                        return "直营店";
                    } else {
                        return "未知";
                    }
                }
            }, {
                field: 'dz',
                title: '店长',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'walletBalance',
                title: '余额',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'wholerate',
                title: '批发折扣',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'mddz',
                title: '门店地址',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'status',
                title: '状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 1) {
                        return "营业中";
                    } else if (value == 0) {
                        return "未开业";
                    } else if (value == 4) {
                        return "已停业";
                    } else if (value == 9) {
                        return "已结业";
                    }else {
                        return "未知";
                    }
                }
            }, {
                field: 'salelx',
                title: '销售类型',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 0) {
                        return "正常";
                    } else if (value == 1) {
                        return "星级";
                    } else if (value == 2) {
                        return "五折";
                    }else {
                        return "未知";
                    }
                }
            }, {
                field: 'reconok',
                title: '支付状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return "正常";
                    } else {
                        return "不可支付";
                    }
                }
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
    $('#reconok').combobox();
    $('#status').combobox();
    $('#salelx').combobox();
}

/**
 * @Description 查询值值宝流水记录
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-01 10:18
 **/
function showWalletStremInfo() {
    layer.open({
        type: 2,
        title: "值值宝流水记录",
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: "wallet",
        btn: ['关闭'], //可以无限个按钮
        yes: function (index) {
            layer.close(index);
        }
    });
}

/**
 * @Description 查看支付流水
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018/4/4 11:03
 **/
function showPayinfoStremInfo() {
    layer.open({
        type: 2,
        title: "支付流水记录",
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: "payinfo",
        btn: ['关闭'], //可以无限个按钮
        yes: function (index) {
            layer.close(index);
        }
    });
}

function addWalletInfo() {
    var selections = $('#storestable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    layer.open({
        type: 2,
        title: "新增值值宝流水记录",
        shadeClose: true,
        shade: 0.8,
        area: ['50%', '50%'],
        content: "addWalletInfo",
        btn: ['确定', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            var trasactionamount = postData["trasactionamount"];
            var type = postData["type"];
            if (type == undefined || type == null || type == "") {
                layer.msg("类型不能为空！！", function () {
                });
                return;
            }
            if (trasactionamount == undefined || trasactionamount == null || trasactionamount == "") {
                layer.msg("金额不能为空！！", function () {
                });
                return;
            }
            $.ajax({
                url: pageContext + "/walletController/addWalletStreamInfo/" + selections[0].id,
                type: "POST",
                data: JSON.stringify(postData),
                dataType: "json",
                async: false,
                cache: false,
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                        window.location.reload();
                    }

                },
                error: function (data) {
                    if (data.status == 'undefined') {
                        return;
                    }
                    switch (data.status) {
                        case 400:
                            alert(data.status + ": " + data.responseText);
                            break;
                        case 403:
                            // 未授权异常
                            alert("系统拒绝：您没有访问权限。");
                            break;

                        case 404:
                            alert("您访问的资源不存在。");
                            break;
                        default:
                            alert("error:" + data.status);
                            break;
                    }
                }
            });
        }
    });
}

function exportWalletBalance() {
    window.location.href = pageContext + "/storeOptController/exportWalletBalance";
}

function optStoreReconokByStoreidList() {
    var selections = $('#storestable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    var list = new Array();
    for (var i = 0; i < selections.length; i++) {
        list.push(selections[i].id);
    }
    layer.open({
        content: "确定对" + selections.length + "个门店进行操作？"
        , btn: ['开启', '关闭', '取消']
        , yes: function (index, layero) {
            $.ajax({
                url: pageContext + "/storeOptController/optStoreReconokByStoreidList/1",
                contentType: 'application/json;charset=utf-8',
                type: "POST",
                dataType: "json",
                async: true,
                data: JSON.stringify(list),
                success: function (data) {
                    alert(data.msg);
                    if (data.success) {
                        LoadingDataListOrderRealItems();
                        layer.close(index);
                    }
                }
            });
        }, btn2: function (index, layero) {
            $.ajax({
                url: pageContext + "/storeOptController/optStoreReconokByStoreidList/0",
                contentType: 'application/json;charset=utf-8',
                type: "POST",
                dataType: "json",
                async: true,
                data: JSON.stringify(list),
                success: function (data) {
                    alert(data.msg);
                    if (data.success) {
                        LoadingDataListOrderRealItems();
                        layer.close(index);
                    }
                }
            });
        }, btn3: function (index, layero) {
        }
    });

}

/**
 * @Description导入值值宝余额调整后的EXCEl
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-06-12 11:25
 **/
function importWalletBalance() {

    layer.open({
        type: 2,
        title: "门店值值宝余额调整Excel选择界面",
        shadeClose: true,
        shade: 0.8,
        area: ['500px', '300px'],
        content: "file-upload",
        btn: ['确定', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            $(layero).find("iframe")[0].contentWindow.formData();
        }
    });
}

/**
 * @Description 修改门店值值宝密码
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-08-11 12:02
 **/
function updateWalletPass() {
    var selections = $('#storestable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    layer.open({
        type: 1,
        title: '请输入新的值值宝密码',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['300px', '150px'],
        btn: ["确定", "取消"],
        content: '<input placeholder="请输入6位数字" style="width: 200px;margin-left: 50px;margin-top: 10px;" maxlength="6" onkeyup="this.value=this.value.replace(/[^\\d]/g,\'\') " onafterpaste="this.value=this.value.replace(/[^\\d]/g,\'\') " type="password" name="password" id="password" class="form-control radius">',
        yes: function (index, layero) {//按钮【确定】的执行的函数
            var password = $('#password').val();
            if (password.length != 6) {
                layer.msg("用户密码必须要为6位！！", function () {
                });
                return;
            }
            $.ajax({
                url: pageContext + "/storeOptController/updateWalletPass/" + selections[0].id + "/" + password,
                type: "post",
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        LoadingDataListOrderRealItems();
                        layer.close(index);
                    }
                },
                error: function () {
                    if (data.status == 'undefined') {
                        return;
                    }
                    switch (data.status) {
                        case 403:
                            // 未授权异常
                            alert("系统拒绝：您没有访问权限。");
                            break;

                        case 404:
                            alert("您访问的资源不存在。");
                            break;
                        default:
                            alert("error:" + data.status);
                            break;
                    }
                }
            });
        }, btn2: function (index, layero) {
            layer.close(index);
        }
    });
}

$(function () {
    $(document).keydown(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#storestable").bootstrapTable('refresh', queryParams);
        }
    });
});