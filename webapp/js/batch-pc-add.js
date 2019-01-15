
//选择类别组加载商城大类
//当前选中的类别id
var thisSelectCategoryId = "";
function selectCategoryGroupLoadCategory(thisSelect){
	var categoryGroupId = $(thisSelect).val();
	if(categoryGroupId == ""){
		return;
	}
	if(categoryGroupId == thisSelectCategoryId){
		return;
	}
	thisSelectCategoryId = categoryGroupId;
	
	$.ajax({
    	url:pageContext+"/spBatchController/getAllCategoryInfo",
	  	type:"post",
	  	data : {"categoryGroupId" : categoryGroupId},
	  	dataType:"json",
	  	async:false,  
    	success:function(data){
    		var content = "<option disabled selected value=''>请选择商城大类</option>";
    		$.each(data, function(index, item){
    			content += "<option value='"+item.id+"'>"+item.categoryname+"</option>"
    		});
    		
    		$(".categorySelect").html(content);
    		
    	}
    });	
}

//选择商城大类加载商城子类
//当前选中的商城大类id
var thisSelectMallId = "";
function selectCategoryLoadSubCategory(thisSelect){
	var categoryId = $(thisSelect).val();
	if(categoryId == ""){
		return;
	}
	if(categoryId == thisSelectMallId){
		return;
	}
	thisSelectMallId = categoryId;
	
	$.ajax({
		url:pageContext+"/spBatchController/getAllSubCategoryInfo",
	  	type:"post",
	  	data : {"categoryId" : categoryId},
	  	dataType:"json",
	  	async:false,  
	  	success:function(data){
	  		var content = "<option disabled selected value=''>请选择商城子类</option>";
	  		$.each(data, function(index, item){
	  			content += "<option value='"+item.id+"'>"+item.subcategoryname+"</option>"
	  		});
  		
	  		$(".subCategorySelect").html(content);
  		
	  	}
	});	
}

//保存
function submitSpBatchForm(){
	$.ajax({
		url:pageContext+"/spBatchController/saveSpBatch",
	  	type:"post",
	  	data : $("#addSpBatchForm").serialize(),
	  	dataType:"json",
	  	async:false,  
	  	success:function(data){
	  		if(data.success){
	  			hideNav();
	  			window.location.reload(true);
	  			/*cleanAddPage();
	  			addListAData(data.obj);*/
	  		}else{
	  			layer.alert(data.msg);
	  		}
	  	}
	});
}

//清空新增页面
function cleanAddPage(){
	//清空表单
	//清空批次code
	$(".batchcode").val("");
	//清空批次名称
	$(".batchname").val("");
	//档次类型选择默认
	$(".typenameSelect option[value='C类']").attr("selected", false);
	$(".typenameSelect option[value='C类']").attr("selected", true);
	//清空品牌
	$(".brand").val("");
	//地域属性选择默认
	$(".dqSelect option[value='南']").attr("selected", true);
	//尺码偏向选择默认
	$(".cmpxSelect option[value='L']").attr("selected", false);
	$(".cmpxSelect option[value='L']").attr("selected", true);
	//季节选择默认
	$(".jjSelect option[value='春秋']").attr("selected", false);
	$(".jjSelect option[value='春秋']").attr("selected", true);
	//是否可退选择默认
	$(".returmtypeSelect option[value='1']").attr("selected", false);
	$(".returmtypeSelect option[value='1']").attr("selected", true);
	//起订数量默认值1
	$(".leastorderqty").val("1");
	//清空材质
	$(".texture").val("");
	//类别组默认不选择
	$(".categoryGroupSelect option[disabled]").attr("selected", false);
	$(".categoryGroupSelect option[disabled]").attr("selected", true);
	thisSelectCategoryId = "";
	//商城大类选择默认，并清空
	$(".categorySelect option[value='']").attr("selected", false);
	$(".categorySelect option[value='']").attr("selected", true);
	thisSelectMallId = "";
	$(".categorySelect").find("option").each(function(){
		if($(this).val() != ""){
			$(this).remove();
		}
	});
	//商城子类选择默认，并清空
	$(".subCategorySelect option[value='']").attr("selected", false);
	$(".subCategorySelect option[value='']").attr("selected", true);
	$(".subCategorySelect").find("option").each(function(){
		if($(this).val() != ""){
			$(this).remove();
		}
	});
	//生成时间清空
	$(".producetext").val("");
	//描述1清空
	$(".text1").val("");
	//描述2清空
	$(".text2").val("");
	//描述3清空
	$(".text3").val("");
	//备注清空
	$(".bz").val("");
	//价格描述清空
	$(".pricedes").val("");
	//商城批次类型默认不选择
	$(".radio-1").attr("checked",false);
	$(".radio-2").attr("checked",false);
	$(".radio-3").attr("checked",false);
}

//批次列表增加一条数据
function addListAData(data){
	//添加一条数据到列表
	var strs = new Array();
	//strs[0]是批次id，strs[1]批次号，strs[2]批次名称，strs[3]创建时间
	strs = data.split(",");
    
	var content = "<tr class='text-c'>" +
			"<td><input type='checkbox' id=" + strs[0] + "></td>" +
			"<td class='pkgtype' style='display:none'>0</td>" +
			"<td id=" + strs[0] + ">" + strs[1] + "</td>" +
			"<td>" + strs[2] + "</td>" +
			"<td class='td-status'><span class='label btn-defaultradius' hasphoto=''>没有图片</span></td>" +
			"<td>" +strs[3]+ "</td>" +
			"<td class='td-status'><span class='label label-warning  radius ' currentStatus ='0' >默认</span></td>" +
			"</tr>";
	$("#tbody").prepend(content);
}

