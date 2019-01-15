function batchListStore(title, url, w, h) {
    layer_show(title, url, w, h);
}

/* 关联门店 */
function batchStore(title, url, w, h) {
    var batchidList = new Array();
    var flag = false;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            batchidList.push($(this).attr("id"));
        }
    });
    if (flag) {
        layer.open({
            type: 2,
            title: title,
            shadeClose: true,
            shade: 0.8,
            area: ['100%', '100%'],
            content: url,
            btn: ['确认关联', '关闭'], //可以无限个按钮
            yes: function (index, layero) {
                var postData = $(layero).find("iframe")[0].contentWindow.formData();
                if (postData == '' || postData == null || postData == undefined) {
                    layer.msg("请选择要关联的门店分组！！", function () {
                    });
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
    } else {
        layer.alert("请至少选择一个批次,再关联门店！");
    }
}


/*关联发布号*/
function batchfb(title, url, w, h) {
    var batchidList = new Array();
    var flag = false;
    var isfb = false;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            var fbstatus = $(this).attr("fbstatus");
            if (fbstatus == 4) {
                isfb = true;
            }
            flag = true;
            batchidList.push($(this).attr("id"));
        }
    });
    if (isfb) {
        layer.msg("有批次已关联发布号，不能多个处理！！", function () {
        });
        return;
    }
    if (flag) {
        layer.open({
            type: 2,
            title: title,
            shadeClose: true,
            shade: 0.8,
            area: ['100%', '100%'],
            content: url,
            btn: ['确认关联', '关闭'], //可以无限个按钮
            yes: function (index, layero) {
                var postData = $(layero).find("iframe")[0].contentWindow.formData();
                if (postData == '' || postData == null || postData == undefined) {
                    layer.msg("请选择要关联的发布号！！", function () {
                    });
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
    } else {
        layer.alert("请至少选择一个批次,再关联发布号！");
    }
}

/**
 * 批次上传图片
 * @author 肖亮亮
 * @date 2018-01-13 14:01
 * @return
 **/
function upload(title, url, w, h) {
    var obj = null;
    var len = 0;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            obj = $(this);
            len = len + 1;
        }
    });
    if (len != 1) {
        layer.msg("请选择一个批次进行上传图片操作！！", function () {
        });
        return;
    }
    if (obj != null) {
        layer_show(title, url, w, h);
    } else {
        layer.alert("请勾选批次后,再点击上传图片!");
    }
}

$(function () {
    demo();
    $("#batchsearch").click(function () {
        demo();
    });

    $('.bgDiv').on('click', function () {
        hideNav();
    });
});

function demo(curr) {
    var pageSize = 10;
    var batchcode = $("#batchcode").val();
    var batchname = $("#batchname").val();
    var fbcode = $("#fbcode").val();
    var groupname = $("#groupname").val();
    var groupcode = $("#groupcode").val();
    var minDate = $("#minTime").val();
    var maxDate = $("#maxTime").val();
    var batchlx = $("#batchlx option:selected").val();
    $.post('/spBatchController/getSpbatchListPageInfo', {
        "page": curr || 1, // 当前页有
        "pageSize": pageSize,
        "batchcode": batchcode,
        "batchname": batchname,
        "minDate": minDate,
        "maxDate": maxDate,
        "groupcode": groupcode,
        "groupname": groupname,
        "fbcode": fbcode,
        "batchlx": batchlx
    }, function (data) {
        laypage({
            cont: 'page1', // 容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div> 按钮容器
            pages: data.pages, // 通过后台拿到的总页数
            curr: curr || 1,
            skip: true, // 是否开启跳页
            first: '首页', // 若不显示，设置false即可
            last: '尾页', // 若不显示，设置false即可
            prev: '<', // 若不显示，设置false即可
            next: '>', // 若不显示，设置false即可
            jump: function (obj, first) { // 触发分页后的回调
                if (!first) { // 点击跳页触发函数自身，并传递当前页：obj.curr
                    demo(obj.curr);
                }
            }
        });
        $('#tbody').html(PackagData(data)); // 内容容器
        $("input[type=checkbox]").bind('click', function () {
            if ($(this).is(":checked")) {//判断是不是选中的，是选中的就上色，不是就为空白
                $(this).parent().parent().css('background-color', '#f5f5f5');
            } else {
                $(this).parent().parent().css('background-color', '');
            }
        });
        $('#total').html(data.total);
    });
}

function PackagData(data) {
    var content = "";
    for (var i = 0; i < data.list.length; i++) {
        content += "<tr class='text-c'>";
        content += "<td><input type='checkbox' fbstatus=" + data.list[i].fbstatus + " batchcode=" + data.list[i].batchcode + " id=" + data.list[i].id + "></td>";
        content += "<td class='pkgtype' style='display:none'>" + data.list[i].pkgtype + "</td>";
        content += "<td>" + data.list[i].batchcode + "</td>";
        content += "<td>" + data.list[i].batchname + "</td>";
        content += "<td>" + data.list[i].stock + "</td>";
        content += "<td>" + (data.list[i].sales == null ? 0 : data.list[i].sales) + "</td>";
        content += "<td>" + (data.list[i].fbsl == null ? 0 : data.list[i].fbsl) + "</td>";
        content += "<td>" + (data.list[i].groupcode == null ? '' : data.list[i].groupcode) + "</td>";
        content += "<td>" + (data.list[i].groupname == null ? '' : data.list[i].groupname) + "</td>";
        content += "<td>" + (data.list[i].fbcode == null ? '' : data.list[i].fbcode) + "</td>";
        if (data.list[i].hasphoto > 0) {
            content += "<td class='td-status'><span class='label label-success radius' hasphoto=" + data.list[i].hasphoto + ">有图片</span></td>";
        } else {
            content += "<td class='td-status'><span class='label btn-defaultradius' hasphoto=" + data.list[i].hasphoto + ">没有图片</span></td>";
        }
        content += "<td>" + (data.list[i].createtime == null ? '' : data.list[i].createtime) + "</td>";
        content += "<td>" + (data.list[i].fronttime == null ? '' : data.list[i].fronttime) + "</td>";
        if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == "默认") {
            content += "<td class='td-status'><span class='label label-warning  radius ' currentStatus =" + data.list[i].fbstatus + " >" + Conversion(data.list[i].fbstatus, SpBatch_fbstatus) + "</span></td>";
        } else if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == "发布关联") {
            content += "<td class='td-status'><span class='label label-primary  radius ' currentStatus =" + data.list[i].fbstatus + " >" + Conversion(data.list[i].fbstatus, SpBatch_fbstatus) + "</span></td>";
        } else if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == "发布确认") {
            content += "<td class='td-status'><span class='label label-primary  radius ' currentStatus =" + data.list[i].fbstatus + " >" + Conversion(data.list[i].fbstatus, SpBatch_fbstatus) + "</span></td>";
        } else if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == "发布") {
            content += "<td class='td-status'><span class='label label-success radius ' currentStatus =" + data.list[i].fbstatus + " >" + Conversion(data.list[i].fbstatus, SpBatch_fbstatus) + "</span></td>";
        } else if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == "发布定向") {
            content += "<td class='td-status'><span class='label btn-info radius ' currentStatus =" + data.list[i].fbstatus + " >" + Conversion(data.list[i].fbstatus, SpBatch_fbstatus) + "</span></td>";
        } else if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == "下架") {
            content += "<td class='td-status'><span class='label btn-danger radius ' currentStatus =" + data.list[i].fbstatus + " >" + Conversion(data.list[i].fbstatus, SpBatch_fbstatus) + "</span></td>";
        } else if (Conversion(data.list[i].fbstatus, SpBatch_fbstatus) == undefined) {
            content += "<td class='td-status'><span class='label btn-default radius ' currentStatus =" + data.list[i].fbstatus + " ></span></td>";
        }
        content += "</tr>";
    }
    return content;
}

