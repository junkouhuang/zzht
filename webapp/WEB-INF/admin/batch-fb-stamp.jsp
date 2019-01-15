<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<jsp:include page="cssPage.jsp"></jsp:include>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>打印预览</title>
<script type="text/javascript">
	var pageContext="${pageContext.request.contextPath}";
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/printShou.css"  media="print"/>

<style type="text/css">
	.stampCss { width: 910.98px; margin:0 auto;}
	
	.orderTop { float: left; width: 910px; height: 100px;}
	.orderMiddle { float: left; width: 910px; height: 30px;}
	.orderContent { float: left; width: 910px;}
	.orderBotton { float: left; width: 910px; height: 30px;}
	
	.orderpic { position: absolute;}
	
	.fhtitle { position: absolute; padding: 0px 395.49px 50px 315.49px;}
	
	.ordercode { position: absolute; width: 150px; margin:0 auto; padding: 10px 50px 50px 750px;}
	.barNumber { margin-left: 43px;}
	
	.createOddTime {float: left;width: 250px; height: 30px;}
	.mdcode {float: left; width: 150px; height: 30px;}
	.cwcode {float: left; margin-left: 10px; width: 150px; height: 30px;}
	.mdmc {float: left; margin-left: 10px; width: 300px; height: 30px;}

	table,table tr th, table tr td { border:1px solid black; text-align: center; border-collapse:collapse;}
	table{ width: 100%; table-layout: fixed;}
	td { word-wrap:break-word; word-break:break-all;}
	span { width: 110px;}
	
	.styleNumber { width: 150px;}
	
	.createOdd {float: left;width: 300px; height: 30px;}
	.customerService {float: left; margin-left: 50px; width: 200px}
	.cwqz {float: left; margin-left: 30px; width: 200px}
	
	/* .lastPage {margin-left: 850px;} */

	.stampBtn {float: left; padding: 0px 200px 50px 420px;}
</style>
</head>
<body>
<%-- 		<div class="stampCss" id="stampId">
			<div class="orderTop">
				<div class="orderpic">
					<img alt="" src="">
				</div>
				
				<div class="fhtitle"><h3>发货明细单</h3></div>
				
				<div class="ordercode">
					<div class="barPic"></div>
					<div class="barNumber">
						<span></span>
					</div>
				</div>
			</div>
			
			<div class="orderMiddle">
				<div class="createOddTime">制单时间: <span><fmt:formatDate value="<%=new Date()%>" pattern="yyyy/MM/dd HH:mm:ss"/></span></div>
				
				<div class="mdcode">店号: <span></span></div>
				
				<div class="cwcode">财务编码: <span></span></div>
				
				<div class="mdmc">店名: <span></span></div>
			</div>
			
			<div class="orderContent">
				<table>
					<thead>
						<tr>
							<th class="styleNumber">款号</th>
							<th>品名</th>
							<th>颜色</th>
							<th>尺码</th>
							<th>单价</th>
							<th>数量</th>
							<th>金额</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>			
			
			<div class="orderBotton">
				<div class="createOdd">制单人员: <span></span></div>
				<div class="customerService">客服:<span></span></div>
				<div class="cwqz">财务签字:<span></span></div>
			</div>
			
				
		</div> --%>
		<div class="stampCss" id="stampId">
			<div class="orderTop">
				<div class="orderpic">
					<img alt="" src="">
				</div>
				
				<div class="fhtitle"><h3>发货明细单</h3></div>
				
				<div class="ordercode">
					<div class="barPic"></div>
					<div class="barNumber">
						<span>${fhDetailOdd.ordercode}</span>
					</div>
				</div>
			</div>
			
			<div class="orderMiddle">
				<div class="createOddTime">制单时间: <span><fmt:formatDate value="<%=new Date()%>" pattern="yyyy/MM/dd HH:mm:ss"/></span></div>
				
				<div class="mdcode">店号: <span>${fhDetailOdd.mdcode}</span></div>
				
				<div class="cwcode">财务编码: <span>${fhDetailOdd.cwcode}</span></div>
				
				<div class="mdmc">店名: <span>${fhDetailOdd.mdmc}</span></div>
			</div>
			
			<div class="orderContent">
				<table>
					<thead>
						<tr>
							<th class="styleNumber">款号</th>
							<th>品名</th>
							<th>颜色</th>
							<th>尺码</th>
							<th>单价</th>
							<th>数量</th>
							<th>金额</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="PageFhOdd" items="${fhDetailOdd.fhOddList}">
						<tr>
							<td>${PageFhOdd.spcode}</td>
							<td>${PageFhOdd.spmc}</td>
							<td>${PageFhOdd.ys}</td>
							<td>${PageFhOdd.cm}</td>
							<td>${PageFhOdd.price}</td>
							<td>${PageFhOdd.sl}</td>
							<td>${PageFhOdd.je}</td>
						</tr>
					</c:forEach>
						<tr>
							<td class="total" colspan= 5 style="text-align: right;">汇总:</td>
							<td class="totalNumber" style="font-weight: bold;">${fhDetailOdd.totalNumber}</td>
							<td class="totalMoney" style="font-weight: bold;">${fhDetailOdd.totalMoney}</td>
						</tr>
					</tbody>
				</table>
			</div>			
			
			<div class="orderBotton">
				<div class="createOdd">制单人员: <span>${fhDetailOdd.originator}</span></div>
				<div class="customerService">客服:<span></span></div>
				<div class="cwqz">财务签字:<span></span></div>
			</div>
			
				
		</div>
		
		<div class="stampBtn">
			<a class="btn btn-primary radius" data-title="确定打印" onclick="print()" href="javascript:;" style="margin: 4px 0;"><i class="Hui-iconfont">&#xe600;</i>确定打印</a>
		</div>
		
