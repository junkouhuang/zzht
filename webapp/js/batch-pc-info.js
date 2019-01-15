var lbid = "";
var lbmc = "";
$(function(){
    getDw();
    // 获取被选中的批次id
    var spBatchId = getBatchID();
    rawDate(spBatchId);
    $("#rate").keyup(function(){$(this).val($(this).val().replace(/[^\d\.]/g,""));});
    $("#sellprice").keyup(function(){$(this).val($(this).val().replace(/[^\d\.]/g,""));});
});


var rawDate = function(id){         // 获取原始数据
    if(id == null || id == undefined || id == ""){return false};

    $.ajax({
        url:pageContext + "/spBatchController/getSpbatchBasic/" + id,
        type:"GET",
        async:false,
        success:function(resp){
            if(resp.id != null && resp.id != undefined && resp.id != ""){
                echoDate(resp);
                $("#mark").html("修改信息");
                $("#mark").attr("onclick", "update()");
            }else{
                var selection = window.parent.getSelectionBatchInfo();
                lbmc = selection.batchlbmc;
                lbid = selection.batchlbid;
                $("#sellprice").val(selection.spprice);
                $("#lbmc").val(lbmc);
                $("#batchlx").val(selection.batchlx);
            }
        }
    });
};

function getDw() {
    //加载单位
    $.ajax({
        url: "/spBatchController/getDwList",
        type: "GET",
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {
            var mdContent = "";
            for (var i = 0; i < data.length; i++) {
                if(i ==0){
                    mdContent += "<option selected='selected' value=" + data[i].dwmc + ">"+ data[i].dwmc +"</option>";
                }else{
                    mdContent += "<option value=" + data[i].dwmc + ">"+ data[i].dwmc +"</option>";
                }
            }
            $('#dw').append(mdContent);
        }
    });
}
var o;
var echoDate = function(obj){       // 回显信息
    $("#id").val(obj.id);
    $("#productname").val(obj.productname);
    $("#productdes").val(obj.productdes);
    $("#productattr").find("input").each(function (index, item) {
        if(obj.productattr == $(item).val()){
            $(item).attr("checked", true);
        }
    });
    $("#brand").val(obj.brand);
    $("#branddes").val(obj.branddes);
    $("#categoryid").val();
    $("#cz").val(obj.cz);
    $("#rate").val(obj.rate);
    $("#sellprice").val(obj.sellprice);
    if(obj.dw != null && obj.dw != ''){
        $("#dw").val(obj.dw);
    }
    if(obj.dwdes != null && obj.dwdes != ''){
        $("#dwdes").val(obj.dwdes);
    }
    $("#batchlx").val(obj.batchlx);
    $("#fblx").val(obj.fblx);
    if(obj.replenish){
        $("#replenish").val(1);
    }else{
        $("#replenish").val(0);
    }
    lbid = obj.lbid;
    lbmc = obj.lbmc;
    $("#lbmc").val(lbmc);
    o = obj;
}

var update = function(){            // 修改
    var msg = check();
    if (msg != true){alert(msg);return false;}
    var obj = getObj();
    obj.id = getID();
    $.ajax({
        url:pageContext + "/spBatchController/modifySpbatchBasic",
        contentType:'application/json;charset=utf-8',
        type:"POST",
        async:false,
        dataType:"JSON",
        data:JSON.stringify(obj),
        success:function(data){
            if(data.success){
                alert(data.msg);
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }else{
                alert(data.msg);
            }
        }
    });
}

var save = function(){              // 保存
    var msg = check();
    if (msg != true){alert(msg);return false;};
    var obj = getObj();
    $.ajax({
        url:pageContext + "/spBatchController/addSpbatchBasic",
        contentType:'application/json;charset=utf-8',
        type:"POST",
        async:false,
        dataType:"JSON",
        data:JSON.stringify(obj),
        success:function(data){
            if(data.success){
                alert(data.msg);
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }else{
                alert(data.msg);
            }
        }
    });
}


