/*获取发布号数据*/
function demo(curr){  
	var fbcode=$("#fbcode").val();
	var fbname=$("#fbname").val();
    var startdate=$("#logmin").val();
    var enddate=$("#logmax").val();
    var pageSize = 8;
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
            content+="<td>"+res.list[i].fbname+"</td>";
            content+="<td>"+res.list[i].startdate+"</td>";
            content+="<td class='td-status'><span class='label label-success radius ' currentStatus ="+res.list[i].status+" >"+ Conversion(res.list[i].status,batchfb_status) +"</span></td>";
            content+="</tr>";
        }  
        return content;  
}  

 

/*选择行变色并打钩*/
$(document).ready(function(){
    demo();  	
	/*搜索*/
    $("#search").click(function(){
    	demo();  
    });
});

function formData() {
    var fbid = '';
    $("#tbody").find("input[type='checkbox']").each(function () {
        if ($(this).is(":checked")) {
            fbid = $(this).attr("id");
            return false;
        }
    });
    return fbid;
}