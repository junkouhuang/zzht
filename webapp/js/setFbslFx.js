//获取分箱（批次）的数据
var batchid ="";
    $(function () {
    batchid = getQueryString("batchid");
    $.ajax({
        url: pageContext + "/spBatchController/getSpbatchdetailByBatchid/" + batchid,
        type: "post",
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {
            var content;
            for (var i = 0; i < data.obj.length; i++) {
                //尺码
                if (data.obj[i].batchcm == null) {
                    content += "<tr><td></td><td>"
                } else {
                    content += "<tr><td>" + data.obj[i].batchcm + "</td>"
                }
                //颜色
                if (data.obj[i].batchys == null) {
                    content += "<td></td>"
                } else {
                    content += "<td>" + data.obj[i].batchys + "</td>"
                }
                //每份数量
                if (data.obj[i].mfsl == null) {
                    content += "<td></td>"
                } else {
                    content += "<td>" + data.obj[i].mfsl + "</td>"
                }
                //上次发布数量
                content += "<td>" + (data.obj[i].fbsl == null ? 0 : data.obj[i].fbsl) + "</td>"
                //剩余数量
                content += "<td>" + (data.obj[i].stock == null ? 0 : data.obj[i].stock) + "</td>"
                //下单比率
                content += "<td>" + "<input type='text'  params=" + data.obj[i].ratio + " class='input-text text-c radius size-M' id='ratio' value=" + (data.obj[i].ratio == null ? 0.1 : data.obj[i].ratio) + ">" + "</td>"
                //追加数量
                content += "<td><input type='text' params=" + data.obj[i].id + " class='input-text text-c radius size-M' id='sl' value='0'></td></tr>"
            }
            $("#tbody").append(content);
        }
    });
});

//确定提交数据
var formData = function () {
    var spbatchdetailList = new Array();
    for (var i = 0; i < $("#tbody tr").length; i++) {
        var id = $("#tbody tr").eq(i).find("#sl").attr("params");
        var sl = $("#tbody tr").eq(i).find("#sl").val();
        var ratio = $("#tbody tr").eq(i).find("#ratio").val();
        spbatchdetailList.push({"id": id, "sl": sl, "ratio": ratio});
    }
    return spbatchdetailList;
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};