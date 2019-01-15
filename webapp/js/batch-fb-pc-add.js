function batchListStore(title,url,w,h){
	layer_show(title,url,w,h);
}

$(function(){
	$.ajax({
        url:pageContext+"/spBatchController/getSpBatchList",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        data:{"fbstatus":"0"},    //参数值
        type:"GET",   //请求方式
        success:function(data){
        	 $('#tbody').html(PackagData(data));
        	 $("#check-all").click(function(){
        		 if($("#check-all").is(":checked")){
        			 $("#check-all").prop("checked",true);
        			 $("#tbody input[type=checkbox]").prop("checked",true);
        			 $("#tbody li").css('background-color','#f5f5f5');
        		 }else{
        			 $("#check-all").prop("checked",false);
        			 $("#tbody input[type=checkbox]").prop("checked",false);
        			 $("#tbody li").css('background-color','');
        		 }
        	 });
        	  $("#tbody input[type=checkbox]").bind('click',function(){
 			 	 $(this).prop('checked',true).parent().parent().parent().siblings().children().children().children("input").prop('checked',false);
 			 	 $(this).parent().css('background-color','#f5f5f5').siblings().css('background-color','#f5f5f5');
 			 	 $(this).parent().parent().parent().siblings().find("li").css('background-color','');
 			});
        	 $('#total').html(data.length);
        },
        error:function(){

        }
    });
	
});


function PackagData(data){  
	var content="";  
    for(var i=0;i<data.length;i++){  
    	content+="<div class='store'><ul>";  
        content+="<li  style='width:60px;''><input type='checkbox'  id=" +data[i].id + "></li>";
        content+="<li id="+data[i].id+">"+data[i].batchcode+"</li>";
        content+="<li>"+data[i].batchname+"</li>";
        content+="<li>"+data[i].createtime+"</li>";
        content+="<li class='td-status'><span class='label label-success radius'>"+ Conversion(data[i].fbstatus,SpBatch_fbstatus) +"</span></li>";
        content+="</ul></div>";
    }  
    return content;  
} 

/*确认选中的批次*/
$(function(){
	$("#batchpcadd").click(function(){
    $.ajax({
    	url:pageContext+"/batchListController/batchListAddSpBatch",
	  	type:"post",										
	  	data: {"check_id":getNum("tbody","input","id"),"spId": $("body",parent.document).find("#fbid").val()},  
	  	dataType:"json",
	  	async:false,  
	    cache:false,
    	success:function(data){
    		if(data.success){
    			alert(data.msg);
    		   window.parent.location.reload();
    		}else{
    			alert(data.msg);
    		}
    	}
    });
   });
});