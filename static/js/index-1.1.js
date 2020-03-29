$(function(){
    emailTab();
    loginTab();
    msgSend();
    zanTab();
    usersitTab();
    usercomTab();
});
/* 邮箱验证 */
function emailTab(){
    $('#register_reg').click(function(){
        // 1.清空以前的错误信息
        $("#register_error_emailError").empty();
        // 2.获取邮箱输入的值，判断邮箱是否为空
        let email = $("#email").val();
        console.log(email);
        // trim()函数是用来去除空格的,注：此方法只适用于id属性获取的值
        if(email.trim().length==0){
            $("#register_error_emailError").text("请输入注册邮箱");
            return;
        }
        // 6.判断是否发送了验证码,class属性名后面是否存在senging
        if($(this).hasClass("sending")){
            // 若存在sending，就执行return，执行return后下面的都不会执行
            return;
        }
        // 3.向后端传输数据以验证邮箱格式是否正确
        let ths = $(this);
        let time = 60;
        $.ajax({
            url:'/useremail/',
            data:{email:email},
            type:'post',
            dataType:'json',
            headers : {
                'Content-Type' : 'application/x-www-form-urlencoded'
            },
            success:function(arg){
                // 4.如果回调函数的ret.status != True
                if(!arg.status){
                   // 5.返回前端错误信息
                    $("#register_error_emailError").text(arg.emailError);
                }else{
                    // 5.开始计时
                    ths.addClass('sending'); //{# 在class属性名后面添加sending
                    // setInterval()函数的用法与setTimeout完全一致，区别仅仅在于setInterval 指定
                    // 某个任务每隔一段时间就执行一次，也就是无限次的定时执行。注：1000 毫秒= 1 秒。
                    let interval = setInterval(function(){
                        ths.text("已发送("+time+")");
                        time -= 1;
                        if(time<=0){
                            // 当时间小于等于0秒时清除执行函数interval
                            clearInterval(interval);
                            // 移除class添加的sending
                            ths.removeClass('sending');
                            // 还原标签的文本信息
                            ths.text("获取验证码");
                        }
                    },1000);
                };
            },
        });
    });
}
/* 注册验证 */
function registerTab(ths){
    // 1.清空以前的错误信息
    $('#register_error_emailError').empty();
    $("#formes .register_Msg .error").remove();
    $(ths).children(':eq(0)').addClass('hide');
    $(ths).addClass('not-allow').children(':eq(1)').removeClass('hide');
    /* 循环获取input的name和input的值以键值关系存入字典中,通过ajax可向后端传值 */
   /* var formes = {};
    $('#model_register input').each(function(){
        formes[$(this).attr("name")] = $(this).val();
    }); */
    let formes = $("#formes").serialize();
    $.ajax({
        url:"/register/",
        type: "post",
        data:formes,
        dataType: "json",
        headers: {'Content-Type' : 'application/x-www-form-urlencoded'},
        success:function(arg){
            if(!arg.status){
                $.each(arg.registerError,function (k,v) {
                    let tag = document.createElement("p");
                    tag.className = "error";
                    tag.innerText = v[0]['message'];
                    tag.style = "color:red;font-size:12px;";
                    $('#formes input[name="'+k+'"]').after(tag);
                })
            }else{
                alert("注册成功");
                window.location.href = '/index';
            }
        }
    });
    $(ths).removeClass('not-allow').children(':eq(1)').addClass('hide');
    $(ths).children(':eq(0)').removeClass('hide');
}
/* 登录验证 */
function loginTab(){
    $("#loginSend").click(function(){
        $("#loginForm .login_Msg .error").remove();
        /*var forms={};
        $('#login_Msg input').each(function(){
            formes[$(this).attr('name')] = $(this).val();
            console.log(formes[$(this).attr('name')]);
        });*/
        let forms = $("#loginForm").serialize();
        $.ajax({
            url:"/login/",
            data:forms,
            type:"POST",
            dataType:'json',
            headers:{'Content-Type' : 'application/x-www-form-urlencoded'},
            success:function(arg){
                if (!arg.status){
                    $.each(arg.registerError,function(k,v){
                        let tag = document.createElement("p");
                        tag.className = "error";
                        tag.innerText = v[0]["message"];
                        tag.style = "color:red;font-size:12px;";
                        /*bottom:0;border:1px solid black;" +
                            "width:200px;height:20px;margin-left:100px;*/
                        $("#login_Msg input[name='"+k+"']").after(tag);
                    })
                }else{
                    alert("登录成功");
                    location.href="/index/";
                }
            }
        });
    })
}

