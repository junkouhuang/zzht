//获取不分箱（批次）的数据
$(function(){
	var batchid=$("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").eq(0).attr("id");
	 $.ajax({
	    	url:pageContext+"/spmxController/getSpmxList",
		  	type:"post",
		  	data: {"batchid":batchid},  
		  	dataType:"json",
		  	async:false,  
		    cache:false,
	    	success:function(data){
	    		console.log(data);
	    		if(data.msg=='检索的批次存在异常!!'){
	    			layer.alert(data.msg);
	    		}else{
	    			var content;
	    			for(var i=0;i<data.obj.length;i++){		    			
	    				content+="<tr><td>"+data.obj[i].ys+"</td><td>"+data.obj[i].cm+"</td><td><input type='text' class='input-text radius size-M vsl'  value="+data.obj[i].vsl+"></td><td  class='batchid' style='display:none;'>"+data.obj[i].id+"</td><td  class='errorMsg'><i></i><span></span></td></tr>";
	    			}
	    			$("#tbody").append(content);
	    		}
	    	}
	    });		
});


//录入批次数量校验
$(function(){
$(".vsl").each(function(){
	$(this).keyup(function(){
		if(isNaN($(this).val())){
			$(this).siblings(".errorMsg").children("span").text("不能输入非数字！");
		}else{
			 if($(this).val()<1){
				 $(this).siblings(".errorMsg").children("span").text("录入数量不能小于1！");
			}
		}
	});
});
});

//确定提交数据
function setFbslNFxSub(){
	var id=$(".batchid").eq(0).text();
	var vsl;
	var id;
	var list = new Array();  
	for(var i=0;i<$("#tbody tr").length;i++){
		vsl=$("#tbody tr").eq(i).find(".vsl").val();
		id=$("#tbody tr").eq(i).find(".batchid").text();
		list.push({"vsl": vsl,"id": id});   
	}
	 $.ajax({
	    	url:pageContext+"/spmxController/updateSpmx",
		  	type:"post",
		 	data: JSON.stringify(list),  
		  	dataType:"json",
		  	contentType:'application/json;charset=UTF-8',
		  	async:false,  
		    cache:false,
	    	success:function(data){
	    		if(data){
	    			window.parent.location.reload();
	    		}
	 	    	},error:function(){
	 	    		alert("请求失败！！");
	 	    	}
	    });		
}