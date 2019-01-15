function batchListStore(title, url, w, h) {
    layer_show(title, url, w, h);
}

$(function () {
    demo();
    $("#storesearch").click(function () {
        demo();
    });

    $('.bgDiv').on('click', function () {
        hideNav();
    });
});

function demo(curr) {
    var groupname = $("#groupname").val();
    var groupcode = $("#groupcode").val();
    var minDate = $("#minTime").val();
    var maxDate = $("#maxTime").val();
    var pageSize = 10;
    $.post('/sotreGroupController/getStoreGroupPageInfo', {
        "page": curr || 1, // 当前页
        "pageSize": pageSize,
        "groupcode": groupcode,
        "groupname": groupname,
        "minDate": minDate,
        "maxDate": maxDate
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
            $(this).attr('checked', 'checked').parent().parent().siblings().children().children("input").removeAttr('checked');
            $(this).parent().parent().css('background-color', '#f5f5f5').siblings().css('background-color', '');
        });
        $('#total').html(data.total);
    });
}

function PackagData(data) {
    var content = "";
    for (var i = 0; i < data.list.length; i++) {
        content += "<tr class='text-c'>";
        content += "<td><input type='checkbox' groupcode = "+data.list[i].groupcode+" id=" + data.list[i].id + "></td>";
        content += "<td>" + data.list[i].groupcode + "</td>";
        content += "<td>" + data.list[i].groupname + "</td>";
        content += "<td>" + data.list[i].desc + "</td>";
        content += "<td>" + data.list[i].createname + "</td>";
        content += "<td>" + data.list[i].createtime + "</td>";
        content += "<td>" + (data.list[i].updatename == null ? '-' : data.list[i].updatename) + "</td>";
        content += "<td>" + (data.list[i].updatetime == null ? '-' : data.list[i].updatetime) + "</td>";
        content += "</tr>";
    }
    return content;
}

/**
 * @Description 新建门店分组
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-01 10:18
 **/
function addStoreGroup() {
    layer.open({
        type: 2,
        title: '新建门店分组',
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['600px', '400px'],
        content: 'storegroup-add?type=0',
        btn: ['保存', '关闭'], //可以无限个按钮
        yes: function (index, layero) {
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            $.ajax({
                url: pageContext + "/sotreGroupController/putStoreGroup",
                type: "PUT",
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

                }, error: function () {
                    alert("请求失败！！");
                }
            });
        }
    });
}

/**
* @Description 修改门店组基本信息
* @params
* @return
* @throws
* @author 肖亮亮
* @date 2018-04-03 13:13
**/
function updStoreGroup() {
    var flag = false;
    var groupid;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            groupid = $(this).attr("id");
            return false;
        }
    });
    if (flag) {
        layer.open({
            type: 2,
            title: '修改门店分组信息',
            shade: [0.8, '#393D49'],
            maxmin: true, //开启最大化最小化按钮
            area: ['600px', '400px'],
            content: 'storegroup-add?type=1&groupid='+groupid,
            btn: ['保存', '关闭'], //可以无限个按钮
            yes: function (index, layero) {
                var postData = $(layero).find("iframe")[0].contentWindow.formData();
                postData["id"] = groupid;
                $.ajax({
                    url: pageContext + "/sotreGroupController/updateStoreGroup",
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
                                alert(data.status+": "+data.responseText);
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
    } else {
        layer.msg("请确定你要操作的组！！", function () {});
        return;
    }
}


/* 关联门店 */
function storeGroupUnion() {
    var flag = false;
    var groupid;
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            groupid = $(this).attr("id");
            return false;
        }
    });
    if (flag) {
        layer.open({
            type: 2,
            title: '门店分组操作界面',
            shade: [0.8, '#393D49'],
            maxmin: true, //开启最大化最小化按钮
            area: ['100%', '100%'],
            content: 'storegroupunion?groupid=' + groupid,
            btn: ['关闭'], //可以无限个按钮
            yes: function (index, layero) {
                layer.close(index);
            }
        });
    } else {
        layer.msg("请确定你要操作的组！！", function () {});
        return;
    }
}

/**
 * @Description 移除分组
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-01 16:10
 **/
function removeGroupUnion() {
    var flag = false;
    var groupid;
    var groupcode = "";
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            flag = true;
            groupid = $(this).attr("id");
            groupcode = $(this).attr("groupcode");
            return false;
        }
    });
    if (confirm("你确定要删除组号为" + groupcode + "的记录吗？")) {
        $.ajax({
            url: "/sotreGroupController/removeStoreGroupByid/" + groupid,
            type: "DELETE",
            async: false,
            success: function (data) {
                layer.alert(data.msg);
                if (data.success) {
                    window.location.reload();
                }
            }
        });
    }
}
$(function () {
    $(document).keydown(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#storesearch").bootstrapTable('refresh', queryParams);
        }
    });
});