/*浏览图片 */
function browseImage(title, url, w, h) {
    var len = 0;
    var obj = null;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            obj = $(this);
            len = len + 1;
        }
    });
    if (len != 1) {
        layer.msg("请选择一个批次进行图片浏览");
        return;
    }
    if (obj != null) {
        var canBrowse = obj.parent().parent().children().children("span").attr("hasphoto");
        if (canBrowse == "true") {
            layer_show(title, url, w, h);
        } else {
            layer.alert("选中的没有图片，无法浏览！");
        }
    } else {
        layer.alert("请勾选后再点击浏览图片");
    }
}

//设置发布数量
function setFbsl() {
    var len = 0;
    var batchid;
    $("input[type=checkbox]").each(function () {
        if ($(this).is(":checked")) {
            len = len + 1;
            batchid = $(this).attr("id");
        }
    });
    if (len != 1) {
        layer.msg("请选择一个批次进行设置发布数量操作！！");
        return;
    }
    layer.open({
        type: 2,
        title: '设置发布数量',
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['894px', '530px'],
        content: 'setFbslFx',
        btn: ['保存', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            $.ajax({
                url: pageContext + "/spBatchController/optionsSpbatchPublishTotal/" + batchid,
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

//生成批次号
function buildSpBatchCode() {
    $.ajax({
        url: "/spBatchController/obtainSpBatchCode",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.success) {
                $(".batchcode").val(data.obj);
                thisSpBatchCode = data.obj;
            } else {
                $(".batchcode").val(data.msg);
            }
        }
    });
}

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

function brandAdd(title, url, w, h) {
    layer_show(title, url, w, h);
}

/*基础信息 */
function baseInfo(title, url, w, h) {
    var len = 0;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            len = len + 1;
        }
    });
    if (len == 1) {
        layer_show(title, url, w, h);
    } else if (len > 1) {
        layer.msg("设置基础信息只能单个操作！！");
    } else {
        layer.msg("请勾选后再点击基础信息！！");
    }
}

/**
 * @Description 删除批次,限定还未发布的批次号
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-01-30 11:26
 **/
function deleteSpbatch() {
    var len = 0;
    var batchid;
    var batchcode;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            len = len + 1;
            batchid = $(this).attr("id");
            batchcode = $(this).attr("batchcode");
        }
    });
    if (len == 1) {
        if (confirm("你确定要删除batchcode为" + batchcode + "的记录吗？")) {
            $.ajax({
                url: "/spBatchController/removeSpBatchById/" + batchid,
                type: "post",
                async: false,
                success: function (data) {
                    layer.alert(data.msg);
                    if (data.success) {
                        window.location.reload();
                    }
                }
            });
        }
    } else if (len > 1) {
        layer.msg("删除批次信息只能单个操作！！");
    } else {
        layer.msg("请勾选后再点击删除！！");
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
    var fbstatus = null;
    var batchid = null;
    var batchcode = '';
    var len = 0;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            fbstatus = $(this).attr("fbstatus");
            batchid = $(this).attr("id");
            batchcode = $(this).attr("batchcode");
            len = len + 1;
        }
    });
    if (len != 1) {
        layer.msg("请选择一个批次进行下架操作！！");
        return;
    }
    if (fbstatus == 9) {
        layer.msg("该批次已经是下架状态！！");
        return;
    }
    if (fbstatus < 2) {
        layer.msg("该批次还未关联发布号，不需要下架！！");
        return;
    }
    layer.prompt({"title": "请输入批次下架的原因！！"}, function (val, index) {
       if(val == null || val == undefined || val == ""){
           layer.msg("请输入下架原因！！",function(){});
           return;
       }else{
           $.ajax({
               url: "/spBatchController/withdrawSpbatchByid/" + batchid,
               data:{"bz":val},
               type: "post",
               async: false,
               success: function (data) {
                   layer.alert(data.msg);
                   if (data.success) {
                       demo();
                       layer.close(index);
                   }
               }
           });
       }
    });

}

