$(function(){
	loadImage();
});


// 加载图片
function loadImage(){
    var id = getQueryVariable("id");

    // 请求后台加载数据
    requestBackEndLoadData(id);
}


// 获取父页面请求参数
function getQueryVariable(variable){
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}



// 删除图片
function deleteImage(thisObj){
    // 获取id
    var imageID = $(thisObj).attr("id");

    // 请求后台删除图片
    requestBackEndDetele(imageID);
}


// 请求后台加载数据
function requestBackEndLoadData(id){
	$.ajax({
		url:pageContext+"/goodsController/browseImage",
        type:"GET",
		dataType:"json",
		data:{"id":id},
		async:false,
		success:function(resp){
			// 填充数据到页面
            fillPageData(resp);
		}
	});
}

// 请求后台删除
function requestBackEndDetele(id){
    $.ajax({
        url:pageContext+"/goodsController/deleteImage",
        type:"POST",
        dataType:"json",
        data:{"id":id},
        async:false,
        success:function(resp){
            if(resp.success){
                window.location.reload();
            }else{
                layer.msg(resp.msg, function(){});
            }
        }
    });
}

/*删除图片*/
function datadel(obj){
	var imageId = $(obj).attr("id");
	layer.confirm('确认删除吗？',function(index){
		$.ajax({
			url:pageContext+"/goodsController/deleteImage",
			dataType:"json",   
			async:true,
			data:{"id":id},
			type:"post",  
			success:function(data){
				if(data.success){
					initImgList();
					layer.msg(data.msg);
				}else{
					if(data.obj != null){
						$(obj).parent().remove();
						alert(data.msg);
					}else{
						alert(data.msg);
					}
				}
			}
		});
		layer.close(index);
	})
}
// 填充数据到页面
function fillPageData(data){
    var content = "";
    content+="<div style='width:500px;height:362px;float:left;margin: 10px;background: #dfdfe3; position: relative;'>";
    content += "<img style='width:103px;position:relative;top:6px;'src='"+data.imgurl+"'>";
    content += "</div>";
    $("#tbody").html(content);
}


// 组装数据
var top = true;
function assembleData(data) {
    var content = "";
    content+="<div style='width:103px;height:162px;float:left;margin: 10px;background: #dfdfe3; position: relative;'>";
    content += "<img style='width:103px;position:relative;top:6px;'src='http://119.23.48.31/"+data.imgurl+"'>";
    content += "<a href='javascript:;' onclick='deleteImage(this)'  style='position:absolute;top:0;right: 0;' id="+data.id+"> <i class='glyphicon glyphicon-remove-sign'></i></a>";
    content += "<input type='text' maxlength='2' style='width:18px;height:17px;position:absolute;top:0;right: 13px;' value='"+data.number+"'/>";
    if(data.head == true && top){
        content += "<a href='javascript:;' style='color: #FF0000' class="+data.id+"><i  class='glyphicon glyphicon-flag'></i></a>";
        top = false;
    }else{
        content += "<a href='javascript:;' onclick='changeHead(this)' style='color:#C0C0C0' class="+data.id+"><i class='glyphicon glyphicon-flag'></i></a>";
    }
    content += "</div>";
    return content;
}

// 获取当前图片id
function getImageID(thisObj){
    var thisImageID = $(thisObj).prev("a").attr("id");
    return thisImageID;
}



