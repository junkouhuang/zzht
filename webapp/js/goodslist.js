
//初始化bootstrap Table
$(function(){
    //初始化Table
    var oTable=new TableInit();
    oTable.Init();
});
var id;
var TableInit=function(){
    var oTableInit=new Object();
    oTableInit.Init=function () {

        //1.初始化Table
        $('#dhtable').bootstrapTable({  //表格ID
            method:'POST',//请求方式（*）
            dataType:'json',//获取的数据类型
            toolbar:"#exampleTableEventsToolbar",
            contentType: "application/x-www-form-urlencoded",
            cache: false,// //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            striped: true,//是否显示行间隔色
            sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
            url:pageContext+"/goodsController/getCategoryListPageInfo", //请求后台的url
            singleSelect: true, //仅允许单选
            clickToSelect:true,
            showColumns:false, //是否显示所有的列
            showRefresh:true,//是否显示刷新按钮
            pagination:true,//是否显示分页（*）
            detailView:true,
            queryParamsType: 'undefined',
            queryParams : queryParams,//传递参数（*）
            responseHandler:rspHandler,
            minimumCountColumns:2,//最少允许的列数
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 20, 50, 100],        //可供选择的每页的行数（*）
            idField :"id",
            search:true,                      //可供搜索
            searchOnEnterKey:true,                   //按回车触动搜索
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showExport: true,
            exportDataType: 'all',
            showPaginationSwitch:true,
            columns: [
                {
                    checkbox: true
                },
                //动态创建列名
                {
                    field : 'id',
                    title : '商品Id',
                    align : 'center',
                    valign : 'middle'
                }, {
                    field : 'categoryname',
                    title : '商品名称',
                    align : 'center',
                    valign : 'middle',
                }, {
                    field : 'categorycode',
                    title : '商品标识',
                    align : 'center',
                    valign : 'middle',
                    sortable : true
                }, {
                    field : 'imgurl',
                    title : '商品图片',
                    align : 'center',
                    valign : 'middle',
                    formatter: function (value, row, index) {
                        if (value == "" || value == null || value == undefined){
                            return "没有图片";
                        }else{
                            return "有图片";
                        }
                    }
                }],
            onClickRow: function (row, $element) {
            },

            // 加载子表格
            onExpandRow: function (index, row, $detail) {
                oTableInit.InitSubTable(index, row, $detail);
            }


        });
    };
    //得到查询的参数
    function rspHandler (res) {
        if (res) {
            return {
                "rows" : res.list,
                "total" : res.total
            };
        } else {
            return {
                "rows" : [],
                "total" : 0
            };
        }
    };

    // 子表格
    oTableInit.InitSubTable = function (index, row, $detail) {
        var id = row.id;
        var cur_table = $detail.html('<table id="subTable"></table>').find('table');
        console.info(cur_table);
        $(cur_table).bootstrapTable({
            method:'POST',
            dataType:'json',
            contentType: "application/x-www-form-urlencoded",
            url: pageContext+"/goodsController/getCategoryListByParentId",
            queryParams: {id : id},
            singleSelect: true, //仅允许单选
            showExport: true,
            exportDataType: 'all',
            pagination:false,
            striped:true,
            columns: [
                {
                    checkbox: true
                },
                {
                    field: 'id',
                    title: 'id'
                },
                {
                    field: 'categoryname',
                    title: '商品名称'
                }, {
                    field: 'categorycode',
                    title: '商品编码'
                }, {
                    field: 'imgurl',
                    title: '商品图片',
                    align : 'center',
                    valign : 'middle',
                    formatter: function (value, row, index) {
                        if (value == "" || value == null || value == undefined){
                            return "没有图片";
                        }else{
                            return "有图片";
                        }
                    }
                }
            ],
            onExpandRow: function (index, row, $Subdetail) {
                oTableInit.InitSubTable(index, row, $Subdetail);
            }

        });

    };
    return oTableInit;
};

function queryParams(params) {
    var categoryname = $("#categoryname").val();		// 获取发布号
    var categorycode = $("#categorycode").val();		// 获取批次号
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        pageSize: params.pageSize,   //页面大小
        pageNumber: params.pageNumber, //页码
        categoryname:categoryname,
        categorycode:categorycode,
    };
    return temp;
}
// 搜索
function search(){
    $("#dhtable").bootstrapTable('refreshOptions', {pageNumber:1});
    $("#dhtable").bootstrapTable('refresh', queryParams);
}

// 获取url中的参数的函数
var getQueryVariable = function(variable){
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}


var executeSearch = function (param) {
    $("#batchcode").val(param);
    $("#dhtable").bootstrapTable('refreshOptions', {pageNumber:1});
    $("#dhtable").bootstrapTable('refresh', queryParams);
}
//得到查询的参数
function rspHandler (res) {
    if (res) {

        //循环确认每个批次的状态
        $.each(res.list, function(index, item){
            item.status = confirmSpBatchStatus(item.status);
        });

        //循环确认是否有图片
        $.each(res.list, function(index, item){
            var isExistImage = '没有图片';
            if(item.hasphoto != null && item.hasphoto == true){
                isExistImage = '有图片';
            }
            item.hasphoto = isExistImage;
        });

        return {
            "rows" : res.list,
            "total" : res.total
        };
    } else {
        return {
            "rows" : [],
            "total" : 0
        };
    }
};


