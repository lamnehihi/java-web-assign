$(function () {
    $(document).scroll(function () {
        var $nav = $("#top-bar");
        $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
    });
    var $arrow1 = $(".carousel-control-prev");
    var $arrow2 = $(".carousel-control-next");
    var $ol = $(".carousel-indicators");
    $('.carousel').hover(
            function () {
                $arrow1.removeClass('hover');
                $arrow2.removeClass('hover');
                $ol.removeClass('hover')
            },
            function () {
                $arrow1.addClass('hover');
                $arrow2.addClass('hover');
                $ol.addClass('hover')
            },
            )
});