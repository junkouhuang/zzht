$.ajax({
    url:pageContext+"/goodsController/getCategoryListPageInfo",
    type:"post",
    dataType:"json",
    async:false,
    cache:false,
    success:function(data){
        var mdContent = '<option value="" selected="selected">没有父类</option>';
        data=data.list;
        console.log(data);
        for(var i=0;i<data.length;i++){
            mdContent+="<option value="+data[i].id+">"+data[i].categoryname+"</option>";
        }
        $('#parentid').append(mdContent);
    }
});
//提交表单
var parm={};
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
		    dataType:"text",
		    async:true,
            data:{"categoryname":categoryname,"categorycode":categorycode,"parentid":parentid},
		    type:"POST",   //请求方式
		    success:function(data){
		    	var date=eval("("+data+")");
		    	if(date.msg=='success'){
		    		layer.alert("新增成功!");
		    		window.parent.location.reload();
		    	}else if(date.msg == 'fail'){
		    		alert("新增失败!");
		    	}else if(date.msg =='error'){
		    		alert("系统错误！");
		    	}
		    }
	});
}
