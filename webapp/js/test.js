$(function(){
    $("#header").height(document.body.clientHeight*0.3);
    $("#body").height(document.body.clientHeight*0.6);
    var josnData={
        "msg": "SUCCESS",
        "obj": {
            "batchcode": "P180627040",
            "createtime": 1530328596000,
            "id": 217602,
            "mdcode": "DN",
            "mdmc": "浙江省诸暨市草塔店",
            "orderamount": 556.50,
            "ordercode": "462577189188009984",
            "ordersDetailList": [{
                "amount": 159.00,
                "batchorderid": 238140,
                "cm": "L",
                "id": 473469,
                "mfsl": 1,
                "paystatus": 0,
                "price": 159.00,
                "rate": 0.50,
                "sl": 2,
                "spbatchdetailid": 13894,
                "ys": "均色"
            }, {
                "amount": 159.00,
                "batchorderid": 238140,
                "cm": "M",
                "id": 473470,
                "mfsl": 1,
                "paystatus": 0,
                "price": 159.00,
                "rate": 0.50,
                "sl": 2,
                "spbatchdetailid": 13895,
                "ys": "均色"
            }, {
                "amount": 79.50,
                "batchorderid": 238140,
                "cm": "XL",
                "id": 473471,
                "mfsl": 1,
                "paystatus": 0,
                "price": 159.00,
                "rate": 0.50,
                "sl": 1,
                "spbatchdetailid": 13897,
                "ys": "均色"
            }, {
                "amount": 159.00,
                "batchorderid": 238140,
                "cm": "XXL",
                "id": 473472,
                "mfsl": 1,
                "paystatus": 0,
                "price": 159.00,
                "rate": 0.50,
                "sl": 2,
                "spbatchdetailid": 13898,
                "ys": "均色"
            }],
            "paystatus": 3,
            "preparestatus": 3,
            "preparetype": 2,
            "refundstatus": 3,
            "refundtime": 1530612094900,
            "spbatchBasic": {
                "batchid": 8882,
                "brand": "",
                "branddes": "",
                "cz": "棉",
                "id": 8894,
                "productattr": 0,
                "productdes": "",
                "productname": "男士长袖衬衫",
                "rate": 0.50,
                "sellprice": 159.00,
                "spbatchImageList": [{
                    "id": 20322,
                    "top": 1,
                    "url": "group2/M00/00/F5/rBJO8Fs2BIaAZX2oAAD5bgfWAMU603.jpg"
                }, {
                    "id": 20323,
                    "top": 0,
                    "url": "group2/M00/00/F5/rBJO8Fs2BIeAMDF1AAFC_dCmSyI477.jpg"
                }, {
                    "id": 20324,
                    "top": 0,
                    "url": "group2/M00/00/F5/rBJO8Fs2BIeARL_iAADtPFT8NSk901.jpg"
                }, {
                    "id": 20325,
                    "top": 0,
                    "url": "group2/M00/00/F5/rBJO8Fs2BIeAct7tAAEyqjZ_u_o405.jpg"
                }, {
                    "id": 20326,
                    "top": 0,
                    "url": "group2/M00/00/F5/rBJO8Fs2BIeAaDqUAADa-okdfIs251.jpg"
                }, {
                    "id": 20327,
                    "top": 0,
                    "url": "group2/M00/00/F5/rBJO8Fs2BIeAQWH4AACdDgvdA_4093.jpg"
                }]
            },
            "status": 4,
            "storeid": 729,
            "wxOrderPickingList": [{
                "amount": 159.00,
                "cmcode": "94",
                "jhsl": 1,
                "mxcode": "60904110159994",
                "sellprice": 159.00,
                "spcode": "60904110159",
                "spmc": "男长袖衬衫"
            }, {
                "amount": 159.00,
                "cmcode": "96",
                "jhsl": 1,
                "mxcode": "6100A110159496",
                "sellprice": 159.00,
                "spcode": "6100A110159",
                "spmc": "男长袖衬衫"
            }, {
                "amount": 318.00,
                "cmcode": "97",
                "jhsl": 2,
                "mxcode": "6100A110159497",
                "sellprice": 159.00,
                "spcode": "6100A110159",
                "spmc": "男长袖衬衫"
            }, {
                "amount": 159.00,
                "cmcode": "95",
                "jhsl": 1,
                "mxcode": "61219110159595",
                "sellprice": 159.00,
                "spcode": "61219110159",
                "spmc": "男士长袖衬衫"
            }, {
                "amount": 139.00,
                "cmcode": "MM",
                "jhsl": 1,
                "mxcode": "71M00651MM",
                "sellprice": 139.00,
                "spcode": "71M0065",
                "spmc": "男士长袖衬衫"
            }, {
                "amount": 159.00,
                "cmcode": "LL",
                "jhsl": 1,
                "mxcode": "71M02311LL",
                "sellprice": 159.00,
                "spcode": "71M0231",
                "spmc": "男士长袖衬衫"
            }]
        },
        "success": true
    }
   console.log(josnData.obj.batchcode);
    var headerHtml;
    var ordersDetailListHtml;
    var orderPickingListHtml;
        headerHtml="<ul>"+
            "<li>批次号"+josnData.obj.batchcode+"</li>"+
            "<li>创建时间"+josnData.obj.createtime+"</li>"+
            "<li>门店名称"+josnData.obj.mdmc+"</li>"+
            "<li>订单金额"+josnData.obj.orderamount+"</li>"+
            "<li>订单号"+josnData.obj.ordercode+"</li>"+
            "</ul>";
    for(var i in josnData.obj.ordersDetailList){
        ordersDetailListHtml="<ul>"+
            "<li>尺码"+josnData.obj.ordersDetailList[i].cm+"</li>"+
            "<li>每份数量"+josnData.obj.ordersDetailList[i].mfsl+"</li>"+
            "<li>支付状态"+josnData.obj.ordersDetailList[i].paystatus+"</li>"+
            "<li>单价"+josnData.obj.ordersDetailList[i].price+"</li>"+
            "<li>折扣"+josnData.obj.ordersDetailList[i].rat+"e</li>"+
            "<li>数量"+josnData.obj.ordersDetailList[i].sl+"</li>"+
            "<li>颜色"+josnData.obj.ordersDetailList[i].ys+"</li>"+
            "</ul>";
    }
    for(var i in josnData.obj.wxOrderPickingList){
        orderPickingListHtml="<ul>"+
            "<li>价格"+josnData.obj.wxOrderPickingList[i].sellprice+"</li>"+
            "<li>尺码"+josnData.obj.wxOrderPickingList[i].cmcode+"</li>"+
            "<li>商品明细"+josnData.obj.wxOrderPickingList[i].spmc+"</li>"+
            "<li>明细码"+josnData.obj.wxOrderPickingList[i].mxcode+"</li>"+
            "<li>商品号"+josnData.obj.wxOrderPickingList[i].spcode+"</li>"+
            "<li>数量"+josnData.obj.wxOrderPickingList[i].amount+"</li>"+
            "<li>拣货数量"+josnData.obj.wxOrderPickingList[i].jhsl+"</li>"+
            "</ul>";
    }
    $("#header").append(headerHtml)
    $("#ordersDetailList").append(ordersDetailListHtml)
    $("#orderPickingList").append(orderPickingListHtml)
});