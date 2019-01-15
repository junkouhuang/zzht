$(function(){

	//获取被选中的批次id
	var spBatchId = $("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id");
	
	//加载该批次下的所有商品
	if(spBatchId != null){
		loadSpBatchAllSp(spBatchId);
	}
});

//加载该批次下的所有商品
function loadSpBatchAllSp(spBatchId){
	$.ajax({
		url:pageContext+"/spBatchController/spBatchBinning",
	  	type:"post",
	  	dataType:"json",
	  	data:{"spBatchId":spBatchId},
	  	async:false,
	  	success:function(data){
	  		if(data.success){
	  			var content = "";
	  			$.each(data.obj, function(index, item){
	  				content += "<tr><td>"+item.spcode+"</td><td>"+item.spmc+"</td><td>"+item.spmx.ys+"</td><td>"+item.spmx.cm+"</td><td>"+item.spmx.audisl+"</td></tr>"
	  			});
	  			$("#binningContent").html(content);
	  		}else{
	  			layer.alert(data.msg);
	  		}
	  	}
	});
};