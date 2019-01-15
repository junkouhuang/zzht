/*发布*/
function batchfbUpdateStatus(){
	var obj = null;
	var fbId = $("#tbody").find("input[type='checkbox']:checked").attr("id");
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			obj = $(this);
		}
	});
	if(obj != null){
		var status=obj.parent().siblings(".td-status").children().attr("currentstatus");
		if(status == 1 ){
			layer.confirm('确认要发布吗？',function(index){
				$.ajax({
				    url:pageContext+"/newProduct/releaseBatchFb",    //请求的url地址
				    dataType:"json",   //返回格式为json
				    async:true,
				    data:{fbId:fbId},    //参数值
				    type:"post",   //请求方式
				    success:function(data){
				    	console.log(data);
				        if(data.success){
				        	alert(data.msg);
				        	window.location.reload();
				        }else{
				        	if(data.obj != null){
				        		layer.alert("已有发布,请下架之前的发布后再重新发布!");
				        	}else{
				        		alert(data.msg);
				        	}
				        }
				    }
				   
				});
				layer.close(index);
			});
		}else if(status == 2){
			layer.alert("被选中的已经发布，不能再次发布！");
		}else if(status == 3){
			layer.alert("被选中的已经下架，不能再次发布！");
		}else{
			layer.alert("请确认后再点击发布！");
		}
	}else{
		layer.alert("请选择发布号，再点击发布！");
	}
}
/*获取发布号数据*/
function demo(curr){
   var fbcode=$("#fbcode").val();
   var fbname=$("#fbname").val();
   var startdate=$("#logmin").val();
   var enddate=$("#logmax").val();
   var pageSize = 10;

   $.getJSON(pageContext+'/newProduct/getBatchFbList', {
        page: curr || 1,  			//当前页
        pageSize: pageSize,  				//当前页总记录数
        fbcode:fbcode,
        fbname:fbname,
        startdate:startdate,
        enddate:enddate
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
            content+="<td ><input type='checkbox' id=" +res.list[i].id+"  class='mark'></td>";
            content+="<td class='fbcode'>"+res.list[i].fbcode+"</td>";
            content+="<td class='batchcode' style='display:none'>"+res.list[i].batchcode+"</td>";
            content+="<td>"+res.list[i].fbname+"</td>";
            content+="<td>"+res.list[i].startdate+"</td>";
            if( Conversion(res.list[i].status,batchfb_status) =="默认"){
            	content+="<td class='td-status'><span class='label label-primary  radius ' currentStatus ="+res.list[i].status+" >"+ Conversion(res.list[i].status,batchfb_status) +"</span></td>";
            }
            if(Conversion(res.list[i].status,batchfb_status) =="确认"){
            	content+="<td class='td-status'><span class='label label-warning  radius ' currentStatus ="+res.list[i].status+" >"+ Conversion(res.list[i].status,batchfb_status) +"</span></td>";
            }
            if(Conversion(res.list[i].status,batchfb_status) =="发布"){
            	content+="<td class='td-status'><span class='label label-success radius ' currentStatus ="+res.list[i].status+" >"+ Conversion(res.list[i].status,batchfb_status) +"</span></td>";
            }
            if( Conversion(res.list[i].status,batchfb_status) =="下架"){
                content+="<td class='td-status'><span class='label btn-danger radius ' currentStatus ="+res.list[i].status+" >"+ Conversion(res.list[i].status,batchfb_status) +"</span></td>";
            }
            if( Conversion(res.list[i].status,batchfb_status) =="undefined"){
                content+="<td class='td-status'><span class='label btn-default radius ' ></span></td>";
            }
            content+="</tr>";
        }  
        return content;  
}  

 /*新增发布号*/
 function batchfbAdd(title,url,w,h){
     layer_show(title,url,w,h);
 }
 
/*关联批次*/
/*function batchpc(title,url,w,h){
   var obj = null;
	var fbId = $("#tbody").find("input[type='checkbox']:checked").attr("id");
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			obj = $(this);
		};
	});
	if(obj != null){
		var status=obj.parent().siblings(".td-status").children().attr("currentstatus");
		if(status == 0 ){
			layer_show(title,url,w,h);
			$("#tbody").addClass(""+getNum("tbody","input","id")+"");
		}else if(status == 2){
			layer.alert("被选中的已经发布，不能再关联批次！");
		}else{
			layer.alert("新增状态的才能关联批次！");
		}
	}else{
		layer.alert("请选择发布号,再关联批次！");
	}
}*/

/*选择行变色并打钩*/
$(document).ready(function(){
    demo();  	
	/*搜索*/
    $("#search").click(function(){
    	demo();  
    });
});

/*修改*/
function batchfbUpdate(title,url,w,h){
	var obj = null;
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			obj = $(this);
		}
	});
	if(obj != null){
		layer_show(title,url,w,h);
		var status=obj.parent().siblings(".td-status").children().attr("currentstatus");
/*		if(status == 0 ){
				layer_show(title,url,w,h);
		}else{
				layer.alert("已确认,不能再修改！");
		}*/
	}else{
		layer.alert("请选择发布号,再修改批次！");
	}
	
}

