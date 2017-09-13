$(document).on('pjax:complete', function() {
    checke_menu();
});

$(function(){
    var pathname = window.location.pathname
    checke_menu();
    $(".J_menuItem").each(function (index, item) {
        if($(item).attr('href') == pathname){
            $(item).parent().parent().addClass('in');
            $(item).parent().parent().attr('aria-expanded', "true");
        }
    });
});

//选中当前菜单
function checke_menu() {
    var pathname = window.location.pathname
    $(".J_menuItem").each(function (index, item) {
        $(item).css('color', '')
        if($(item).attr('href') == pathname){
            $(item).parent().parents('li').addClass('active');
            return $(item).css('color', 'white');
        }
    });
}