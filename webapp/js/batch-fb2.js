var table = null;
$(function () {
    // 执行一个laydate实例
    laydate.render({
        elem: '#time',
        range: true
    });
    //1.初始化Table
    table = $('#batchfbTable').bootstrapTable({  //表格ID
        method: 'POST',//请求方式（*）
        dataType: 'json',//获取的数据类型
        toolbar: "#exampleTableEventsToolbar",
        contentType: "application/x-www-form-urlencoded",
        cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        striped: false,//是否显示行间隔色
        sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
        url: pageContext + "/newProduct/getBatchFbList", //请求后台的url
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
                field: 'fbcode',
                title: '发布号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'fbname',
                title: '发布名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'startdate',
                title: '起订时间',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'status',
                title: '状态',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var str = '';
                    if (value == 0) {
                        str = '默认';
                    } else if (value == 1) {
                        str = '<span class=\' btn-warning p30\'>确认</span>';
                    } else if (value == 2) {
                        str = '<span class=\' btn-success p30\'>发布</span>';
                    } else if (value == 3) {
                        str = '<span class=\' btn-danger p30\'>下架</span>';
                    }
                    return str;
                }
            }]
    });
});

// 搜索功能
function LoadingDataListOrderRealItems() {
    $("#batchfbTable").bootstrapTable('refresh', queryParams);
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

/*新增发布号*/
function batchfbAdd(){
    layer.open({
        type: 2,
        title: '发布号新增界面',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['60%', '60%'],
        content: 'batch-fb-add'
    });
}


/*修改*/
function batchfbUpdate(){
    var selections = $('#batchfbTable').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个发布号进行修改操作！！", function () {});
        return;
    }
    layer.open({
        type: 2,
        title: '发布号修改界面',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['60%', '60%'],
        content: 'batch-fb-update?fbid='+selections[0].id
    });

}


/*确认*/
function batchfbConfirm(){
    var selections = $('#batchfbTable').bootstrapTable("getSelections");
    if (selections.length != 1) {
        layer.msg("请选择一个发布号进行确认操作！！", function () {});
        return;
    }
    if(selections[0].status === 1){
        layer.msg("该发布号现已是确认状态！",function(){});
        return;
    }else if(selections[0].status === 2){
        layer.msg("现为发布状态，不能确认！",function(){});
        return;
    }
    $.ajax({
        url:pageContext+"/newProduct/confirmBatchFb",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,
        data:{fbId:selections[0].id},    //参数值
        type:"post",   //请求方式
        success:function(data){
            alert(data.msg);
            if(data.success){
                LoadingDataListOrderRealItems();
            }
        }

    });

}

/*发布*/
function batchfbUpdateStatus(){
    var selections = $('#batchfbTable').bootstrapTable("getSelections");
    if (selections.length !== 1) {
        layer.msg("请选择一个发布号进行发布操作！！", function () {});
        return;
    }
    if(selections[0].status === 2){
        layer.msg("被选中的已经发布，不能再次发布！",function(){});
        return;
    }else if(selections[0].status === 3){
        layer.msg("被选中的已经下架，不能再次发布！",function(){});
        return;
    }
    layer.confirm('确认要发布吗？',function(index){
        $.ajax({
            url:pageContext+"/newProduct/releaseBatchFb",    //请求的url地址
            dataType:"json",   //返回格式为json
            async:true,
            data:{fbId:selections[0].id},    //参数值
            type:"post",   //请求方式
            success:function(data){
                alert(data.msg);
                if(data.success){
                    LoadingDataListOrderRealItems();
                }else{
                    if(data.obj != null){
                        layer.alert("已有发布,请下架之前的发布后再重新发布!");
                    }else{
                        alert(data.msg);
                    }
                }
            }
        });
        layer.close(index);
    });
}


/*下架*/
function offBatchFb(){
    var selections = $('#batchfbTable').bootstrapTable("getSelections");
    if (selections.length !== 1) {
        layer.msg("请选择一个发布号进行下架操作！！", function () {});
        return;
    }
    layer.confirm('确定要下架吗？',function(index){
        $.ajax({
            url:pageContext+"/newProduct/offBatchFb",    //请求的url地址
            dataType:"json",   //返回格式为json
            async:true,
            data:{fbId:selections[0].id},    //参数值
            type:"post",   //请求方式
            success:function(data){
                alert(data.msg);
                if(data.success){
                    LoadingDataListOrderRealItems();
                }
            }
        });
        layer.close(index);
    });

}
$(function () {
    $(document).keydown(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#batchfbTable").bootstrapTable('refresh', queryParams);
        }
    });
});