/* 消息发布 */
function msgSend(){
    $("#buttonSend").click(function(){
        let dic = new FormData();
        dic.append('title', $("#title").val());
        dic.append('textmsg', $("#textmsg").val());
        dic.append('url', $("#url").val());
        dic.append('selectmsg', $("#selectmsg").val());
        dic.append('userfile', document.getElementById('userfile').files[0]);
        $.ajaxSetup({
        　　data: {csrfmiddlewaretoken: '{{ csrf_token }}' },
        });
        $.ajax({
            url:"/index/",
            type:"post",
            data:dic,
            dataType:"json",
            processData:false,
            contentType:false,
            success:function(ret){
                if (ret.success){
                   alert("发布成功");
                   location.reload();
                }
            }
        })
    });
}

/* 点赞功能 */
function zanTab(){
    $("#messages").on('click','#zan',function(){
        let tds=$(this).parent().children("#msg-id").text();
        let tdp=$(this).parent().children("#zan-num")[0];
        let tdc=$(this).parent().children("#zan")[0];
        $(tdp).remove();
        let username = $("#usern").text();
        $.ajax({
            url:"/zan/",
            type:"post",
            data:{id:tds, username:username},
            dataType:'json',
            headers:{'Content-Type' : 'application/x-www-form-urlencoded'},
            success: function(arg){
                let num = document.createElement("span");
                num.innerText = arg.num;
                num.style = "margin-left:5px;";
                num.id = "zan-num";
                $(tdc).after(num);
            }
        });
    });      
}
/* 用户设置 */
function usersitTab(){
    $("#sitSend").click(function(){
        let dic = new FormData();
        dic.append('username', $("#usern").text());
        dic.append('rev_name', $("#rev_name").val());
        dic.append('rev_email', $("#rev_email").val());
        dic.append('rev_pwd', $("#rev_pwd").val());
        dic.append('imgfile', document.getElementById('imgfile').files[0]);
        console.log($("#usern").text());
        $.ajax({
            url:"/usersit/",
            type:"post",
            data:dic,
            processData:false,
            contentType:false,
            dataType:"json",
            success:function(arg){
                if(arg.success){
                    alert("修改成功"),
                    location.href="/logout/";
                }else{
                    alert("修改失败");
                }
            },
        });
    })
}
/* 用户评论 */
function usercomTab(){
    // 评论的发布
    $("#comment-submit").click(function(){
        let tds=$("#msg-id").text();
        let username = $("#usern").text();
        let coms = $("#msg-com").val();
        url = "/comment-"+ tds +"/" ;
        let bols = false;
        $.ajax({
            url:url,
            type:"post",
            data:{id:tds, username:username, comment:coms, bols:bols},
            dataType:'json',
            headers:{'Content-Type' : 'application/x-www-form-urlencoded'},
            success: function(arg){
                alert("评论成功");
                $("#msg-com").val("");
                let num = document.createElement("span");
                num.innerText = arg.num;
                num.style = "margin-left:5px;";
                num.id = "com-id";
                $("#com-id").remove();
                $("#comments").after(num);
            }
        });
    });
    // 回复评论
    $("#msg_comments").on("click","#replay-submit",function(){
        let id=$(this).parent().prev().text();
        let coms=$(this).parent().children("#replay-com").val();
        let username = $("#usern").text();
        let tds = $("#msg-id").text();
        url = "/comment-"+ tds +"/" ;
        let bols = true;
        $.ajax({
            url:url,
            type:"post",
            data:{tds:tds, id:id, username:username, comment:coms, bols:bols},
            dataType:'json',
            headers:{'Content-Type' : 'application/x-www-form-urlencoded'},
            success: function(arg){
                alert("评论成功");
                // $().val("");
            }
        });
    });
    // 删除评论
    $(".content").on("click","#delete-submit",function(){
        let id = $(this).parent().prev().children("#msg-id").text();
        let puk = $(this).parent().parent().parent();
        console.log(puk[0]);
        $.ajax({
            url:"/management/",
            type:"post",
            data:{id:id},
            dataType:'json',
            headers:{'Content-Type' : 'application/x-www-form-urlencoded'},
            success: function(arg){
                alert("删除成功");
                $(puk).remove();
            }
        });
    });

}






