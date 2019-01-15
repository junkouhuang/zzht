var lbid;
var lbmc;
$(function () {
    $('#productattr').combobox();
    $('#rate').combobox();
    $('#batchlx').combobox();
    $('#fblx').combobox();
    $('#replenish').combobox();
    getDw();
    var spxx = window.parent.getSelectSpxx();
    $("#productname").val(spxx.spmc);
    $("#productdes").val(spxx.productdesc);
    $("#lbmc").val(spxx.lbmc);
    $("#productbrand").val(spxx.productbrand);
    $("#cz").val(spxx.cz);
    $("#dw").val(spxx.dw);
    lbid = spxx.lbid;
    $("#auditmsg").val(spxx.auditmsg);
});

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
                if (i == 0) {
                    mdContent += "<option selected='selected' value=" + data[i].dwmc + ">" + data[i].dwmc + "</option>";
                } else {
                    mdContent += "<option value=" + data[i].dwmc + ">" + data[i].dwmc + "</option>";
                }
            }
            $('#dw').append(mdContent);
            $('#dw').combobox();
        }
    });
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
        area: ['60%', '90%'],
        btn: ["确定", "取消"],
        content: 'splb-opt',
        yes: function (index, layero) {//按钮【确定】的执行的函数
            var postData = $(layero).find("iframe")[0].contentWindow.formData();
            lbmc = postData['lbmc'];
            lbid = postData['lbid'];
            if (lbmc != '' && lbmc != undefined && lbmc != null && lbid != '' && lbid != undefined && lbid != null) {
                $("#lbmc").val(lbmc);
            }
            layer.close(index);
        }, btn2: function (index, layero) {
            //按钮【取消】的回调
            layer.close(index);
        }
    });
}

function formData() {
    var obj = new Object();
    var productname = $("#productname").val();
    var productdes = $("#productdes").val();
    var productattr = $("#productattr").val();
    var brand = $("#brand").val();
    var branddes = $("#branddes").val();
    var lbmc = $("#lbmc").val();
    var cz = $("#cz").val();
    var rate = $("#rate").val();
    var sellprice = $("#sellprice").val();
    var batchlx = $("#batchlx").val();
    var dw = $("#dw").val();
    var dwdes = $("#dwdes").val();
    var fblx = $("#fblx").val();
    var replenish = $("#replenish").val();
    var auditmsg = $("#auditmsg").val();
    obj["productname"] = productname;
    obj["productdes"] = productdes;
    obj["productattr"] = productattr;
    obj["brand"] = brand;
    obj["branddes"] = branddes;
    obj["lbmc"] = lbmc;
    obj["lbid"] = lbid;
    obj["cz"] = cz;
    obj["rate"] = rate;
    obj["sellprice"] = sellprice;
    obj["batchlx"] = batchlx;
    obj["dw"] = dw;
    obj["dwdes"] = dwdes;
    obj["fblx"] = fblx;
    obj["replenish"] = replenish;
    obj["auditmsg"] = auditmsg;
    return obj;
}