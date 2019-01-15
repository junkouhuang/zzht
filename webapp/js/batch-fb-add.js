//获取发布号
$(function(){
	 $.ajax({
		    url:pageContext+"/seqInfoController/genarateSeqno",    //请求的url地址
		    dataType:"text",   
		    async:true,//请求是否异步，默认为异步true指ajax请求和其后面的操作是异步执行，同步false指把整个浏览器锁死，执行完才能有其它操作，这也是ajax重要特性,
		    data:{businessType:"1"},    //参数值
		    type:"POST",   //请求方式
		    success:function(data){
		        $("#fbcode").val(data);
		    }
	});
});

//是否允许选择时间
function isCheck(o){
	if($(o).hasClass("can1")){
        $(o).removeClass("can1");
        $(".check1").attr("disabled","disabled");
        $(".check1").val("");
	}else{
        $(o).addClass("can1");
        $(".check1").removeAttr("disabled");
	}
    if($(o).hasClass("can2")){
        $(o).removeClass("can2");
        $(".check2").attr("disabled","disabled");
        $(".check2").val("");
    }else{
        $(o).addClass("can2");
        $(".check2").removeAttr("disabled");
    }
	if($(o).hasClass("can3")){
        $(o).removeClass("can3");
        $(".check3").attr("disabled","disabled");
        $(".check3").val("");
	}else{
        $(o).addClass("can3");
        $(".check3").removeAttr("disabled");
	}
}
//提交表单
var parm={};
function submitFbForm(){
	var fbcode=$("#fbcode").val();
	var fbname=$("#fbname").val();
	var startdateJudge=$("#startdate").val();
	var enddateJudge=$("#enddate").val();
	var deliverydateJudge=$("#deliverydate").val();
	var startdate=$("#startdate").val();
	var enddate=$("#enddate").val();
	var deliverydate=$("#deliverydate").val();
	var fbtype=$("#fbtype").find("option:selected").val();

	startdateJudge= startdateJudge.replace(/-/g,"/"); 
	enddateJudge=enddateJudge.replace(/-/g,"/"); 
	deliverydateJudge=deliverydateJudge.replace(/-/g,"/");       
	
    var a =(Date.parse(enddateJudge)-Date.parse(startdateJudge))/3600/1000;
    var b =(Date.parse(deliverydateJudge)-Date.parse(startdateJudge))/3600/1000;
	    if(fbname==""){
	    	layer.alert("请填写发布名称！");
	    	return false;
	    }
	    if(a<0){  
	    	layer.alert("开始订货时间不能大于截止订货时间!");  
	        return false;
	    }
	    if(b<0){  
	    	layer.alert("预计发货时间不能小于开始订货时间!");  
	        return false;
	    }
	    console.info("sdss");
	    var batchfb = new Object();
    	batchfb.fbcode = fbcode;
    	batchfb.fbname = fbname;
    	batchfb.startdate = startdate;
    	batchfb.enddate = enddate;
    	batchfb.deliverydate = deliverydate;
    	batchfb.fbtype = fbtype;

	 $.ajax({
		    url:pageContext+"/newProduct/saveBatchFb",    //请求的url地址
         	contentType:'application/json;charset=utf-8',
         	dataType:"JSON",
		    async:false,
            data:JSON.stringify(batchfb),
         	//data:{"fbcode":fbcode,"fbname":fbname,"startdate":startdate,"enddate":enddate,"deliverydate":deliverydate,"fbtype":fbtype},
		    type:"POST",   //请求方式
		    success:function(data){
		    	/*var date=eval("("+data+")");
		    	if(date.msg=='success'){
		    		layer.alert("新增成功!");
		    		window.parent.location.reload();
		    	}else if(date.msg == 'fail'){
		    		alert("新增失败!");
		    	}else if(date.msg =='error'){
		    		alert("系统错误！");
		    	}*/
		    	if(data.success){
                    layer.alert(data.msg);
                    window.parent.location.reload();
				}else {
                    layer.alert(data.msg);
				}
		    }
	});
}
