function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};
$(function () {
    //加载门店分组
    $.ajax({
        url: "/sotreGroupController/getStoreGroupList",
        type: "GET",
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {
            var mdContent = "";
            for (var i = 0; i < data.length; i++) {
                mdContent += "<option value=" + data[i].groupcode + ">" + data[i].groupname + "</option>";
            }
            $('#leftgroup').append(mdContent);
            $('#rightgroup').append(mdContent);
        }
    });
    //加载左边门店的数据
    loadLeftStore();
    //获取选中数量
    selectAllowLeft();
    //加载所有的省份
    $.ajax({
        url: "/storeOptController/selectProviceList",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true,//请求是否异步，默认为异步，这也是ajax重要特性
        type: "POST",   //请求方式
        success: function (data) {
            loadData(data);
        }
    });
    $("input[type='checkbox']").each(function () {
        if ($(this).is(':checked')) {
            $(this).siblings("input[type='checkbox']").atrr("checked", false);
        }
    })
});
//加载左门店数据
function loadLeftStore() {
    var mdmc = $("#leftmdmc").val();   //门店名称(输入框获得)
    var mdcode = $("#leftmdcode").val(); //门店号(输入框获得)
    var peidBuf = "";
    $("input[name='province']").each(function () {
        if ($(this).is(':checked')) {
            peidBuf +=$(this).val()+",";
        }
    })
    var mdlx = $("input[name='leftmdlx']:checked").val();
    var groupid = getQueryString("groupid");
    var leftGroupCode = $("#lgroup").val();
    $.ajax({
        url: "/sotreGroupController/getStoreGroupBygroupid",    //请求的url地址
        data:{"groupid":groupid,"mdmc":mdmc,"mdcode":mdcode,"peidBuf":peidBuf,"mdlx":mdlx,"leftGroupCode":leftGroupCode},
        dataType: "json",   //返回格式为json
        async: false,//请求是否异步，默认为异步，这也是ajax重要特性
        type: "GET",   //请求方式
        success: function (data) {
            $("#store1").html("");
            $("#store1").append(LeftPackagData(data));
        }
    });
}

// 加载数据
function loadData(data) {
    var content = "";
    // 遍历数据
    $.each(data, function (index, item) {
        content += packagingData(item);
    });
    $("#provinces").html(content);
    //加载右门店数据
    loadRigthStore();
}

// 组装数据
function packagingData(data) {
    var content = "" +
        "<span class='radio-box' style='width:150px;display: " +
        "inline-block;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;'>"
        + "<input type='checkbox' name='province' id=" + data.id + " value=" + data.id + " class='posit3'>" +
        "<label  for=" + data.id + " class='ml-5'>" + data.name + "</label>" + "</span>";
    return content;
}

//加载左门店的数据
function LeftPackagData(data) {
    $(".selectNumberleft").text("已选择：" + data.length);
    var content = "";
    for (var i = 0; i < data.length; i++) {
        if (data[i] != null) {
            content += "<div class='store'><ul>";
            content += "<li class='checkbox'><input type='checkbox'   id=" + data[i].id + " checked='checked'></li>";
            content += "<li id=" + data[i].id + ">" + data[i].mdcode + "</li>";
            content += "<li class='name'>" + data[i].mdmc + "</li>";
            content += "<li>" + (data[i].pename ==null?'-':data[i].pename )+ "</li>";
            content += "<li  class='td-status mold'><span class='label label-success radius ' currentStatus =" + data[i].mdlx + ">" + Conversion(data[i].mdlx, store_type) + "</span></li>";
            content += "</ul></div>";
        }
    }
    return content;
}


/*门店搜索*/
$("#searchMD").click(function () {
    loadRigthStore();
});