var check = function(){
    var productname = getProductname();
    if(productname == "" || productname == undefined || productname == null){return "产品名称不能为空！！";}
    var rate = getRate();
    if(rate == "" || rate == undefined || rate == null){return "折扣不能为空！！";}
    var sellprice = getSellprice();
    if(sellprice == "" || sellprice == undefined || sellprice == null){return "销售价不能为空！！";}
    if(lbmc == "" || lbmc == undefined || lbmc == null || lbid == "" || lbid == undefined || lbid == null){
        return "请选择类别";
    }
    return true;
}


var getObj = function(){
    var obj = new Object();
    obj.batchid = getBatchID();
    obj.productname = getProductname();
    obj.brand = getBrand();
    obj.branddes = getBranddes();
    obj.categoryid = getCategoryid();
    obj.productdes = getProductdes();
    obj.cz = getCz();
    obj.productattr = getProductattr();
    obj.sellprice = getSellprice();
    obj.rate = getRate();
    obj.branddes = getBranddes();
    obj.dw = $("#dw").val();
    obj.batchlx = $("#batchlx").val();
    obj.fblx = $("#fblx").val();
    obj.replenish = $("#replenish").val() == 0 ? false : true;
    obj.dwdes = $("#dwdes").val();
    obj.lbid = lbid;
    obj.lbmc = lbmc;
    return obj;
}

var getID = function () {                   // 获取id
    var id = $("#id").val();
    return id;
}

var getProductname = function () {              // 获取产品名称
    var productname = $("#productname").val();
    return productname;
}

var getProductdes = function () {              // 获取产品描述
    var productdes = $("#productdes").val();
    return productdes;
}

var getProductattr = function (){               // 获取产品属性
    var productattr = $("#productattr").find("input:radio[name='productattr']:checked").val()
    return productattr;
}

var getBrand = function(){                      // 获取品牌
    var brand = $("#brand").val();
    return brand;
}

var getBranddes = function(){                      // 获取品牌介绍
    var branddes = $("#branddes").val();
    return branddes;
}

var getCz = function(){                         // 获取材质
    var cz = $("#cz").val();
    return cz;
}

var getRate = function(){                       // 获取原价
    var rate = $("#rate").val();
    return rate;
}

var getSellprice = function(){                     // 获取销售价
    var sellprice = $("#sellprice").val();
    return sellprice;
}

var getCategoryid = function(){                     // 获取大类id
    var categoryid = $("#categoryid").val();
    return categoryid;
}

var getBatchID = function () {                 // 获取batchid
    var spBatchId = getQueryString("batchid");
    return spBatchId;
}

//根据url截取第一个参数
function getQueryString(name) {
    var url = window.location.href; //获取url中"?"符后的字串
    if (url.indexOf("?") != -1) {  //判断是否有参数
        var str = url.substr(1); //从第一个字符开始 因为第0个是?号 获取所有除问号的所有符串
        strs = str.split("=");  //用等号进行分隔 （因为知道只有一个参数 所以直接用等号进分隔 如果有多个参数 要用&号分隔 再用等号进行分隔）
        return strs[1];     //直接弹出第一个参数 （如果有多个参数 还要进行循环的）
    }
}
var doubleV = function(v){                  // 加倍
    if(isNaN(v) || v == "" || v == undefined || v == null){return v;}
    return v * 2;
}

var halfV = function(v){                    // 减半
    if(isNaN(v) || v == "" || v == undefined || v == null){return v;}
    return v / 2;
}

/**
 * @Description 分类操作界面
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-23 08:49
 **/
function selectSplb() {
    layer.open({
        type: 2,
        title: '分类操作界面',
        shade: [0.8, '#393D49'],
        maxmin: false, //开启最大化最小化按钮
        area: ['670px', '450px'],
        btn: ["确定", "取消"],
        content: 'splb-opt',
        yes: function (index, layero) {//按钮【确定】的执行的函数
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            lbmc = postData['lbmc'];
            lbid = postData['lbid'];
            if(lbmc != '' && lbmc != undefined && lbmc != null && lbid != '' && lbid != undefined && lbid != null){
                $("#lbmc").val(lbmc);
            }
            layer.close(index);
        }, btn2: function (index, layero) {
            //按钮【取消】的回调
            layer.close(index);
        }
    });
}