<jsp:include page="jsPage.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jqprint-0.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-barcode.js"></script>

<script type="text/javascript">
function print(){
	$(".stampCss").jqprint({
		debug: false,            
		importCSS: true,         
		printContainer: true,    
		operaSupport: false
	});
}

/* $(function(){
	$.ajax({
		url:pageContext+"/fhOrdersController/stampFhDetail",
		dataType:"json",
		async:false,
		data:{"id":$("body",parent.document).find("#tbody").find("input[type='checkbox']:checked").attr("id")},
		type:"POST",   //请求方式
		success:function(data){
			if(data.success){
				filling(data.obj);
			}else{
				alert(data.msg);
			}
		}
	});
	
});

//填充数据的方法
function filling(data){
	//单号
	$(".barNumber").children().html(data.ordercode);
	//店号
	$(".mdcode").children().html(data.mdcode);
	//财务编码
	$(".cwcode").children().html(data.cwcode);
	//店名
	$(".mdmc").children().html(data.mdmc);
	
	//制单人员
	$(".createOdd").children().html(data.originator);
	
	//计算有多少个tr，一页45个tr，一个tr为23px，一页高为1056px；
	var trPx = 0;
	
	//页数
	var pageNum = 1;
	
	//第一页，并且只有一次
	var pageOne = true;
	
	//计算fhOddList的长度
	var listLength = data.fhOddList.length;
	
	//表格
	var con = "";
	$.each(data.fhOddList,function(index,item){
		con +="<tr>";
		con +="<td>"+item.spcode+"</td>";
		con +="<td>"+item.spmc+"</td>";
		con +="<td>"+item.ys+"</td>";
		con +="<td>"+item.cm+"</td>";
		con +="<td>"+item.price+"</td>";
		con +="<td>"+item.sl+"</td>";
		con +="<td>"+item.je+"</td>";
		con +="</tr>";
		
		trPx++;
		
		//第一页 52
		if(trPx == 52 && pageOne){
			$("tbody").append(con);
			con = "";
			con += "<tr><td colspan = 7 style='text-align: right;'>第"+pageNum+"页</td></tr>";
			$("tbody").append(con);
			trPx = 0;
			con = "";
			pageOne = false;
			pageNum ++;
		}
		
		
		if(trPx == 58){
			$("tbody").append(con);
			con = "";
			con += "<tr><td colspan = 7 style='text-align: right;'>第"+pageNum+"页</td></tr>";
			$("tbody").append(con);
			trPx = 0;
			con = "";
			pageNum ++;
		}

	});
	
	//汇总
	con += "<tr><td class='total' colspan= 5 style='text-align: right;'>汇总:</td>";
	con += "<td class='totalNumber' style='font-weight: bold;'>"+data.totalNumber+"</td>";
	con += "<td class='totalMoney' style='font-weight: bold;'>"+data.totalMoney+"</td></tr>";

	$("tbody").append(con);
	
	//最后一页
	$(".stampCss").append("<div class='lastPage'><p>第"+pageNum+"页</p></div>");
}

 */

window.onload = function(){
	$(".barPic").empty().barcode($(".barNumber span").text(),"code128",{barWidth:1.5, barHeight:50,showHRI:false});
	
	window.history.pushState({}, "zhizhi", "/..");
};
</script>
</body>
</html>