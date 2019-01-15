function article_save(){
    window.parent.location.reload();
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
var idFlag;
//获取商品详情
$(function(){
   var id=getQueryString(id);
   $.ajax({
        url:pageContext+"/goodsController/getCategoryById",    //请求的url地址
        dataType:"json",
        async:true,//请求是否异步，默认为异步true指ajax请求和其后面的操作是异步执行，同步false指把整个浏览器锁死，执行完才能有其它操作，这也是ajax重要特性,
        data:{"id":id},    //参数值
        type:"POST",   //请求方式
        success:function(data) {
            console.info(data);
            $("#id1").html("<input type='text' id='id' name='id' value='" + data.id + "'  class='input-text' hidden='true'/>");
            $("#categorycode1").html("<input type='text' id='categorycode' name='categorycode' value='" + data.categorycode + "'  class='input-text'/>");
            $("#categoryname1").html("<input type='text' id='categoryname' name='categoryname' value='" + data.categoryname + "'  class='input-text'/>");
            idFlag = data.parentid;
        }
   });
});
var mdContent;
$.ajax({
    url:pageContext+"/goodsController/getCategoryListPageInfo",
    type:"post",
    dataType:"json",
    async:false,
    cache:false,
    success:function(data){
        data=data.list;
        if(idFlag==0 ){
            mdContent = '<option value="0" selected="selected">没有父类</option>';
        }
        for(var i=0;i<data.length;i++){
            if(data[i].id==idFlag ){
                mdContent+="<option selected='selected' value="+data[i].id+">"+data[i].categoryname+"</option>";
            }else{
                mdContent+="<option value="+data[i].id+">"+data[i].categoryname+"</option>";
            }
        }
        $('#parentid').append(mdContent);
    }
});

//选择是否选中
function isCheck(o){
    if($(o).is(":checked")){
        $(o).parent().siblings().children('.'+$(o).attr('class')).removeClass("sign_upfre").removeAttr("disabled");
    }
    else{
        $(o).parent().siblings().children('.'+$(o).attr('class')).addClass("sign_upfre").attr("disabled","disabled");
        $(o).parent().siblings().children('.'+$(o).attr('class')).val("");
    }
}
//确定修改商品
function updateGoods(){
    var id=$("#id").val();
    var categorycode=$("#categorycode").val();
    var categoryname=$("#categoryname").val();
    var parentid=$("#parentid").val();
    //fbname不能为空
    if(categoryname=='' || categoryname==null ){
        layer.alert("商品名不能为空！");
        return;
    }

    $.ajax({
        url:pageContext+"/goodsController/updateCategory",    //请求的url地址
        dataType:"text",
        async:true,
        data:{"id":id,"categorycode":categorycode,"categoryname":categoryname,"parentid":parentid},
        type:"POST",   //请求方式
        success:function(data){
            console.log(data);
            window.parent.location.reload();
        }
    });

}