//加载右门店
function loadRigthStore(groupId) {
    var mdmc = $("#mdmc").val();   //门店名称(输入框获得)
    var mdcode = $("#mdcode").val(); //门店号(输入框获得)
    var peidBuf = "";
    $("input[name='province']").each(function () {
        if ($(this).is(':checked')) {
            peidBuf +=$(this).val()+",";
        }
    })
    var mdlx = $("input[name='mdlx']:checked").val();
    var groupcode = $("#rgroup").val();
    $.ajax({
        url: "/storeOptController/getStoreListAll",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true,//请求是否异步，默认为异步，这也是ajax重要特性
        data: {"mdmc": mdmc, "mdcode": mdcode, "peidBuf": peidBuf, "mdlx": mdlx,"groupcode":groupcode},    //参数值
        type: "POST",   //请求方式
        success: function (data) {
            $('#tbody2').html(PackagData(data));
            $("input[type=checkbox]").bind('click', function () {
                $(this).attr('checked', 'checked').parent().parent().siblings().children().children("input").removeAttr('checked');
            });
            //根据筛选条件，选中门店
            $("#classify input").click(function () {
                var put = $(this).parent().text();
                var lab = $(this).attr("class");
                var put2;
                var lab2;
                var lab3;
                var lab4;
                var lab5;
                var weather = [];
                var flag = false;
                var storeR = document.getElementById("tbody2");
                var inputL = storeR.getElementsByTagName("input");
                var stroreId = [];
                $("#tbody2 input").each(function () {
                    flag = false;
                    for (var i = 0; i < weather.length; i++) {  //判断每一行数据是否满足条件
                        if ($(this).parent().siblings("." + lab2).text() == weather[i]) { //如果存在则结算行数据判断：cmjb南 中 北
                            flag = true;
                            stroreId.push($(this).attr("id"));
                        }
                    }
                    for (var i = 0; i < size.length; i++) { //判断每一行数据是否满足条件
                        if ($(this).parent().siblings("." + lab3).text() == size[i]) {  //如果存在则结算行数据判断
                            flag = true;
                            stroreId.push($(this).attr("id"));
                        }
                    }
                    for (var i = 0; i < level.length; i++) { //判断每一行数据是否满足条件
                        if ($(this).parent().siblings("." + lab4).text() == level[i]) {  //如果存在则结算行数据判断
                            flag = true;
                            stroreId.push($(this).attr("id"));
                        }
                    }
                    if (flag) {
                        $(this)[0].setAttribute("checked", "checked"); //如果满足条件行，则该行打钩
                    } else {
                        $(this)[0].removeAttribute("checked");  //如果满足条件行，则该行不打钩
                    }

                });
                selectAllow();
            });

        }
    });
}

function PackagData(data) {
    var obj = $("#store1").find("input[type='checkbox']");
    var storeIdArray = new Array(obj.length);
    for (var i = 0; i < obj.length; i++) {
        storeIdArray[i] = obj.eq(i).attr("id");
    }
    var content = "";
    for (var i = 0; i < data.length; i++) {
        var isExists = false;
        for (var j in storeIdArray) {
            if (data[i].id == storeIdArray[j]) {
                isExists = true;
                break;
            }
        }
        if (isExists) {
            continue;
        }
        content += "<div class='store'><ul>";
        content += "<li class='checkbox'><input type='checkbox' id=" + data[i].id + " name='store_right' checked='checked' onclick='getCheckedOpts(this)'></li>";
        content += "<li id=" + data[i].id + ">" + data[i].mdcode + "</li>";
        content += "<li class='name'>" + data[i].mdmc + "</li>";
        content += "<li>" + (data[i].pename == null ?'-':data[i].pename) + "</li>";
        content += "<li  class='td-status mold'><span class='label label-success radius ' currentStatus =" + data[i].mdlx + ">" + Conversion(data[i].mdlx, store_type) + "</span></li>";
        content += "</ul></div>";
    }
    return content;
}


var checkedNum = 0;

function getCheckedOpts(_this) {
//获取判断选中多少行的方法
    selectAllowRight();
    selectAllowLeft();
}

function join() {
    $("#tbody2 input").each(function () {
        if ($(this).is(":checked")) {
            $(this).parent().parent().parent().remove();
            $("#store1").append($(this).parent().parent().parent().prop("outerHTML"));
        }
    });
    //获取判断选中多少行的方法
    selectAllowRight();
    selectAllowLeft();
}

function append() {
    var rightStoreData = $("#store1").find("input[type='checkbox']");
    var storeidList = new Array();
    var groupid = getQueryString("groupid");
    for (var i = 0; i < rightStoreData.length; i++) {
        storeidList.push(rightStoreData.eq(i).attr("id"));
    }
    console.log(storeidList);
    $.ajax({
        url: "/sotreGroupController/saveStoreGroupInfo/"+groupid,
        type: "PUT",
        data: JSON.stringify(storeidList),
        dataType: "JSON",
        async: false,
        cache: false,
        contentType:'application/json;charset=UTF-8',
        success: function (data) {
            alert(data.msg);
            if (data.success) {
                window.location.reload();
            }
        }
    });
}

