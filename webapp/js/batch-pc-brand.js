$(function(){
	//加载品牌信息
	loadBrandInfo();
	$("#brandContent tr").each(function(){
		$(this).click(function(){
			$(this).css("background-color","#5a98de").siblings("tr").css("background-color","");
		});
	});
});

//加载品牌信息
function loadBrandInfo(){
	$.ajax({
		url:pageContext+"/spBatchController/getAllSpBrandInfo",
		type : "post",
		dataType : "json",
		async : false,
		success : function(data) {
			var content = "";
			$.each(data, function(index, item){
				content += "<tr><td style=' width: 10px;'> </td><td>"+item.id+"</td><td>"+item.brandname+"</td></tr>";
			});
			content += "<tr style='position: fixed; bottom: 0;'><td style=' width: 10px;'> </td><td>100</td><td>"+data.length+"</td></tr>";
			$(".brandContent").html(content);
		}
	});
}

function brandAdd(title,url,w,h){
	layer_show(title,url,w,h);
	}

