
/*关联门店*/
function batchStore(title,url,w,h){
	var obj = null;
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			obj = $(this);
		}
	});
	if(obj != null){
		layer_show(title,url,w,h);
		$("#tbody").addClass(""+$("body",parent.document).find("#tbody").attr("class")+"");
	}else{
		layer.alert("请选择一个批次,再关联门店！");
	}
	
}
 /*新增批次*/
 function batchpcAdd(title,url,w,h){
     layer_show(title,url,w,h);
     $("#tbody").addClass(""+$("body",parent.document).find("#tbody").attr("class")+"");
 }
 
$(function(){
	document.getElementById("fbid").value = $("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id");
	demo(); 
});

function demo(curr){  
	var fbid=$("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").eq(0).attr("id");
	var batchname= $("#batchname").val();
	var startdate=$("#logmin").val();
	var enddate= $("#logmax").val();
    var pageSize = 10;  
    $.getJSON(pageContext+'/batchListController/getBatchListPageModelPage', {
        page: curr || 1,  			//当前页
        pageSize: pageSize,			//当前页总记录数
        fbid:fbid,
        batchname:batchname,
        startdate: startdate,
        enddate: enddate
    },  
    function (res){ 
          laypage({  
                cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div> 按钮容器
                pages: res.pages, //通过后台拿到的总页数  
                curr: curr || 1,  
                skip: true, //是否开启跳页  
                first: '首页', //若不显示，设置false即可  
                last: '尾页', //若不显示，设置false即可  
                prev: '<', //若不显示，设置false即可  
                next: '>', //若不显示，设置false即可  
                jump: function (obj,first) { //触发分页后的回调  
                     if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr  
                         demo(obj.curr);  
                     	}  
                	}  
            });  
             $('#tbody').html(PackagData(res));  //内容容器
              $("input[type=checkbox]").bind('click',function(){
			 	 $(this).attr('checked','checked').parent().parent().siblings().children().children("input").removeAttr('checked');
			 	 $(this).parent().parent().css('background-color','#f5f5f5').siblings().css('background-color','');
			});
             $('#total').html(res.total);  
    	});  
}  

//内容
function PackagData(res){  
    	var content="";  
        for(var i=0;i<res.list.length;i++){
        	content+="<tr class='text-c'>";
            content+="<td><input type='checkbox' id=" +res.list[i].id+ " batchid = "+res.list[i].batchid+"></td>";
            content+="<td>"+res.list[i].batchcode+"</td>";
            content+="<td>"+res.list[i].batchname+"</td>";
            content+="<td>"+res.list[i].createtime+"</td>";
            content+="<td class='td-status'><span class='label label-success radius'>"+ Conversion(res.list[i].status,batchlist_status) +"</span></td>";
            content+="<td><a class='btn btn-danger radius' href = 'javascript:;' onclick = 'deleteOperation(this)' style='height:20px;line-height: 12px;'> 删除</a></td>";
            content+="</tr>";
        }  
        return content;  
} 

//确认
function batchfbConfirm(){
	layer_close();
}
function deleteOperation(obj){
	//页面上的batchid就是spbatch表的id
	var spbatchId = $(obj).parent().parent().children().children("input").attr("batchid");
	//fbid
	var fbId = $("#fbid").val();
	//页面上的batchlistid
	var batchListId = $(obj).parent().parent().children().children("input").attr("id");
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
		    url:pageContext+"/batchListController/deleteBatchList",    
		    dataType:"json",   
		    async:true,
		    data:{"spbatchId":spbatchId,"fbId":fbId,"batchListId":batchListId},    
		    type:"POST",   
		    success:function(data){
		    	if(data.success){
		    		alert(data.msg);
		    		$(obj).parent().parent().remove();
		    	}else{
		    		alert(data.msg);
		    	}
		    }
		});
		layer.close(index);
	});
}

//搜索
$("#search").click(function(){
    demo();
});