function remove() {
    var rightStoreData = $("#store1").find("input[type='checkbox']:checked");
    var groupid = getQueryString("groupid");
    var storeidList = new Array();
    for (var i = 0; i < rightStoreData.length; i++) {
        storeidList.push(rightStoreData.eq(i).attr("id"));//门店ID
    }
    $.ajax({
        url: "/sotreGroupController/removeStoreGroupUnions/" + groupid,
        type: "DELETE",
        data: JSON.stringify(storeidList),
        dataType: "json",
        async: false,
        cache: false,
        contentType:'application/json;charset=UTF-8',
        success: function (data) {
            if (data.success) {
                window.location.reload();
            } else {
                alert(data.msg);
            }
        }
    });
}

function getchecked(o) {
    if (o.checked) {
        o.parentNode.className = 'abc';
        o.checked = true;
    } else {
        o.parentNode.className = '';
        o.checked = false;
    }
}

//左边右边门店全选反选
$(function () {
    var checkRightAll = document.getElementById("checkRightAll");
    var storeR = document.getElementById("tbody2");
    var inputR = storeR.getElementsByTagName("input");
    checkRightAll.onclick = function () {
        if (checkRightAll.checked) {
            for (var i = 0; i < inputR.length; i++) {
                inputR[i].setAttribute("checked", "checked");
            }
        } else {
            for (var i = 0; i < inputR.length; i++) {
                inputR[i].removeAttribute("checked");
            }
            ;
        }
    };

    var checkLefttAll = document.getElementById("checkLeftAll");
    var storeL = document.getElementById("store1");
    var inputL = storeL.getElementsByTagName("input");
    checkLefttAll.onclick = function () {
        if (checkLefttAll.checked) {
            for (var i = 0; i < inputL.length; i++) {
                inputL[i].setAttribute("checked", "checked");
            }
        } else {
            for (var i = 0; i < inputL.length; i++) {
                inputL[i].removeAttribute("checked");
            }
        }
        selectAllowRight();//计算选中有多少行，如果选中记录为0时就不显示
    };
});

//选中的行数
function selectAllowRight() {
    if ($("#tbody2 input[type=checkbox]:checked").length > 0) {

        $(".selectNumberright").text("已选择：" + $("#tbody2 input[type=checkbox]:checked").length);
        $(".selectNumberright").css("display", "block");
    } else {
        $(".selectNumberright").css("display", "none");
    }
}

function selectAllowLeft() {
    if ($("#store1 input[type=checkbox]:checked").length > 0) {
        $(".selectNumberleft").text("已选择：" + $("#store1 input[type=checkbox]:checked").length);
        $(".selectNumberleft").css("display", "block");
    } else {
        $(".selectNumberleft").css("display", "none");
    }
};

//左边右边门店全选反选
$(function () {
    var checkRightAll = document.getElementById("checkRightAll");
    var storeR = document.getElementById("tbody2");
    var inputR = storeR.getElementsByTagName("input");
    checkRightAll.onclick = function () {
        if (checkRightAll.checked) {
            for (var i = 0; i < inputR.length; i++) {
                inputR[i].setAttribute("checked", "checked");
            }
        } else {
            for (var i = 0; i < inputR.length; i++) {
                inputR[i].removeAttribute("checked");
            }
            ;
        }
    };
    var checkLefttAll = document.getElementById("checkLeftAll");
    var storeL = document.getElementById("store1");
    var inputL = storeL.getElementsByTagName("input");
    checkLefttAll.onclick = function () {
        if (checkLefttAll.checked) {
            for (var i = 0; i < inputL.length; i++) {
                inputL[i].setAttribute("checked", "checked");
            }
            ;
        } else {
            for (var i = 0; i < inputL.length; i++) {
                inputL[i].removeAttribute("checked");
            }
            ;
        }
        ;
        selectAllowRight();//计算选中有多少行，如果选中记录为0时就不显示
    };
});

/*右门店搜索*/
$("#searchMD").click(function () {
    loadRigthStore();
});

$("#leftAll").click(function(){
    $("#store1 input[type='checkbox']").prop("checked",true);
});
$("#leftOther").click(function() {
    $("#store1 input[type='checkbox']").each(function(){
        if ($(this).is(':checked')) {
            $(this).prop("checked", false);
        } else {
            $(this).prop("checked", true);
        }
    })
});

$("#rightAll").click(function(){
    $("#tbody2 input[type='checkbox']").prop("checked",true);
});
$("#rightOther").click(function() {
    $("#tbody2 input[type='checkbox']").each(function(){
        if ($(this).is(':checked')) {
            $(this).prop("checked", false);
        } else {
            $(this).prop("checked", true);
        }
    })
});


/*左门店搜索*/
$("#leftsearchMD").click(function () {
    loadLeftStore();
});

//重置
function resets() {
    console.log("11111");
    $(".posit3").attr("checked",false);
    $("#resetchebox input[type=checkbox]").attr("checked",false);
}