//!*上传图片*!/
function upload(title, url, w, h) {
    var rows = $('#dhtable').bootstrapTable("getSelections")[0];
    var subrows = $('#subTable').bootstrapTable("getSelections")[0];
    if ((rows == null || rows == undefined) && (subrows == null || subrows == undefined)){
        layer.alert("请勾选商品后,再点击上传图片!");
        return false;
    }
    if(subrows==null || subrows==undefined){
        layer_show(title,url + "?id=" + rows.id ,w,h);
    }else{
        layer_show(title,url + "?id=" + subrows.id ,w,h);
    }
}

/*删除商品*/
function delgoods(){
    var rows = $('#dhtable').bootstrapTable("getSelections")[0];
    var subrows = $('#subTable').bootstrapTable("getSelections")[0];
    if((rows == null || rows == undefined)&&(subrows == null || subrows == undefined)){
        layer.alert("请勾选后，再点击删除！");
    }else{
        if(rows==null || rows==undefined){
            id=subrows.id;
        }else{
            id=rows.id;
        }
        layer.confirm('确定要删除吗？',function(index){
            $.ajax({
                url:pageContext+"/goodsController/deleteCategory",    //请求的url地址
                dataType:"json",   //返回格式为json
                async:true,
                data:{"id":id},    //参数值
                type:"post",   //请求方式
                success:function(data){
                    if(data.success){
                        alert(data.msg);
                        window.location.reload();
                    }else{
                        alert(data.msg);
                        layer.close(index);
                    }
                }
            });
        });

    }
}



/*修改商品*/
function goodsUpdate(title,url,w,h){
    var rows = $('#dhtable').bootstrapTable("getSelections")[0];
    var subrows = $('#subTable').bootstrapTable("getSelections")[0];
    console.log(rows);
    console.log(subrows);
    if ((rows == null || rows == undefined) && (subrows == null || subrows == undefined)){
        layer.alert("请勾选后，再点击修改！");
        return false;
    }
    if(subrows==null || subrows==undefined){
        layer_show(title,url + "?id=" + rows.id ,w,h);
    }else{
        layer_show(title,url + "?id=" + subrows.id ,w,h);
    }

}


//打开添加商品的界面
function goodsAdd(title,url,w,h){
    layer_show(title,url,w,h);
}

//提交表单
function submitGoodsForm(){
    var categoryname=$("#categoryname").val();
    var categorycode=$("#categorycode").val();
    var parentid=$("#parentid").val();
    if(categoryname==""){
        layer.alert("请填写商品名称！");
        return false;
    }
    if(categorycode==""){
        layer.alert("请填写商品标识！");
        return false;
    }
    $.ajax({
        url:pageContext+"/goodsController/saveGoods",    //请求的url地址
        dataType:"json",
        async:true,
        data:{"categoryname":categoryname,"categorycode":categorycode,"parentid":parentid},
        type:"POST",   //请求方式
        success:function(data){
            alert(data.msg);
            window.parent.location.reload();

        }

    });
    console.info(data);
}

// 上传图片
function imageUpload(){
    var rows = $('#dhtable').bootstrapTable("getSelections")[0];
    var subrows = $('#subTable').bootstrapTable("getSelections")[0];
    if ((rows == null || rows == undefined) && (subrows == null || subrows == undefined)){
        layer.alert("请勾选商品后,再点击上传图片!");
        return false;
    }
    if(rows==null || rows==undefined){
        id=subrows.id;
    }else{
        id=rows.id;
    }
    layer.open({
        type: 2,
        title: '上传图片',
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['894px', '530px'],
        content: 'goods_image_upload'+"?id="+id,
        btn: ['关闭'], //可以无限个按钮
        yes: function(index, layero){
            layer.close(index);
            $("#dhtable").bootstrapTable('refresh', id);
        }
    });
}

// 打开浏览图片窗口
function openBrowseWindow(thisObj){
    var spID = $(thisObj).attr("id");
    layer.open({
        type: 2,
        title: '查看图片',
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['893px', '280px'],
        content: 'goods_image_browse?id='+id
    });
}


/*浏览图片 */
function browseImage(title, url, w, h) {

    var rows = $('#dhtable').bootstrapTable("getSelections")[0];
    var subrows = $('#subTable').bootstrapTable("getSelections")[0];
    var canBrowse;
    if ((rows == null || rows == undefined) && (subrows == null || subrows == undefined)){
        layer.alert("请勾选后，再点击浏览！");
        return false;
    }
    if(rows==null || rows==undefined){
        id=subrows.id;
        canBrowse = subrows.imgurl;

    }else{
        id=rows.id;
        canBrowse = rows.imgurl;
    }
    if (canBrowse != null || canBrowse != undefined || canBrowse != "") {
        layer_show(title, url + "?id=" + id, w, h);
    } else {
        layer.alert("选中的没有图片，无法浏览！");
    }

}