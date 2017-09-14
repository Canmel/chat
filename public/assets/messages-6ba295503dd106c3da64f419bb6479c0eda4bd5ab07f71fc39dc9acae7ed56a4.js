$(function () {
    $(".btn-examin").click(function () {
        $("#examine_form").attr("action", "/messages/" + $(this).attr("meesage") + "/to_examine");
        $("#myModal").modal("show");
    });
    $(".btn-primary").click(function () {
        $("#examine_form").submit();
    });

    $('.popover-show').popover();
});

$(document).on('pjax:complete', function() {
    $(".btn-examin").click(function () {
        $("#examine_form").attr("action", "/messages/" + $(this).attr("meesage") + "/to_examine");
        $("#myModal").modal("show");
    });
    $(".btn-primary").click(function () {
        $("#examine_form").submit();
    });
    $('.popover-show').popover();
});
