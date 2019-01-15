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

function formData() {
    var groupid = '';
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            groupid = $(this).attr("id");
            return false;
        }
    });
    return groupid;
}