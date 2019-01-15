var table = null;
$(function () {
    loadStore();
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    //1.初始化Table
    table = $('#usertable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/userController/getUserPageInfo", //请求后台的url
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
                field: 'username',
                title: '用户名称',
                align: 'center',
                valign: 'middle'
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
                field: 'usertype',
                title: '用户类型',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 1) {
                        return "门店用户";
                    } else {
                        return "后台用户";
                    }
                }

            }, {
                field: 'userstatus',
                title: '用户状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if (value == 0) {
                        return "正常";
                    } else if (value == 5) {
                        return "锁定";
                    } else if (value == 9) {
                        return "注销";
                    } else {
                        return "未知";
                    }
                }
            }, {
                field: 'createuname',
                title: '创建人',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'createdate',
                title: '创建时间',
                align: 'center',
                valign: 'middle'
            }]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#usertable").bootstrapTable('refresh', queryParams);
}

function queryParams(params) {
    var postdata = $('#userlistForm').serializeJSON();
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
    $('#userstatus').combobox();
    $('#usertype').combobox();
}

/**
 * @Description 添加用户
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-17 11:01
 **/
function addUserInfo() {
    layer.open({
        type: 2,
        title: '用户信息新增界面',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['800px', '450px'],
        btn: ["确定", "取消"],
        content: 'user-add',
        yes: function (index, layero) {//按钮【确定】的执行的函数
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            var username = postData["username"];
            var password = postData["password"];
            var usertype = postData["usertype"];
            var storeid = postData["storeid"];
            var gysid = postData["gysid"];
            console.log("username:" + username + " password:" + password + " usertype:" + usertype + " storeid:" + storeid);
            if (username == undefined || username == "" || username == null) {
                layer.msg("用户名称不能为空！！", function () {
                });
                return;
            }
            if (password == undefined || password == "" || password == null) {
                layer.msg("用户密码不能为空！！", function () {
                });
                return;
            } else if (password.length != 6) {
                layer.msg("用户密码必须要为6位！！", function () {
                });
                return;
            }
            if (usertype == undefined || usertype == "" || usertype == null) {
                layer.msg("用户类型不能为空！！", function () {
                });
                return;
            }
            if (usertype == 1 && (storeid == undefined || storeid == "" || storeid == null) && (gysid == undefined || gysid == "" || gysid == null)) {
                layer.msg("当用户类型为门店用户时,必须选择关联门店！！", function () {});
                return;
            }
            $.ajax({
                url: pageContext + "/userController/addUserInfo",
                type: "post",
                data: JSON.stringify(postData),
                contentType: 'application/json;charset=UTF-8',
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                        LoadingDataListOrderRealItems();
                    }
                },
                error: function (data) {
                    if (data.status == 'undefined') {
                        return;
                    }
                    switch (data.status) {
                        case 400:
                            alert(data.status+": "+data.msg);
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
        }, btn2: function (index, layero) {
            //按钮【取消】的回调
            layer.close(index);
        }
    });
}

/**
 * @Description 激活用户
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-17 13:10
 **/
function activeUserInfo() {
    var selections = $('#usertable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    if (selections[0].userstatus == 0) {
        layer.msg("当前用户为正常状态,无需激活！！", function () {
        });
        return;
    }
    layer.confirm('确认要激活用户' + selections[0].username + '？', {
        btn: ['确定', '取消']
    }, function (index) {
        $.ajax({
            url: pageContext + "/userController/activeUserByid/" + selections[0].id,
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                alert(data.msg);
                if (data.success) {
                    layer.close(index);
                    LoadingDataListOrderRealItems();
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
    });
}


/**
 * @Description 锁定用户
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-17 13:10
 **/
function lockUserInfo() {
    var selections = $('#usertable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    if (selections[0].userstatus == 5 || selections[0].userstatus == 9) {
        layer.msg("当前用户为锁定,注销状态,无需再次锁定！！", function () {
        });
        return;
    }
    layer.confirm('确认要锁定用户' + selections[0].username + '？', {
        btn: ['确定', '取消']
    }, function (index) {
        $.ajax({
            url: pageContext + "/userController/lockingUserByid/" + selections[0].id,
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                console.log(data);
                alert(data.msg);
                if (data.success) {
                    layer.close(index);
                    LoadingDataListOrderRealItems();
                }
            },
            error: function (data) {
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
    });
}

/**
 * @Description 注销用户
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-17 13:10
 **/
function closeUserInfo() {
    var selections = $('#usertable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    if (selections[0].userstatus == 9) {
        layer.msg("当前用户为注销状态,无需再次注销！！", function () {
        });
        return;
    }
    layer.confirm('确认要注销用户' + selections[0].username + '？', {
        btn: ['确定', '取消']
    }, function (index) {
        $.ajax({
            url: pageContext + "/userController/closeUserByid/" + selections[0].id,
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                alert(data.msg);
                if (data.success) {
                    layer.close(index);
                    LoadingDataListOrderRealItems();
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
    });
}

/**
 * @Description 修改用户密码
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-17 13:46
 **/
function updateUserPass() {
    var selections = $('#usertable').bootstrapTable("getSelections");
    if (selections.length < 1) {
        layer.msg("请至少选择一行！！", function () {
        });
        return;
    }
    layer.open({
        type: 1,
        title: '请输入要新的用户密码',
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
                url: pageContext + "/userController/updatePassByid/" + selections[0].id + "/" + password,
                type: "post",
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                        LoadingDataListOrderRealItems();
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

/**
 * @Description 从erp那边导入门店信息，并生成一个6位数的密码
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-03-19 15:27
 **/
function importErpStore() {
    layer.open({
        type: 1,
        title: '请输入要导入的门店号',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['300px', '150px'],
        btn: ["确定", "取消"],
        content: '<input style="width: 200px;margin-left: 50px;margin-top: 10px;" type="text" name="mdcode" id="mdcode" class="form-control radius">',
        yes: function (index, layero) {//按钮【确定】的执行的函数
            var mdcode = $('#mdcode').val();
            if (mdcode == undefined || mdcode == "" || mdcode == null) {
                layer.msg("输入的门店号不能为空！！", function () {
                });
                return;
            }
            $.ajax({
                url: pageContext + "/userController/importErpUser/" + mdcode,
                type: "POST",
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    alert(data.msg);
                    if (data.success) {
                        layer.close(index);
                        LoadingDataListOrderRealItems();
                    }
                },
                error: function (data) {
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