/*浏览图片*/
$(function(){
	var spid = getQueryString("spid");
	$.ajax({
		url:pageContext+"/gysspxx/getSpImageBySpid/"+spid,
		dataType:"json",   
		async:false,
		type:"post",
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
        content += "<div style='width:140px;'><img style='width:100%;'src="+data[i].path+"></div>";
		content += "</div>";
	}
	return content;
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};