function upSpbatch() {
    var idlist = new Array();
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            idlist.push($(this).attr("id"));
        }
    });
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
 * @Description 撤销导入的批次信息,只能是默认状态的批次才能够撤销
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-08 13:39
 **/
function revokeImportBatchInfo() {
    var fbstatus = null;
    var batchid = null;
    var batchcode = '';
    var len = 0;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            fbstatus = $(this).attr("fbstatus");
            batchid = $(this).attr("id");
            batchcode = $(this).attr("batchcode");
            len = len + 1;
        }
    });
    if (len != 1) {
        layer.msg("请选择一个批次进行下架操作！！");
        return;
    }
    if (fbstatus != 0) {
        layer.msg("只有批次的发布状态为默认的才能撤销！！");
        return;
    }
    if (confirm("你确定要下架batchcode为" + batchcode + "的记录吗？")) {
        $.ajax({
            url: "/spBatchController/revokeImportBatchInfo/" + batchid,
            type: "post",
            async: false,
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    layer.close(index);
                    window.location.reload();
                }
            }
        });
    }
}

/**
 * @Description 新增批次信息
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-01-31 13:11
 **/
function addSpbatch(title, url, w, h) {
    layer_show(title, url, w, h);
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
    var batchidList = new Array();
    var flag = false;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            batchidList.push($(this).attr("id"));
        }
    });
    if (flag) {
        if (confirm("你确定要移除这些批次与发布号的关联吗？")) {
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
    } else {
        layer.alert("请至少选择一个批次,移除与发布号的关联！");
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
    var batchidList = new Array();
    var flag = false;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            batchidList.push($(this).attr("id"));
        }
    });
    if (flag) {
        if (confirm("你确定要置前这些批次吗？")) {
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
                        layer.close(index);
                    }
                }
            });
        }
    } else {
        layer.alert("请至少选择一个批次进行置前操作！！");
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
    var batchidList = new Array();
    var flag = false;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            batchidList.push($(this).attr("id"));
        }
    });
    if (flag) {
        if (confirm("你确定要撤销这些批次的置前吗？")) {
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
    } else {
        layer.alert("请至少选择一个批次进行撤销置前操作！！");
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
    var batchid = null;
    var len = 0;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            batchid = $(this).attr("id");
            len = len + 1;
        }
    });
    if (len != 1) {
        layer.msg("该操作只支持一个批次进行尺码导入操作！！", function () {
        });
        return;
    }
    $.ajax({
        url: "/spBatchController/syncBatchCmInfo/" + batchid,
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

function exportSpbatchOrderInfoToExcel() {
    var batchcode = $("#batchcode").val();
    var batchname = $("#batchname").val();
    var fbcode = $("#fbcode").val();
    var groupname = $("#groupname").val();
    var groupcode = $("#groupcode").val();
    var minDate = $("#minTime").val();
    var maxDate = $("#maxTime").val();
    var batchlx = $("#batchlx option:selected").val();
    window.location.href = pageContext + "/spBatchController/exportSpbatchOrderInfoToExcel?batchcode=" + batchcode
        + "&batchname=" + batchname
        + "&fbcode=" + fbcode
        + "&groupname=" + groupname
        + "&groupcode=" + groupcode
        + "&minDate=" + minDate
        + "&maxDate=" + maxDate
        + "&batchlx=" + batchlx;

}