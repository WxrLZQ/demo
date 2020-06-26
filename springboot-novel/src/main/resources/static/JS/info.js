$(document).ready(function(){
    $("#top-nav-more").hover(function(){
        $(".dropdown").show().css('background','#3e3d43');
    }, function () {
        $(".dropdown").hide();
    });
    $(".dropdown").hover(function(){
        $(this).show();
    }, function () {
        $(this).hide();
    });
});

