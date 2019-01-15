var lbid = "";
var lbmc = "";
var image_lbid = "";
$(function () {
    //功能菜单右键
    $('#tt').tree({
        onContextMenu: function (e, node) {
            e.preventDefault();
            $('#tt').tree('select', node.target);
            $('#mm').menu('show', {
                left: e.pageX,
                top: e.pageY
            });
        }
    });
});

/**
 * easyui datagrid列编辑
 */
var editIndex = undefined;

function endEditing() {
    if (editIndex == undefined) {
        return true
    }
    if ($('#dg').datagrid('validateRow', editIndex)) {
        var ed = $('#dg').datagrid('getEditor', {index: editIndex, field: 'productid'});
        var productname = $(ed.target).combobox('getText');
        $('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
        $('#dg').datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}

function onClickRow(index) {
    if (editIndex != index) {
        if (endEditing()) {
            $('#dg').datagrid('selectRow', index)
                .datagrid('beginEdit', index);
            editIndex = index;
        } else {
            $('#dg').datagrid('selectRow', editIndex);
        }
    }
}

/**
 * @Description 添加类别
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-24 13:22
 **/
function appendChildNode() {
    var tt = $('#tt').tree('getSelected');
    layer.open({
        type: 1,
        title: '添加子节点',
        area: ['320px', '220px'],
        shade: [0.8, '#393D49'],
        btn: ["保存", "取消"],
        content: '<form id="importBatchInfo" class="p10">' +
        '<table>' +
        '<tr><td class="pb-5">类别名称：</td><td class="pb-5"><input id="text" type="text" class="form-control" /></td></tr>' +
        '</table>' +
        '</form>',
        yes: function (index) {
            var lbmc = $("#text").val();
            if (lbmc == '') {
                layer.msg("类别名称不能为空!!", function () {
                });
                return;
            }
            //添加节点的ajax
            $.ajax({
                url: pageContext + "/goodsController/addSplb",
                type: "post",
                dataType: "json",
                data: {"parentid": tt.id, "lbmc": lbmc},
                async: false,
                cache: false,
                success: function (data) {
                    layer.msg(data.msg);
                    if (data.success) {
                        $('#tt').tree('reload');
                        layer.close(index);
                        selectid = "";
                        $("#lbid").html("");
                        lbmc = "";
                    }
                }
            });

        }, error: function (index) {
            layer.close(index);
        }
    });
}

/**
 * @Description 类别移除
 * @params
 * @return
 * @throws
 * @author 肖亮亮
 * @date 2018-02-24 13:21
 **/
function removeChildNode() {
    var selected = $('#tt').tree('getSelected');
    layer.confirm('您确定要删除类别：' + selected.text + '？', {
        btn: ['确定', '取消'] //按钮
    }, function (index) {
        $.ajax({
            url: pageContext + "/goodsController/deleteSplbByid/" + selected.id,
            type: "post",
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                layer.msg(data.msg);
                if (data.success) {
                    $("#tt").tree("reload");
                    selectid = "";
                    $("#lbid").html("");
                    lbmc = "";
                }
            }
        });
    });
}

var formData = function () {
    return {"lbid": lbid, "lbmc": lbmc};
};
$('#tt').tree({
    onClick: function (node) {
        if ((node.children == undefined || node.children == null || node.children == "") && node.parentid != "") {
            lbid = node.id;
            lbmc = node.text;
            $("#lbid").html(node.text);
        } else {
            lbid = "";
            lbmc = "";
            $("#lbid").html("");
        }
        image_lbid = node.id;
        document.getElementById("lbimg").src= "http://119.23.48.31/"+node.imgurl;
    }
});

function upload(title) {
    if (image_lbid == "" || image_lbid == null || image_lbid == undefined) {
        layer.msg("请点选分类之后再操作图片！！", function () {});
        return;
    }
    layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        shade: 0.8,
        area: ['100%', '100%'],
        content: "splb-image-add?lbid=" + image_lbid,
    });
}

function removeSplbImage(){
    if (image_lbid == "" || image_lbid == null || image_lbid == undefined) {
        layer.msg("请点选分类之后再操作图片！！", function () {});
        return;
    }
    $.ajax({
        url: pageContext + "/imageController/clearSplbImage/" + image_lbid,
        type: "post",
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {
            layer.msg(data.msg);
            if (data.success) {
                $("#tt").tree("reload");
                selectid = "";
                $("#lbid").html("");
                lbmc = "";
            }
        }
    });
}

