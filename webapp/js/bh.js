//获取发布id对应的批次数据
$(function(){
	var fbid=$("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").eq(0).attr("id");
	 $.ajax({
	    	url:pageContext+"/batchBhStoresController/getSpBatchInfo",
		  	type:"post",
		  	data: {"fbid":fbid},  
		  	dataType:"json",
		  	async:false,  
		    cache:false,
	    	success:function(data){
	    		if(data.success){
	    		var content;
	    		for(var i=0;i<data.obj.length;i++){
	    				 content+="<tr class='text-c'>";
	    				 content+="<td style='display:none' class='id'>"+data.obj[i].id+"</td>";
	    				 content+="<td id='batchcode'>"+data.obj[i].batchcode+"</td>";
	    				 content+="<td>"+data.obj[i].batchname+"</td>";
    					if (data.obj[i].hasphoto > 0) {
    						content += "<td class='td-status'><span class='label label-success radius' hasphoto="+ data.obj[i].hasphoto + ">有图片</span></td>";
    					} else {
    						content += "<td class='td-status'><span class='label btn-defaultradius' hasphoto="+ data.obj[i].hasphoto + ">没有图片</span></td>";
    					}
    					content+="<td>"+data.obj[i].createtime+"</td>";
    					content += "<td class='td-status'><span class='label label-success radius'>"+ Conversion(data.obj[i].fbstatus, SpBatch_fbstatus)+ "</span></td>";
    					/*content+="<td><a onclick='bhFun(this)' class='label label-danger radius batchid'>补货</a></td>";*/
    					content+="<td class='pkgtype' style='display:none'>"+data.obj[i].pkgtype +"</td>";
    					content+="</tr>";
	    		}
	    		$("#tbody").append(content);
	    		}else{
	    			alert(data.msg);
	    			window.parent.location.reload();
	    		}
	    	}
	    });		
});

//确定提交数据
function bhAllRelationBatch(){
	var array=new Array();
	var pram=[];
	var fbid=$("body",parent.document).find("input[type=checkbox]:checked").eq(0).attr("id");
	console.log(fbid);
	$(".id").each(function(index){
		pram[index]=$(this).text();
	})
	
	//var pramJoin=pram.join(",");
	//console.log(pramJoin);
	 $.ajax({
	    	url:pageContext+"/batchBhStoresController/bhAllRelationBatch",
		  	type:"post",
		 	data: {"batchidArray":pram.join(","),"fbid":fbid},  
		  	dataType:"json",
		  	async:false,  
	    	success:function(data){
	    		if(data.success){
	    			alert("补货成功！！");
	    			window.parent.location.reload();
	    		}else{
	    			alert(data.msg)
	    		}
	 	    	},error:function(){
	 	    		alert("请求失败！！");
	 	    	}
	    });		
}

