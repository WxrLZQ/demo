$(function(){
    
    // 移进移出箭头显示
    $(".play").mouseover(function(){
        $(".play div").css("display","block");
    });
    $(".play").mouseout(function(){
        $(".play div").css("display","none");
    });
    // 轮播图

    var index=0;//li索引
    
    var $play=$(".play ul:first li");
    var len=$play.length-1;
    var $key=$(".key li");
    var timer = null;
    
    $key.hover(function(){
        index=$(this).index();   
        $key.css("opacity",0.6)
        $(this).css("opacity",1)
        play();

    });

    function play(){
        $play.css("display","none");
        $play.eq(index).css("display","block");
        $key.css("opacity",0.6)
        $key.eq(index).css("opacity",1)
    }

    function auto(){
        timer = setInterval(function(){
            index++;
            if (index>len) {
                index=0;
                console.log(index);
            }
            play();
        },2000)
    }
    auto();

    //移入停止播放
    $(".play").hover(function(){
        clearInterval(timer);
    },function(){
        auto();
    })

    // 点击左右耳朵
    $(".l").click(function(){
        index--;
        if (index<0) {
            index=len;
        }
        play();
    })
    $(".r").click(function(){
        index++;
        if (index>len) {
            index=0
        }
        play();
    })

    //列表间色
    function licolor(){
        var lic=$(".new_info li");
        
        for(i=2;i<11;i=i+4){
            console.log("111111111111");
            lic.eq(i).css("background-color","#f1f1f1");
            lic.eq(i+1).css("background-color","#f1f1f1");
        }
    } 
    licolor();
    //list
    $(".gamelist_nav li:not(.change)").hover(function(){
        $(this).addClass("change");
    },function(){
        $(this).removeClass("change");
    })
})