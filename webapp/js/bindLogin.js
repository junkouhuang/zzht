$(function(){
    //输入框正在输入时
    $("#username,#password").on('input',function(){
        if(!($('#username').val()=='')){
            $(".clearUsername img").css("display","block")
        }else{
            $(".clearUsername img").css("display","none")
        }
        if(!($('#password').val()=='')){
            $(".clearPassword img").css("display","block")
        }else{
            $(".clearPassword img").css("display","none")
        }
    })
    $(".clearUsername").on('click',function(){
        $('#username').val('');
        $(".clearUsername img").css("display","none")
    });
    $(".clearPassword").on('click',function(){
        $('#password').val('');
        $(".clearPassword img").css("display","none");
    });
})