/*确认*/
function batchfbConfirm(){

	var obj = null;
	var fbId = $("#tbody").find("input[type='checkbox']:checked").attr("id");
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			obj = $(this);
		}
	});

	var status=obj.parent().siblings().children().attr("currentstatus");
    console.log("====");
    console.log(status);
    console.log("====");
	if(obj != null){
		if(status == 0){
			$.ajax({
			    url:pageContext+"/newProduct/confirmBatchFb",    //请求的url地址
			    dataType:"json",   //返回格式为json
			    async:true,
			    data:{fbId:fbId},    //参数值
			    type:"post",   //请求方式
			    success:function(data){
			        if(data.success){
			        	alert(data.msg);
			        	window.location.reload();
			        }else{
			        	alert(data.msg);
			        }
			    }
			   
			});
		}else if(status == 1){
			layer.alert("该发布号现已是确认状态！");
		}else if(status == 2){
			layer.alert("现为发布状态，不能确认！");
		}else if(status == 3){
			layer.alert("现为下架状态，不能确认！");
		}
	}else{
		layer.alert("请勾选后，再点击确认！");
	}
	
}

/*下架*/
function offBatchFb(){
	var obj = null;
	var fbId = $("#tbody").find("input[type='checkbox']:checked").attr("id");
	var status = $("#tbody").find("input[type='checkbox']:checked").parent().parent().children(".td-status").children().attr("currentStatus");
	$("#tbody").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			obj = $(this);
		}
	});
	if(obj != null){
		//状态为2的时候才能下架
		if(status == 2){
			layer.confirm('确定要下架吗？',function(index){
				$.ajax({
				    url:pageContext+"/newProduct/offBatchFb",    //请求的url地址
				    dataType:"json",   //返回格式为json
				    async:true,
				    data:{fbId:fbId},    //参数值
				    type:"post",   //请求方式
				    success:function(data){
				        if(data.success){
				        	alert(data.msg);
				        	window.location.reload();
				        }else{
				        	alert(data.msg);
				        	layer.close(index);
				        }
				    }
				});
			});
		}else{
			layer.alert("选中的发布，不能下架！");
		}
	}else{
		layer.alert("请勾选后，再点击下架！");
	}
}

//删除发布号
function  deleteBatchFb(){
	var fbId=$("input[type='checkbox']:checked").attr("id");
	 $.ajax({
		    url:pageContext+"/batchFbController/batchDelete",    //请求的url地址
		    dataType:"text",
		    async:true,
            data:{"fbid":fbId},
		    type:"POST",   //请求方式
		    success:function(data){ 
		    	if(data=="success"){
		    		alert("删除成功!");
		    		window.location.reload();
		    	}else if(data == 'fail'){
		    		alert("删除失败!");
		    	}else if(data =='error'){
		    		alert("系统错误！");
		    	}
		    }
	});
}

/*上传图片*/
function upload(title,url,w,h){
  layer_show(title,url,w,h);
}

// 补货
function bh(title,url,w,h){
	layer_show(title,url,w,h);
}
//发布单明细
function batchFbDetail(){
	var fbId=$("input[type='checkbox']:checked").attr("id");
	if(fbId == null){
		alert("请选择要查看的批次发布单！！");
	}else{
		 window.location.href =pageContext+"/reportController/exportSpxxExcel?fbid="+fbId
	}
}

function fake_click(obj) {
    var ev = document.createEvent("MouseEvents");
    ev.initMouseEvent(
        "click", true, false, window, 0, 0, 0, 0, 0
        , false, false, false, false, 0, null
        );
    obj.dispatchEvent(ev);
}

function export_raw(name, data) {
    var urlObject = window.URL || window.webkitURL || window;

    var export_blob = new Blob([data]);

    var save_link = document.createElementNS("http://www.w3.org/1999/xhtml", "a")
    save_link.href = urlObject.createObjectURL(export_blob);
    save_link.download = name;
    fake_click(save_link);
}