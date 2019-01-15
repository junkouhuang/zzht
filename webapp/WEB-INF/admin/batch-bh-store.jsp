<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/common/css/base.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>关联</title>
<link href="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<style>
#switchable {
   float: right;
}
#storeGroupData li {
   float:left;
   width:60px;
}
#mdSearch {
	float: right;
}
</style>
</head>
<body>
<div class="page-container">
	<span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="offWindows()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe6e2;</i> 确定</a>
    </span> 
	<div id="mdSearch" class="text-c" >
		<input type="text" name="" id="mdcode" placeholder=" 门店号" style="width:100px" class="input-text">
		<input type="text" name="" id="mdmc" placeholder=" 门店名称" style="width:100px" class="input-text">
		<button name="" id="searchMD" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜门店</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20" style="margin-top: 30px;"> 
		<div class="" id="switchable" >
			<ul id="storeGroupData">
					
			</ul>
		</div>
	</div>
	
	<div>
	<div class="mt-21">
			<div>
		        
				<div  class="store" >
					<ul>
						<li class="checkbox bk-gray"><input type="checkbox"/></li>
						<li>门店号</li>
						<li class="name">门店名称</li>
						<li>级别</li>
						<li>类型</li>
					</ul>
				</div>
				<div class="store"  id="store1">
					
				</div>
			<!-- 	<div  class="store" id="store2">
					
				</div> -->
			</div>
	</div>
	<div class="mt-22">
		<input type="button"  onclick="join()" value="<<"/>
	</div>
	<div class="mt-23">
		
			
			<div  class="store" >
					<ul>
						<li class="checkbox"><input type="checkbox"/></li>
						<li>门店号</li>
						<li class="name">门店名称</li>
						<li>级别</li>
						<li>类型</li>
					</ul>
			</div>
			<div id="tbody">
			
			</div>
	</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /Ã¤Â½ÂÃ¤Â¸ÂºÃ¥ÂÂ¬Ã¥ÂÂ±Ã¦Â¨Â¡Ã§ÂÂÃ¥ÂÂÃ§Â¦Â»Ã¥ÂÂºÃ¥ÂÂ»-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/js/base.js"></script>
<script type="text/javascript">
window.onload=function(){
	 var li=document.getElementById("switchable").getElementsByTagName("li");
	 for(var i=0;i<li.length;i++){
	       li[i].index=i;
	       li[i].onclick=function(){
	           for(var j=0;j<li.length;j++){
	               li[j].className="";
	               }
	           this.className="on";
	           };
	       }
};
/*加载左门店和加载分组*/
$(function(){
	var batchListId=$("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id");
	//var batchfbId=$("body",parent.document).find("#fbid").val();
	$.ajax({
        url:"${pageContext.request.contextPath}/batchBhStoresController/selectBatchBhStoreList",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        data:{"batchListId":batchListId},    //参数值
        type:"GET",   //请求方式
        success:function(data){
        	 $("#store1").html(LeftPackagData(data));
        }
    });
	//加载分组
	$.ajax({
    	url:"${pageContext.request.contextPath}/batchFbStoresController/loadSgroupList",
	  	type:"POST",
	  	dataType:"json",
	  	async:false,  
	    cache:false,
    	success:function(groupList){
    		$("#storeGroupData").html(loadGroup(groupList));
    	}
    });
	
});
//加载左门店的数据
function LeftPackagData(data){  
	var content="";  
    for(var i=0;i<data.length;i++){  
    	content+="<div class='store'><ul>";  
        content+="<li class='checkbox'><input type='checkbox'  checked='1' id="+data[i].id+"></li>";
        content+="<li id="+data[i].id+">"+data[i].mdcode+"</li>";
        content+="<li class='name'>"+data[i].mdmc+"</li>";
        content+="<li>"+data[i].storeleveltype+"</li>";
        content+="<li>"+data[i].storetype+"</li>";
        content+="</ul></div>";
    }  
    return content;  
}
//加载分组
function loadGroup(groupList){
	var content = "";
	for(var i = 0; i<groupList.length; i++){
		content += "<li><a href='javascript:;' onclick='getGroupId(this.id)' class='btn btn-primary radius' id="+groupList[i].id+">"+groupList[i].groupname+"</a></li>";
	}
	return content;
}
/*获取当前被点击的组的id*/
function getGroupId(groupId){
	loadRigthStore(groupId);
}

