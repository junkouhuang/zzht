/*浏览图片*/
$(function(){
	var id = $("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id");
	$.ajax({
		url:pageContext+"/carouselController/getCarouselImageList",
		dataType:"json",   
		async:false,
		type:"GET",
		success:function(data){
			$("#tbody").html(PackagData(data));
			$("#total").html(data.length);
		}
	});
});
function PackagData(data){
	var content = "";
	for(var i = 0; i < data.length; i++){
		content += "<div float:right style='width:140px; min-height:224px; float:left; position:relative; border:3px solid #C0C0C0; margin:5px;' id ="+data[i].id+">";
		if(data[i].top == 1){
			content += "<span class='label label-success radius' style='margin-right: 2px;'>首图</span>";
		}
		content += "<a href='javascript:;' onclick='setTop(this)' class='label label-success radius' style='margin-right: 2px;'>设为首图</a>";
		content += "<div style='width:140px;'><img style='width:80%;'src="+data[i].url+"></div>";
		content += "<a href='javascript:;' onclick='datadel(this)' class='btn btn-danger radius' style='position:absolute;bottom:0;left: 0; margin: 5px 0px;'><i class='Hui-iconfont'>&#xe6e2;</i> 删除图片</a>";
		//图片序号，判断图片序号是否为空
		if(data[i].number == null || data[i].number == ""){
			content += "<div style='float:right;'><input class='picnumber' maxlength='2' type='text' style='width:25px; font-size:18px; border:1px solid #400000;'></div>";
		}else{
			content += "<div style='float:right;'><input class='picnumber' maxlength='2' value="+data[i].number+" type='text' style='width:25px; font-size:18px; border:1px solid #400000;'></div>";
		}
		content += "</div>";
	}
	return content;
}

/*删除图片*/
function datadel(obj){
	var imageId = $(obj).parent().attr("id");
	layer.confirm('确认删除吗？',function(index){
		$.ajax({
			url:pageContext+"/carouselController/delCarouseImageByid/"+imageId,
			dataType:"json",   
			async:true,
			type:"DELETE",
			success:function(data){
				if(data.success){
					$(obj).parent().remove();
					alert(data.msg);
					if($("#total").html()==1){
						window.parent.location.reload();
					}else{
						window.location.reload();
					}
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
	});
}

function upload(title, url, w, h) {
    layer_show(title, url, w, h);
}


/*设置首图*/
function setTop(obj){
    var imageId = $(obj).parent().attr("id");
    $.ajax({
        url:pageContext+"/carouselController/updateCarouseImageTopByid/"+imageId,
        dataType:"json",
        async:false,
        type:"post",
        success:function(data){
            alert(data.msg);
            if(data.success){
                window.location.reload();
            }
        }
    });
}

/*序号框*/
$(function(){
    //限制序号框只能输入数字
    $(".picnumber").keyup(function(){
        $(this).val($(this).val().replace(/[^\d]/g,""));
    });

    //当焦点落在input框时，获取input框的值
    //currentlyVar为当前input框的值
    var currentlyVar = null;
    $(".picnumber").focus(function(){
        currently = $(this).val();
    });

    //当输入完数字，焦点离开input框时，请求后台保存序号
    $(".picnumber").blur(function(){
        var reg = /^[0-9]*$/;

        //判断输入的序号，不等于'' && 等于数字 && 不等于上一次的值 就为true
        if($(this).val() != '' && reg.test($(this).val()) && $(this).val() != currently){

            //获取当前的图片id
            var id = $(this).parent().parent().attr("id");

            $.ajax({
                url:pageContext+"/carouselController/updateCarouseImageNumber",
                dataType:"json",
                async:false,
                data:{"id":id,"number":$(this).val()},
                type:"post",
                success:function(data){
                    if(!data.success){
                        layer.alert(data.msg);
                    }
                }
            });
        }
    });
});
