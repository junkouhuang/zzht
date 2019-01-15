(function(){
    console.log("ordersl:"+ordersl);
    var data = {
        width:360,
        height:200,
        maxValue:gpsl,
        xAxis:["入库","下单","发货","销售"],
        starRate:[gpsl,ordersl,fhsl,sellsl],
        rectColor:["#ff7440","#ff7440","#ff7440","#ff7440"]
    };
    var canvas,ctx;
    var x_scale = 0,y_scale = 0,heightVal=0,stepWidth=0,stepHeight=0;
    var stepYArr = [],stepXArr = [];
    var arrowWidth = 4,arrowHeight = 6;
    var stepNum = 3;
    var str1 = "件数";

    var init = function(data){
        canvas = document.getElementById("canvas");
        canvas.width = data.width;
        canvas.height = data.height;
        x_scale = data.width/10;//x轴刻度
        y_scale = data.height/10;//y轴刻度
        ctx = canvas.getContext("2d");
        drawXAxis(data.xAxis);//画X轴
        drawYaxis(data.maxValue,stepNum);//画Y轴
        drawBg();//画背景    
        drawRect(data.starRate,data.rectColor);//画柱形
        $(canvas).on("mousemove",mouseMove);
      /*  $(canvas).on("click",mouseClick);*/
    }
    /*画x轴*/
    var drawXAxis = function(xAxis){
        ctx.beginPath();//清除之前的路径，开始一条新的路径
        //画x轴横线
        ctx.moveTo(x_scale,canvas.height-y_scale);
        ctx.lineTo(canvas.width-x_scale,canvas.height-y_scale);
        //加标签
        var len = xAxis.length;
        stepWidth = (canvas.width - 2*x_scale)/len;//一个类型所占的宽度
        for(var i=0; i<len; i++){
            //画标签，默认字体为12个像素
            ctx.font = "normal normal bold 14px 微软雅黑";
            ctx.fillStyle = "#285ea6";
            //字体居中
            ctx.fillText(xAxis[i],x_scale+(i+0.5)*stepWidth-xAxis[i].length*14/2,canvas.height-y_scale +15);
            stepXArr.push(x_scale+(i+1)*stepWidth);
        }
        ctx.stroke();
        //加箭头
        drawArrow(canvas.width-x_scale,canvas.height-y_scale,false);
        ctx.fillText("类型",canvas.width-x_scale,canvas.height-y_scale-10);
    }

    //画y轴
    var drawYaxis = function(maxValue,step){
        ctx.beginPath();
        //画Y轴线
        ctx.moveTo(x_scale,y_scale);
        ctx.lineTo(x_scale,canvas.height-y_scale);

        //加标签
        stepHeight = (canvas.height - 3*y_scale)/step;
        heightVal = (canvas.height - 3*y_scale )/maxValue;//比例
        for(var i=1; i<=step; i++){
            ctx.font = "normal normal bold 14px 微软雅黑";
            //字体居中
            ctx.fillText(parseInt(maxValue/step*i),x_scale-25,canvas.height-y_scale-stepHeight*i+7);
            stepYArr.push(canvas.height-y_scale-stepHeight*i);
        }
        ctx.stroke();
        //加箭头
        drawArrow(x_scale,y_scale,true);
        //加Y轴顶部字体
        ctx.fillText(str1,x_scale-25,y_scale-8);
    }

    //画柱形图
    var drawRect = function(starRate,colorArr){
        var rectWidth = stepWidth/2;
        for(var i=0,len=starRate.length;i<len;i++){
            ctx.fillStyle = colorArr[i];
            if(i != 0){
                ctx.fillText(starRate[i]+"("+(starRate[i]/starRate[0]).toFixed(2) * 100+"%)",stepXArr[i]-stepWidth/2-rectWidth/2 ,canvas.height-y_scale-starRate[i]*heightVal -2);
            }else{
                ctx.fillText(starRate[i],stepXArr[i]-stepWidth/2-rectWidth/2 + 2,canvas.height-y_scale-starRate[i]*heightVal -2);
            }
            ctx.fillRect(stepXArr[i]-stepWidth/2-rectWidth/2,canvas.height-y_scale-starRate[i]*heightVal,rectWidth,starRate[i]*heightVal);
            ctx.fill();
        }
    }

    //画箭头
    var drawArrow = function(left,top,flag){
        ctx.beginPath();
        ctx.moveTo(left,top);
        if(flag){
            ctx.lineTo(left+arrowWidth,top);
            ctx.lineTo(left,top-arrowHeight);
            ctx.lineTo(left-arrowWidth,top);
        }else{
            ctx.lineTo(left,top-arrowWidth);
            ctx.lineTo(left+arrowHeight,top);
            ctx.lineTo(left,top+arrowWidth);
        }
        
        ctx.fillStyle = "#666";
        ctx.fill();
    }

    //画背景矩形
    var drawBg = function(){
        for(var i=0;i<stepYArr.length;i++){
            ctx.beginPath();
            ctx.fillStyle = "#f2f2f2";
            if(i%2 == 0){
                ctx.fillRect(x_scale+1,stepYArr[i],canvas.width-2*x_scale-stepWidth/4,stepHeight);
                ctx.fill();
            }
        }
    }

    //mousemove事件
    var mouseMove = function(e){
        e.preventDefault();
        var x = e.clientX;
        var y = e.clientY;          
        for(var i=0;i<data.starRate.length;i++){
            if(x>stepXArr[i]-stepWidth*3/4&&x<stepXArr[i]-stepWidth/4&&y<canvas.height-y_scale&&y>canvas.height-y_scale-data.starRate[i]*heightVal&&data.starRate[i]!=0){
                //画矩形线
                ctx.beginPath();
                ctx.strokeStyle = "#00b050";
                ctx.lineWidth = 2;
                ctx.rect(stepXArr[i]-stepWidth*3/4+2,canvas.height-y_scale-data.starRate[i]*heightVal+2,stepWidth/2-4,data.starRate[i]*heightVal-3);
                ctx.stroke();

                //显示数字
                $("#show_num").html('<div class="show_num">'+data.starRate[i]+'%('+data.starNum[i]+'个)</div><em></em>');
                $("#show_num").css({
                    "left":stepXArr[i]-stepWidth*3/4+10,
                    "top":canvas.height-y_scale-data.starRate[i]*heightVal-28
                });
                break;
            }else{
                //重绘矩形
                $("#show_num").children().remove();
                ctx.beginPath();
                ctx.strokeStyle = "#b5cb85";
                ctx.globalCompositeOperation="source-over";
                ctx.fillRect(stepXArr[i]-stepWidth*3/4,canvas.height-y_scale-data.starRate[i]*heightVal,stepWidth/2,data.starRate[i]*heightVal);
                ctx.fill();
                
            }
        }
        
    }

    //click事件
    var mouseClick = function(e){
        e.preventDefault();
        var x = e.clientX;
        var y = e.clientY;          
        for(var i=0;i<data.starRate.length;i++){
            if(x>stepXArr[i]-stepWidth*3/4&&x<stepXArr[i]-stepWidth/4&&y<canvas.height-y_scale&&y>canvas.height-y_scale-data.starRate[i]*heightVal&&data.starRate[i]!=0){
                window.location.href = "detail.html";
                break;
            }
        }
    }

    init(data);//柱状图
})();