$(function(){
    userTab();
    userlogin();
    userregister();
    sendTab();
    sitTab();
});
// 用户下拉信息详情
function userTab(){
    $(".user").click(function () { 
        $(".user_sonpage").slideToggle("show");
    });
};
// 用户登录
function userlogin(){
    $("#userLogin").click(function(){
        $(".box").show();
        $(".login").show();
    });
    $(".iconfont").click(function(){
        $(".box").hide();
        $(".login").hide();
    });
}
// 用户注册
function userregister(){
    $('#userRegister').click(function(){
        $(".box").show();
        $(".register").show();
    });
    $(".iconfont").click(function(){
        $(".box").hide();
        $(".register").hide();
    })
}
// 信息发布
function sendTab(){
    $('#left_title_send').click(function(){
        $(".box").show();
        $(".user_send").show();
    });
    $(".iconfont").click(function(){
        $(".box").hide();
        $(".user_send").hide();
    })
}
// 设置
function sitTab(){
    $("#settings").click(function(){
        $(".box").show();
        $(".user_sitting").show();
    });
    $(".iconfont").click(function(){
        $(".box").hide();
        $(".user_sitting").hide();
    })
}