/*门店搜索*/
$("#searchMD").click(function(){
	loadRigthStore();
});
//加载右门店
function loadRigthStore(groupId){
	var mdcode = $("#mdcode").val();
	var mdmc = $("#mdmc").val();
	$.ajax({
        url:"${pageContext.request.contextPath}/storeController/getStoreList",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        data:{"groupId":groupId,"mdcode":mdcode,"mdmc":mdmc},    //参数值
        type:"POST",   //请求方式
        success:function(data){
        	 $('#tbody').html(PackagData(data));
        	 $("input[type=checkbox]").bind('click',function(){
			 	 $(this).attr('checked','checked').parent().parent().siblings().children().children("input").removeAttr('checked');
			 	 $(this).parent().parent().css('background-color','#f5f5f5').siblings().css('background-color','');
			});
        }
    });
}
function PackagData(data){  
	var content="";  
    for(var i=0;i<data.length;i++){  
    	content+="<div class='store'><ul>";  
        content+="<li class='checkbox'><input type='checkbox' id="+data[i].id+"></li>";
        content+="<li id="+data[i].id+">"+data[i].mdcode+"</li>";
        content+="<li class='name'>"+data[i].mdmc+"</li>";
        content+="<li>"+data[i].storeleveltype+"</li>";
        content+="<li>"+data[i].storetype+"</li>";
        content+="</ul></div>";
    }  
    return content;  
} 

/*function btn3(){
	 var batchid=$("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").eq(0).attr("id");
	 var storeIds=$("#tSel").find("input[type='checkbox']:checked").eq(0).attr("id");
	 var batchlistId=$("#tSel").find("input[type='checkbox']:checked").eq(0).attr("id");
	 $.ajax({
	    	url:"${pageContext.request.contextPath}/BatchBhStoresController/saveBatchBhStores",
		  	type:"post", 
		  	data: {"batchid":batchid,"storeIds":storeIds,"batchlistId":''},  //batchid批次id,storeid门店id,batchlistid批次列表id
		  	dataType:"json",
		  	async:false,  
		    cache:false,
	    	success:function(data){
	    		console.log(data);
	    	}
	    });
		layer_close();
}*/


/*点击  << 把右门店关联到左门店*/
function join(){
    var rightStoreData = $("#tbody").find("input[type='checkbox']:checked");
    //$("#store1").html("");
    var batchListId = $("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id");
	var batchId = $("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("batchid");
	//var batchfbId = $("body",parent.document).find("#fbid").val();
    var storeIdArray = new Array(rightStoreData.length);
    for(var i = 0; i < rightStoreData.length; i++){
    	storeIdArray[i] = rightStoreData.eq(i).attr("id");
    	//var append=data.eq(i).parent().parent().parent().html();
		//$("#store1").append(append);
    }
   	$.ajax({
   		url:"${pageContext.request.contextPath}/batchBhStoresController/saveBatchBhStoresPageModel",
   	  	type:"POST",
   	  	data:{"batchListId":batchListId,"batchId":batchId,"storeIdArray":storeIdArray.join(",")},
   	  	dataType:"json",
   	  	async:false,  
   	    cache:false,
   		success:function(data){
   			if(data.success){
   				for(var i=0;i<rightStoreData.length;i++){
   					var append=rightStoreData.eq(i).parent().parent().parent().html();
   					$("#store1").append(append);
   				}
   				alert(data.msg);
   			}else{
   				alert(data.msg);
   				return false;
   			}
   		}
   	});
  
}

/*批量删除*/
function datadel(){
	var batchListId = $("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id");
	var obj=$("#store1").find("input[type='checkbox']:checked");
	var storeIdArray = new Array(obj.length);
	for(var i=0;i<obj.length;i++){
		storeIdArray[i] = obj.eq(i).attr("id");
	}
	
	layer.confirm('确认删除吗？',function(index){
		$.ajax({
			url:"${pageContext.request.contextPath}/batchBhStoresController/deleteBatchBhStoresPageModel",
			type:"POST",
			data:{"batchListId":batchListId,"storeIdArray":storeIdArray.join(",")},
			dataType:"json",
			async:false,  
			cache:false,
		    success:function(data){
		    	if(data.success){
		    		for(var i=0;i<obj.length;i++){
		    			$("#"+obj[i].getAttribute("id")).parent().parent().remove();
		    		}
		    		alert(data.msg);
		    	}else{
		    		alert(data.msg);
		    		return false;
		    	}
		   	}
		});
		layer.close(index);
	});
}


//点击确定关闭窗口
function offWindows(){
	layer_close();
}
</script>
</body>
</html>